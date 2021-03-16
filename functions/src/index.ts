import * as admin from "firebase-admin";
import * as createUser from './createUser';


admin.initializeApp();
exports.createUser = createUser.createUser;
