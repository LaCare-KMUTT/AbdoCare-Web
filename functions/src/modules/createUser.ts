import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export const createUser = functions.https.onCall(async (data, context) => {
  let firebaseError = "";
  console.log(
    "function was called by user with id : " + context.auth?.uid || null
  );
  if (!data.email || !data.password) {
    console.error("no email: " + data.email + "no password:" + data.password);
    functions.logger.error(
      "email or password is not provided ",
      data.email,
      "< Email > password: ",
      data.password
    );
    return { status: "failure", message: "email or password not provided" };
  }
  const email = data.email;
  const password = data.password;

  const firebaseUser = await admin
    .auth()
    .createUser({ email: email, password: password })
    .then((value) => {
      functions.logger.info(
        "medicalTeam: ",
        context.auth?.uid,
        "is creating user: ", data.email
      );
      return value;
    })
    .catch((err) => {
      console.log("Firebase user creation error" + err);
      firebaseError = err;
      throw new functions.https.HttpsError(
        "unknown",
        "failed on creating : " + err
      );
    });
  if (firebaseUser) {
    return {
      status: "success",
      uid: firebaseUser.uid,
    };
  } else {
    return {
      status: "failure",
      message: "User Creation Error: " + firebaseError,
    };
  }
});
