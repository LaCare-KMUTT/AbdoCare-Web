import * as functions from "firebase-functions";
import { copyDoc } from "./copyDocument";
import { deleteDoc } from "./deleteDocument";

export const moveDocument = functions.https.onCall(async (data, context) => {
  console.log(
    "function was called by user with id : " + context.auth?.uid || null
  );
  if (!data.userId) {
    return {
      status: "failure",
      message: "Bad request: UserId is not provided!",
    };
  }
  const userId = data.userId;
  const collectionFrom = data.collectionFrom;
  const collectionTo = data.collectionTo;

  const copied = await copyDoc(collectionFrom, userId, collectionTo, {}, true);

  // if copy was successful, delete the original
  if (copied) {
    await deleteDoc(`${collectionFrom}/${userId}`);

    return {
      status: "success",
      message: "Success moving documents",
    };
  }
  return {
    status: "failure",
    message:
      "Data was not copied properly to the target collection, please try again.",
  };
});
