import * as functions from "firebase-functions";
import * as admin from "firebase-admin";


admin.initializeApp();
const db = admin.firestore();

export const sendNotifications =
    functions.firestore.document("/matches/{matchId}")
        .onUpdate(
            async (snapshot, context) => {
              const {user1, user2} = snapshot.after.data();
              const {matchId} = context.params;
              console.log(matchId);
              const user1Snapshot = await db.collection("users")
                  .where("userID", "==", user1.id).get();
              const user2Snapshot = await db.collection("users")
                  .where("userID", "==", user2.id).get();


              const user1Data = user1Snapshot.docs[0].data();

              const user2Data = user2Snapshot.docs[0].data();


              const user1InstanceToken = user1Data.instance_token;

              const user2InstanceToken = user2Data.instance_token;


              if (!user1InstanceToken || !user2InstanceToken) {
                return;
              }


              if (!user1.liked || !user2.liked) {
                return;
              }

              const documentRefrence = db.collection("chats").doc();

              await documentRefrence.set({
                chatID: documentRefrence.id,
                isActive: true,
                isStarted: false,
                lastMessage: "",
                lastMessageDate: null,
                messages: [],
                startingType: 0,
                user1: user1Data.userID,
                user2: user2Data.userID,
              });


              console.log(user1Data.chat);
              console.log(user2Data.chat.active_chats);

              const oldUser1Chats = user1Data.chat.active_chats;
              const oldUser2Chats = user2Data.chat.active_chats;

              oldUser1Chats.push(documentRefrence.id);
              oldUser2Chats.push(documentRefrence.id);

              await db.collection("users")
                  .doc(user1Snapshot.docs[0].id).update({
                    "chat.active_chats": oldUser1Chats,
                  });

              await db.collection("users")
                  .doc(user2Snapshot.docs[0].id).update({
                    "chat.active_chats": oldUser2Chats,
                  });

              try {
                await admin.messaging().sendToDevice(user1InstanceToken, {
                  data: {
                    chatID: documentRefrence.id,
                    user1ID: user1Data.userID,
                    user1Image: user1Data.images[0],
                    user1Name: user1Data.name,
                    user2ID: user2Data.userID,
                    user2Image: user2Data.images[0],
                    user2Name: user2Data.name,
                  },
                  notification: {
                    title: "Yeni bir eşleşmeniz var",
                  },
                });
              } catch (e:any) {
                console.log(e.toString());
                console.log("user1Error");
              }

              console.log("user1Message");

              try {
                await admin.messaging().sendToDevice(user2InstanceToken, {
                  data: {
                    chatID: documentRefrence.id,
                    user1ID: user1Data.userID,
                    user1Image: user1Data.images[0],
                    user1Name: user1Data.name,
                    user2ID: user2Data.userID,
                    user2Image: user2Data.images[0],
                    user2Name: user2Data.name,
                  },
                  notification: {
                    title: "Yeni bir eşleşmeniz var",
                  },
                });
              } catch (e:any) {
                console.log(e.toString());
                console.log("user2Error");
              }
              console.log("user2Message");
            }
        );


