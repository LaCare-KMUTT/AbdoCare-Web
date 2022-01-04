import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export const sendAppointmentNotification = functions.pubsub.schedule('').onRun((context) => {
    
});