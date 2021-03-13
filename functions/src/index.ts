import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import * as createUser from './createUser';
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
admin.initializeApp();
exports.createUser = createUser.createUser;
// exports.createUser = require('./createUser');
