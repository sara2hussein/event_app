class Event {
  static const String collectionName ='Events';
  String id;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavoret;
  Event({
    this.id = '',
    required this.image,
    required this.title,
    required this.time,
    required this.dateTime,
    required this.description,
    required this.eventName,
    this.isFavoret = false,
  });
  //json=>obj
  Event.fromFirStore( Map<String, dynamic> data ):this(
    id: data['id'],
    image: data['image'] ,
    title: data['title'] ,
    time:  data['time'],
    description: data['description'] ,
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
    eventName:  data['eventName'],
    isFavoret:  data['isFavoret'],
  );
  //obj=>json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'time': time,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'description': description,
      'eventName': eventName,
      'isFavoret': isFavoret,
    };
  }
}
