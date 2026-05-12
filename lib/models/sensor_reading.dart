class SensorReading {
  final DateTime date;
  final int humidity20;
  final int humidity40;
  final int soilTension;
  final double temperature;
  final bool irrigationApplied;
  final String status;

  const SensorReading({
    required this.date,
    required this.humidity20,
    required this.humidity40,
    required this.soilTension,
    required this.temperature,
    required this.irrigationApplied,
    required this.status,
  });
}
