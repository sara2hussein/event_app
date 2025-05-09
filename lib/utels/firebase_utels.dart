import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/model/event.dart';
import 'package:event_app/model/my_user.dart';

class FirebaseUtels {
  static CollectionReference<Event> getEventCollection(uId) {
    return getUsersCollection().doc(uId)
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore:
              (snapshot, options) => Event.fromFirStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore:
              (snapshot, options) => MyUser.fromFireStore(snapshot.data()!),
          toFirestore: (myUser, option) => myUser.toFireStore(),
        );
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String id) async {
    var querySnapShot = await getUsersCollection().doc(id).get();
   return querySnapShot.data();
  }

  static Future<void> addEventToFireStore(Event event, String uId) {
    var eventsCollection = getEventCollection(uId);
    DocumentReference<Event> docRef = eventsCollection.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }
}
