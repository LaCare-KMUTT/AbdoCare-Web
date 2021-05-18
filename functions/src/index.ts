import * as admin from "firebase-admin";
import { createUser } from "./modules/createUser";
import { moveDocument } from "./modules/moveDocument";

admin.initializeApp();
exports.createUser = createUser;
exports.moveDocument = moveDocument;
