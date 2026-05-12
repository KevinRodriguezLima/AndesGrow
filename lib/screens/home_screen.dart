import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../data/mock_data.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/status_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = MockData.plotSettings;
    final reading = MockData.currentReading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AndesGrow'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    settings.plotName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.softGreen,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    settings.cropType,
                    style: const TextStyle(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'Monitoreo de riego y humedad del suelo',
              style: TextStyle(fontSize: 15, color: AppTheme.mutedText),
            ),
            const SizedBox(height: 20),

            RecommendationCard(
              title: MockData.recommendationTitle,
              message: MockData.recommendationMessage,
              reason: MockData.recommendationReason,
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Estado actual',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.darkText,
                    ),
                  ),
                ),
                Text(
                  'Hoy 08:30',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.95,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                StatusCard(
                  title: 'Humedad 20 cm',
                  value: '${reading.humidity20}%',
                  subtitle: 'Capa superficial',
                  icon: Icons.grass,
                ),
                StatusCard(
                  title: 'Humedad 40 cm',
                  value: '${reading.humidity40}%',
                  subtitle: 'Zona radicular',
                  icon: Icons.eco,
                ),
                StatusCard(
                  title: 'Tensión',
                  value: '${reading.soilTension} kPa',
                  subtitle: 'Esfuerzo hídrico',
                  icon: Icons.speed,
                ),
                StatusCard(
                  title: 'Temperatura',
                  value: '${reading.temperature}°C',
                  subtitle: 'Ambiente actual',
                  icon: Icons.thermostat,
                ),
              ],
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppTheme.softGreen,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.insights,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Predicción del día',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: AppTheme.darkText,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'La humedad podría bajar en las próximas horas.',
                          style: TextStyle(
                            color: AppTheme.mutedText,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Riego registrado correctamente'),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Registrar riego aplicado'),
            ),
          ],
        ),
      ),
    );
  }
}
