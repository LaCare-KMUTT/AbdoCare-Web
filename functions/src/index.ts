import * as admin from "firebase-admin";
import * as createUser from "./modules/createUser";

admin.initializeApp();
exports.createUser = createUser.createUser;
