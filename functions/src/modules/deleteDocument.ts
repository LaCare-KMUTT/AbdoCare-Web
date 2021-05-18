import admin from "firebase-admin";

export const deleteDoc = async (docPath: string): Promise<boolean> => {
  // document reference
  const docRef = admin.firestore().doc(docPath);

  // subcollections
  const subcollections = await docRef.listCollections();
  for await (const subcollectionRef of subcollections) {
    await subcollectionRef
      .get()
      .then(async (snapshot) => {
        const docs = snapshot.docs;
        for await (const doc of docs) {
          await deleteDoc(`${docPath}/${subcollectionRef.id}/${doc.id}`);
        }
        return true;
      })
      .catch((error) => {
        console.error(
          "Error reading subcollection",
          `${docPath}/${subcollectionRef.id}`,
          JSON.stringify(error)
        );
        return false;
      });
  }

  // when all subcollections are deleted, delete the document itself
  return docRef
    .delete()
    .then(() => true)
    .catch((error) => {
      console.error("Error deleting document", docPath, JSON.stringify(error));
      return false;
    });
};
