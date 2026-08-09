// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class B737AirspeedsGuide extends StatefulWidget {
  const B737AirspeedsGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<B737AirspeedsGuide> createState() => _B737AirspeedsGuideState();
}

class _B737AirspeedsGuideState extends State<B737AirspeedsGuide> {
  final Color bgColor = const Color(0xFF0B132B);
  final Color cardColor = const Color(0xFF1C2541);
  final Color headerColor = const Color(0xFF3A506B);
  final Color accentColor = const Color(0xFF5BC0BE);
  final Color textColor = const Color(0xFFFFFFFF);
  final Color subTextColor = const Color(0xFFA1A1AA);
  final Color warningColor = const Color(0xFFFBBF24);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('AIRSPEEDS'),
          _buildInfoCard([
            _buildDataRow('Maximum V Speed (Vmo)',
                '340 knots (observe Vmo pointer and gear/flap placards)'),
            _buildDataRow('Maximum Mach Operating Speed (Mmo)', '.82 Mach'),
            _buildDataRow('Turbulent Air Speed', '280K/.76M'),
            _buildDataRow('Maximum Landing Gear Extended', '320K/.82M'),
            _buildDataRow('Maximum Landing Gear Extension', '270K/.82M'),
            _buildDataRow('Maximum Landing Gear Retraction', '235K'),
            _buildDataRow('Maximum Speed with 1 LED stuck-out',
                '300K/.65M (280KIAS in turbulence-QRH, FLT-C)'),
            _buildDataRow(
                'Maximum Speed with > 1 LED stuck-out.', '230K (QRH, FLT-C)'),
            _buildDataRow(
                'Maximum Alternate Flap Extension Speed', '230K (QRH, FLT-C)'),
            _buildDataRow('Elevator Tab Limit Cycle Oscillation (LCO) Speed',
                '270K or less or until the vibration ceases (QRH, FLT-C)',
                isLast: true),
          ]),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: accentColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: headerColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _buildDataRow(String title, String value, {bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: headerColor, width: 1)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                color: subTextColor,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
