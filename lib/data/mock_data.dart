import '../models/plot_settings.dart';
import '../models/sensor_reading.dart';

class MockData {
  static const PlotSettings plotSettings = PlotSettings(
    plotName: 'Lote Norte',
    cropType: 'Arándanos',
    minHumidity: 30,
    maxHumidity: 45,
    maxTension: 40,
    criticalTension: 50,
  );

  static const String recommendationTitle = 'Iniciar riego';
  static const String recommendationMessage =
      'Se recomienda aplicar riego durante 20 minutos.';
  static const String recommendationReason =
      'La humedad del suelo está cerca del límite mínimo configurado para el cultivo.';

  static final SensorReading currentReading = SensorReading(
    date: DateTime(2026, 5, 11, 8, 30),
    humidity20: 28,
    humidity40: 34,
    soilTension: 42,
    temperature: 24.6,
    irrigationApplied: false,
    status: 'Riego recomendado',
  );

  static final List<SensorReading> history = [
    SensorReading(
      date: DateTime(2026, 5, 11, 8, 30),
      humidity20: 28,
      humidity40: 34,
      soilTension: 42,
      temperature: 24.6,
      irrigationApplied: false,
      status: 'Riego recomendado',
    ),
    SensorReading(
      date: DateTime(2026, 5, 10, 8, 30),
      humidity20: 36,
      humidity40: 39,
      soilTension: 31,
      temperature: 23.8,
      irrigationApplied: false,
      status: 'Estado normal',
    ),
    SensorReading(
      date: DateTime(2026, 5, 9, 8, 30),
      humidity20: 24,
      humidity40: 29,
      soilTension: 48,
      temperature: 25.1,
      irrigationApplied: true,
      status: 'Riego aplicado',
    ),
    SensorReading(
      date: DateTime(2026, 5, 8, 8, 30),
      humidity20: 32,
      humidity40: 35,
      soilTension: 37,
      temperature: 24.2,
      irrigationApplied: false,
      status: 'Observación',
    ),
  ];
}
