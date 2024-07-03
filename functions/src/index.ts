
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


// exports.onUserUpdate = functions.firestore
//     .document('users/{userId}/data/{userId}') // Replace '{userId}' with a wildcard if needed
//     .onUpdate(async (change, context) => {
//         // const afterData = change.after.data();
//         // const beforeData = change.before.data();

//         // Access specific updated fields (optional)
//         // const updatedField = afterData.myField - beforeData.myField;

//         // Perform actions based on the update
//         console.log("User document with ID", context.params.userId, "updated");
//         // Add your function logic here
//         // You can access the updated and previous data using 'afterData' and 'beforeData'

//         //add custom claims
//         await admin.auth().setCustomUserClaims(context.params.userId, {
//             mclPasscode: 'mykutchu28'
//         });
//     });


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

// export const onCreateUser = functions.auth.user().onCreate(async (user) => {
//     const passcode = generatePasscode();
//     console.log('Generated passcode:', passcode); // Optional for logging

//     try {
//         // Check if the user already has the moderator claim.
//         const claims = await admin.auth().getUser(user.uid).then((userRecord) => userRecord.customClaims);

//         if (claims && claims.passcode) {
//             console.log('passcode already exist:', passcode); // Optional for logging
//             return;
//         }

//         // Set the custom user claims.
//         await admin.auth().setCustomUserClaims(user.uid, {
//             passcode: passcode,
//         });

//     } catch (error) {
//         console.error('Error adding custom claim:', error);
//     }
// });