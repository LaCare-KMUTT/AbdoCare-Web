import * as admin from "firebase-admin";
import * as functions from "firebase-functions";

const addDays = (date: Date, days: number): Date => {
  const result = new Date(date);
  result.setDate(result.getDate() + days);
  return result;
};

export const sendAppointmentNotification = functions.pubsub
  .schedule("")
  .onRun(async (context) => {
    const nowUnixTimestamp = Date.now();
    var start = new Date(nowUnixTimestamp * 1000);
    var end = addDays(start, 1);

    const appointmentsCollection = await admin
      .firestore()
      .collection("Appointments")
      .where("date", ">=", start)
      .where("date", "<", end)
      .get();

    const tokensCollection = (
      await admin.firestore().collection("Tokens").get()
    ).docs;
    appointmentsCollection.docs.forEach((appointment) => {
      const sameHnDoc = tokensCollection.find(
        (tokenDocs) => tokenDocs.data().hn === appointment.data().hn
      );
      if (sameHnDoc != null) {
        const token = sameHnDoc.data().token;
        const date = appointment.data().date;
        const time = appointment.data().time;
        const reason = appointment.data().reason;
        const preparation = appointment.data().preparation;
        const title = "คุณมีนัด";
        const body = "";
        sendNotification(token, title, body);
      }
    });
  });

const sendNotification = (token: string, title: string, body: string) => {
  const message = {
    notification: { title: title, body: body },
    token: token,
    data: { click_action: "FLUTTER_NOTIFICATION_CLICK" },
  };

  admin
    .messaging()
    .send(message)
    .then((response) => {
      return console.log("successful Message sent");
    })
    .catch((error) => {
      return console.log("Error Sending Message");
    });
};
