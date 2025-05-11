class Event {
  static const String collectionName = 'Events';

  String id;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavoret;
  String lat;
  String lon;

  Event({
    this.id = '',
    required this.image,
    required this.title,
    required this.time,
    required this.dateTime,
    required this.description,
    required this.eventName,
    this.isFavoret = false,
    required this.lat,
    required this.lon,
  });

  // من JSON إلى كائن
  Event.fromFirStore(Map<String, dynamic> data)
      : this(
          id: data['id'] ?? '',
          image: data['image'] ?? '',
          title: data['title'] ?? '',
          time: data['time'] ?? '',
          description: data['description'] ?? '',
          eventName: data['eventName'] ?? '',
          isFavoret: data['isFavoret'] ?? false,
          lat: data['lat'] ?? '', 
          lon: data['lon'] ?? '',
          dateTime: data['dateTime'] != null
              ? DateTime.fromMillisecondsSinceEpoch(data['dateTime'])
              : DateTime.now(),
        );

  // من كائن إلى JSON
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
      'lat': lat,
      'lon': lon,
    };
  }
}
