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
                    notificationType: "ON_MATCH",
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
                    notificationType: "ON_MATCH",
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

export const incrementLikeCount = functions.firestore
    .document("/users/{userId}")
    .onUpdate(async (snapshot, context) => {
      const userDataAfter = snapshot.after.data();
      const userDataBefore = snapshot.before.data();
      const {userId} = context.params;

      if (userDataAfter.users_who_liked_me.length >
        userDataBefore.users_who_liked_me.length
      ) {
        console.log(userId);

        await db.collection("users").doc(userId).update(
            {
              like_count: userDataAfter.users_who_liked_me.length,
            }
        );
      }
    });

export const controlVipProfiles = functions.pubsub
    .schedule("every 1800 minutes")
    .onRun(async (context) => {
      const appState = (await db.collection("app_state")
          .doc("92cGj96AJX07PtNIGqzN")
          .get())
          .data();

      console.log(appState);

      if (appState!.last_vip_profiles.length == 0) {
        const mostLikedProfiles = (await db.collection("users")
            .orderBy("like_count").limit(20).get()).docs;

        const newLastVipProfiles = appState!.last_vip_profiles;
        for (const profile of mostLikedProfiles) {
          const currentPorifleData = profile.data();
          const currentTime = Date.now();
          await db.collection("vip_profiles").add({
            userID: currentPorifleData.userID,
            time_selected: currentTime,
            like_count: currentPorifleData.users_who_liked_me.length,
          });
          newLastVipProfiles.push(currentPorifleData.userID);
        }
        await db.collection("app_state").doc("92cGj96AJX07PtNIGqzN").update({
          last_vip_profiles: newLastVipProfiles,
        });
      } else {
        const mostLikedProfiles = (await db.collection("users")
            .orderBy("like_count").get()).docs;

        const currentVipProfiles = (await db.collection("vip_profiles")
            .get()).docs;

        for (const profile of currentVipProfiles) {
          await db.collection("vip_collections").doc(profile.id).delete();
        }
        for (const profile of mostLikedProfiles) {
          const currentProfileData = profile.data();
          const currentTime = Date.now();
          if (!appState!.last_vip_profiles
              .includes(currentProfileData.userID)) {
            await db.collection("vip_profiles").add({
              userID: currentProfileData.userID,
              time_selected: currentTime,
              like_count: currentProfileData.users_who_liked_me.length,
            });
            const newLastVipProfiles = appState!.last_vip_profiles;
            newLastVipProfiles.push(currentProfileData.userID);
            await db.collection("app_state").doc("92cGj96AJX07PtNIGqzN")
                .update({
                  last_vip_profiles: newLastVipProfiles,
                });
          }
        }
      }
    });


export const deleteUnUsedHubs = functions.firestore
    .document("online_hubs/{hubID}")
    .onUpdate(async (snapshot, context) => {
      const {hubID} = context.params;
      const hubData = snapshot.after.data();

      if (hubData.users.length == 0) {
        await db.collection("online_hubs").doc(hubID).delete();
      }
    });

export const sendMessageNotififaction = functions.firestore
    .document("chats/{chatID}")
    .onUpdate(async (snapshot, context) => {
      const beforeChatData = snapshot.before.data();
      const afterChatData = snapshot.after.data();

      if (beforeChatData.messages.length < afterChatData.messages.length) {
        const lastMessage = afterChatData
            .messages[afterChatData.messages.length-1];
        const senderUser = lastMessage.senderId;
        let userToSendNotification;

        if (senderUser != afterChatData.user1) {
          userToSendNotification = (await db.collection("users")
              .where("userID", "==", afterChatData.user1).get()).docs[0].data();
        } else {
          userToSendNotification = (await db.collection("users")
              .where("userID", "==", afterChatData.user2).get()).docs[0].data();
        }

        if (!userToSendNotification.settings.instant_notifications.on_message) {
          return;
        }

        if (userToSendNotification.online_status) {
          return;
        }
        console.log(userToSendNotification);

        await admin.messaging()
            .sendToDevice(userToSendNotification.instance_token, {
              data: {
                userName: userToSendNotification.name,
                message: lastMessage.content,
                notificationType: "ON_MESSAGE",
              },
              notification: {
                title: "Yeni bir mesajınız var",
                body: lastMessage.content,
              },
            });
      }
    });

export const sendMessageLikeNotification = functions.firestore
    .document("chats/{chatID}")
    .onUpdate(async (snapshot, context) => {
      const {chatID} = context.params;
      const afterChatData = snapshot.after.data();
      const beforeChatData = snapshot.before.data();
      let senderId;
      let userToSendNotification;

      for (let i = 0; i < beforeChatData.messages.length; i++) {
        const afterMessage = afterChatData.messages[i];
        const beforeMessage = beforeChatData.messages[i];

        if (afterMessage.isLiked && !beforeMessage.isLiked) {
          senderId = afterMessage.senderId;
          break;
        }
      }

      if (afterChatData.user1 == senderId) {
        userToSendNotification = (await db.collection("users")
            .where("userID", "==", afterChatData.user1).get()).docs[0].data();
      } else {
        userToSendNotification = (await db.collection("users")
            .where("userID", "==", afterChatData.user1).get()).docs[0].data();
      }

      if (!userToSendNotification.settings.instant_notifications
          .on_message_like) {
        return;
      }

      await admin.messaging()
          .sendToDevice(userToSendNotification.instance_token, {
            data: {
              chatID: chatID,
              notificationType: "ON_MESSAGE_LIKE",
            },
            notification: {
              title: "Bir mesajınız beğenildi",
              body: `${userToSendNotification.name} bir mesajınızı beğendi`,
            },
          });
    });


