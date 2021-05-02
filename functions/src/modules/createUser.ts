import * as functions from "firebase-functions";
import * as admin from'firebase-admin';

// Use this when cloud_function is able to use.
export const createUser = functions.https.onCall(async (data, context) => {
  var firebaseError = "";
  console.log(
    "function was called by user with id : " + context.auth?.uid || null
  );
  if (!data.email || !data.password) {
    return { status: "failure", message: "email or password not provided" };
  }
  const email = data.email;
  const password = data.password;

  const firebaseUser = await admin
    .auth()
    .createUser({ email: email, password: password })
    .catch((err) => {
      console.log("Firebase user creation error" + err);
      firebaseError = err;
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
