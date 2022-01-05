import * as admin from "firebase-admin";
import { createUser } from "./modules/createUser";
import { moveDocument } from "./modules/moveDocument";
import { sendAppointmentNotification} from "./modules/sendAppointmentNotification";

admin.initializeApp();
exports.createUser = createUser;
exports.moveDocument = moveDocument;
exports.sendAppointmentNotification = sendAppointmentNotification;
