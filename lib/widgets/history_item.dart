import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../models/sensor_reading.dart';

class HistoryItem extends StatelessWidget {
  final SensorReading reading;

  const HistoryItem({super.key, required this.reading});

  String get formattedDate {
    final day = reading.date.day.toString().padLeft(2, '0');
    final month = reading.date.month.toString().padLeft(2, '0');
    final year = reading.date.year.toString();
    return '$day/$month/$year';
  }

  Color get statusColor {
    if (reading.status.toLowerCase().contains('recomendado')) {
      return AppTheme.warning;
    }

    if (reading.status.toLowerCase().contains('aplicado')) {
      return AppTheme.primaryGreen;
    }

    return AppTheme.mutedText;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppTheme.softGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.water_drop, color: AppTheme.primaryGreen),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.darkText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Humedad: ${reading.humidity20}% / ${reading.humidity40}%  ·  Tensión: ${reading.soilTension} kPa',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.mutedText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                reading.status,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
