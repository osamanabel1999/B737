// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class IcingConditionsGuide extends StatefulWidget {
  const IcingConditionsGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<IcingConditionsGuide> createState() => _IcingConditionsGuideState();
}

class _IcingConditionsGuideState extends State<IcingConditionsGuide> {
  final Color bgColor = const Color(0xFF0B132B);
  final Color accentColor = const Color(0xFF5BC0BE);
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
          _buildSectionTitle('ICING CONDITIONS'),
          _buildWarningBlock(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: accentColor,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildWarningBlock() {
    return Container(
      decoration: BoxDecoration(
        color: warningColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: warningColor.withOpacity(0.4), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(
            'Icing Conditions are said to exist when the OAT/TAT is 10°C (50°F) or below and:',
            isBold: false,
          ),
          const SizedBox(height: 12),
          _buildWarningBullet(
            'Visible moisture in any form is present (Clouds, Fog with visibility of less than 1 mile, Rain, Sleet, Snow and Ice Crystals)',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                '-or-',
                style: TextStyle(
                  color: warningColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildWarningBullet(
            'When operating on ramps, taxiways or runways where surface snow, ice, standing water or slush may be ingested by the engines or freeze on the engines and nacelles.',
          ),
          const SizedBox(height: 16),
          _buildText(
            'Engine ignition must be ON when operating in icing conditions.',
            isBold: false,
          ),
          const SizedBox(height: 16),
          _buildText(
            'Engine Anti-Ice must be ON during all ground operations and flight operations when icing conditions exist or are anticipated except during climb and cruise below SAT of -40°C.',
            isBold: false,
          ),
          const SizedBox(height: 16),
          _buildText(
            'Do not operate engine or wing anti-Ice when the total air temperature (OAT/TAT) is above +10°C (50°F).',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text, {required bool isBold}) {
    return Text(
      text,
      style: TextStyle(
        color: warningColor,
        fontSize: 14,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
        height: 1.4,
      ),
    );
  }

  Widget _buildWarningBullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: TextStyle(
            color: warningColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: warningColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
