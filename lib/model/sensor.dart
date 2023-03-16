class Sensor {
  final double nut;
  final double o2;
  final double ph;
  final double temperature;

  Sensor(
      {required this.nut,
      required this.o2,
      required this.ph,
      required this.temperature});

  factory Sensor.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Sensor(
      nut: parser(json['nut']),
      o2: parser(json['02']),
      ph: parser(json['ph']),
      temperature: parser(json['temperature']),
    );
  }
}
