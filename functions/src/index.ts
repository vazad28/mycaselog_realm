
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';


admin.initializeApp()
//.... await admin.auth().setCustomUserClaims(uid, { role }); 

const generatePasscode = (): string => {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-#@%!&*';
    let result = '';
    const charactersLength = characters.length;
    for (let i = 0; i < 16; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
};

function dateTimeStringToMillisecondsSinceEpoch(dateTimeString: string): number | null {
    // Try parsing the string using Date.parse
    const parsedDate = new Date(dateTimeString);

    // Check if parsing was successful (returns NaN on failure)
    if (isNaN(parsedDate.getTime())) {
        return null; // Indicate parsing error
    }

    // Return milliseconds since epoch
    return parsedDate.getTime();
}


exports.setUserPasscode = functions.auth.user().onCreate(async (user) => {
    const passcode = generatePasscode();

    console.log('Generated passcode:', passcode); // Optional for logging

    /// Check if the user already has the moderator claim.
    const claims = await admin.auth().getUser(user.uid).then((userRecord) => userRecord.customClaims);

    if (claims && claims.mclPasscode) {
        console.log('passcode already exist:', passcode); // Optional for logging
        return;
    }

    //add custom claims
    await admin.auth().setCustomUserClaims(user.uid, {
        mclPasscode: passcode
    });

    // await admin.auth().setCustomUserClaims('m47m16xwCnTmQEjCce7iiU5DaGg2', {
    //     mclPasscode: 'mykutchu28'
    // });

    //Interesting to note: we need to re-fetch the userRecord, as the user variable **does not** hold the claim
    var userRecord = await admin.auth().getUser(user.uid);
    console.log(user.uid);
    console.log(userRecord.customClaims?.mclPasscode);

    /// get firestore instance
    const firestore = admin.firestore();

    /// path to user document
    const docPath = `users/${user.uid}/data`;

    // Create a new document in the "users" collection.
    const userDocument = firestore.collection(docPath).doc(user.uid);

    var creationTimestamp = dateTimeStringToMillisecondsSinceEpoch(userRecord.metadata?.creationTime);

    // Set the document data.
    const data = {
        userID: user.uid,
        displayName: user.displayName,
        email: user.email,
        photoUrl: user.photoURL,
        creationTime: creationTimestamp,
        lastSignInTime: creationTimestamp
    };

    /// write encryption key in vault collection
    firestore.collection("vault").doc(user.uid).set({ mclPasscode: passcode, email: user.email });

    // Write the document to Firestore.
    await userDocument.set(data);
});

/// CREATE LAST SYNC TIME
// Create a Cloud Function triggered by writes to the 'media' collection
// exports.lastCasesTimestamp = functions.firestore
//     .document('usersData/{userID}/cases/{docId}')
//     .onWrite(async (change, context) => {
//         /// get firestore instance
//         const firestore = admin.firestore();
//         const userID = context.params.userID;
//         // Prepare a write to 'last_timestamps' collection
//         const timestampRef = firestore.collection(`usersData/${userID}/last_timestamps`).doc('cases');
//         const timestamp = admin.firestore.Timestamp.now().toMillis();
//         const timestampData = { timestamp: timestamp };

//         // Write the timestamp to 'last_timestamps' collection
//         await timestampRef.set(timestampData);

//         console.log('Timestamp written to last_timestamps collection:', timestamp);
//     });

// exports.lastCasesTimestamp = functions.firestore
//     .document('usersData/{userID}/templates/{docId}')
//     .onWrite(async (change, context) => {
//         /// get firestore instance
//         const firestore = admin.firestore();
//         const userID = context.params.userID;
//         // Prepare a write to 'last_timestamps' collection
//         const timestampRef = firestore.collection(`usersData/${userID}/last_timestamps`).doc('templates');
//         const timestamp = admin.firestore.Timestamp.now().toMillis();
//         const timestampData = { timestamp: timestamp };

//         // Write the timestamp to 'last_timestamps' collection
//         await timestampRef.set(timestampData);

//         console.log('Timestamp written to last_timestamps collection:', timestamp);
//     });