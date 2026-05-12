class PlotSettings {
  final String plotName;
  final String cropType;
  final int minHumidity;
  final int maxHumidity;
  final int maxTension;
  final int criticalTension;

  const PlotSettings({
    required this.plotName,
    required this.cropType,
    required this.minHumidity,
    required this.maxHumidity,
    required this.maxTension,
    required this.criticalTension,
  });
}
