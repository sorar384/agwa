// ignore_for_file: file_names
// ignore: camel_case_types
class firebaseDBModel {
  firebaseDBModel({
    // required this.petname,
    required this.longitude,
    required this.latitude,
  });

  // String petname;
  String longitude;
  String latitude;

  factory firebaseDBModel.fromjson(json) => firebaseDBModel(
        //   petname: json['petname'],
        longitude: json['longitude'],
        latitude: json['latitude'],
      );

  tojson() => {
        //    'petname': petname,
        'longitude': longitude,
        'latitude': latitude,
      };
}
