import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export const copyDoc = async (
  collectionFrom: string,
  docId: string,
  collectionTo: string,
  addData: any = {},
  recursive = false
): Promise<boolean> => {
  // document reference
  const docRef = admin.firestore().collection(collectionFrom).doc(docId);

  // copy the document
  const docData = await docRef
    .get()
    .then((doc) => doc.exists && doc.data())
    .catch((error) => {
      console.error(
        "Error reading document",
        `${collectionFrom}/${docId}`,
        JSON.stringify(error)
      );
      throw new functions.https.HttpsError(
        "not-found",
        "Copying document was not read"
      );
    });

  if (docData) {
    // document exists, create the new item
    await admin
      .firestore()
      .collection(collectionTo)
      .doc(docId)
      .set({ ...docData, ...addData })
      .catch((error) => {
        console.error(
          "Error creating document",
          `${collectionTo}/${docId}`,
          JSON.stringify(error)
        );
        throw new functions.https.HttpsError(
          "data-loss",
          "Data was not copied properly to the target collection, please try again."
        );
      });

    // if copying of the subcollections is needed
    if (recursive) {
      // subcollections
      const subcollections = await docRef.listCollections();
      for await (const subcollectionRef of subcollections) {
        const subcollectionPath = `${collectionFrom}/${docId}/${subcollectionRef.id}`;

        // get all the documents in the collection
        return await subcollectionRef
          .get()
          .then(async (snapshot) => {
            const docs = snapshot.docs;
            for await (const doc of docs) {
              await copyDoc(
                subcollectionPath,
                doc.id,
                `${collectionTo}/${docId}/${subcollectionRef.id}`,
                true
              );
            }
            return true;
          })
          .catch((error) => {
            console.error(
              "Error reading subcollection",
              subcollectionPath,
              JSON.stringify(error)
            );
            throw new functions.https.HttpsError(
              "data-loss",
              "Data was not copied properly to the target collection, please try again."
            );
          });
      }
    }
    return true;
  }
  return false;
};
