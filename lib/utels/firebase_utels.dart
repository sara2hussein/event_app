import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/model/event.dart';

class FirebaseUtels {
  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore:
              (snapshot, options) => Event.fromFirStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(Event event) {
    var eventsCollection = getEventCollection();
    DocumentReference<Event> docRef = eventsCollection.doc();
    event.id = docRef.id;
   return docRef.set(event);
  }
}
