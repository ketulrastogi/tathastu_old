import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

exports.onUserCreate = functions.region("asia-east2")
.auth.user().onCreate((user) => {
    return admin.firestore().collection('users').doc(user.uid).set({
        uid: user.uid,
        email: (user.email === undefined || user.email === null) ? '' : user.email,
        phoneNumber: (user.phoneNumber === undefined || user.phoneNumber === null) ? '' : user.phoneNumber,
        createdOn: admin.firestore.FieldValue.serverTimestamp(),
    });
});
