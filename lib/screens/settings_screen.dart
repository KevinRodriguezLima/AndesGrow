import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../data/mock_data.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final TextEditingController plotNameController;
  late final TextEditingController cropController;
  late final TextEditingController minHumidityController;
  late final TextEditingController maxHumidityController;
  late final TextEditingController maxTensionController;
  late final TextEditingController criticalTensionController;

  @override
  void initState() {
    super.initState();

    final settings = MockData.plotSettings;

    plotNameController = TextEditingController(text: settings.plotName);
    cropController = TextEditingController(text: settings.cropType);
    minHumidityController = TextEditingController(
      text: settings.minHumidity.toString(),
    );
    maxHumidityController = TextEditingController(
      text: settings.maxHumidity.toString(),
    );
    maxTensionController = TextEditingController(
      text: settings.maxTension.toString(),
    );
    criticalTensionController = TextEditingController(
      text: settings.criticalTension.toString(),
    );
  }

  @override
  void dispose() {
    plotNameController.dispose();
    cropController.dispose();
    minHumidityController.dispose();
    maxHumidityController.dispose();
    maxTensionController.dispose();
    criticalTensionController.dispose();
    super.dispose();
  }

  void saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Configuración guardada en modo demo')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            const Text(
              'Parámetros del cultivo',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: AppTheme.darkText,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Ajusta los datos usados para generar recomendaciones de riego.',
              style: TextStyle(color: AppTheme.mutedText, fontSize: 15),
            ),
            const SizedBox(height: 22),

            const _SectionTitle(
              icon: Icons.agriculture,
              title: 'Datos generales',
            ),
            const SizedBox(height: 12),

            TextField(
              controller: plotNameController,
              decoration: const InputDecoration(labelText: 'Nombre de parcela'),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: cropController,
              decoration: const InputDecoration(labelText: 'Tipo de cultivo'),
            ),

            const SizedBox(height: 24),

            const _SectionTitle(
              icon: Icons.water_drop,
              title: 'Umbrales de humedad',
            ),
            const SizedBox(height: 12),

            TextField(
              controller: minHumidityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Humedad mínima (%)',
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: maxHumidityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Humedad máxima (%)',
              ),
            ),

            const SizedBox(height: 24),

            const _SectionTitle(
              icon: Icons.speed,
              title: 'Umbrales de tensión',
            ),
            const SizedBox(height: 12),

            TextField(
              controller: maxTensionController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tensión máxima (kPa)',
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: criticalTensionController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tensión crítica (kPa)',
              ),
            ),

            const SizedBox(height: 26),

            FilledButton.icon(
              onPressed: saveSettings,
              icon: const Icon(Icons.save),
              label: const Text('Guardar configuración'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryGreen),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: AppTheme.darkText,
          ),
        ),
      ],
    );
  }
}
