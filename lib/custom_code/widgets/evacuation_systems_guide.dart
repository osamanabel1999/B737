// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class EvacuationSystemsGuide extends StatefulWidget {
  const EvacuationSystemsGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<EvacuationSystemsGuide> createState() => _EvacuationSystemsGuideState();
}

class _EvacuationSystemsGuideState extends State<EvacuationSystemsGuide> {
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
          _buildSectionTitle('EVACUATION SYSTEMS'),

          // Yellow highlighted text mapped to warning block
          _buildWarningBlock([
            'Any time passengers are onboard prior to aircraft movement at least one floor level exit must be Open or Armed.',
            'Any time the airplane is in motion all door slides must be armed.',
          ]),

          const SizedBox(height: 16),

          // Standard bullet points mapped to info card
          _buildInfoCard([
            _buildStandardBullet(
                'Any time passengers are onboard and fueling is in-progress at least one flight attendant must be onboard and the Jetbridge or passenger stairs must be attached to the aircraft with an entry Door open. If stairs are not available, All useable exit doors must be closed and armed with a flight attendant manning each armed door or station (FM 1 Sec 7).'),
            _buildStandardBullet(
                'Electrical power must be provided to the aircraft prior to passenger boarding (FM 1 Sec 7).'),
            _buildStandardBullet(
              'Door 1L is the only door that may be opened with both engines running. Jetbridge must be attached.',
              isLast: true,
            ),
          ]),
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

  Widget _buildStandardBullet(String text, {bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: headerColor, width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ',
              style: TextStyle(
                  color: accentColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningBlock(List<String> warnings) {
    return Container(
      decoration: BoxDecoration(
        color: warningColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: warningColor.withOpacity(0.4), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: warnings.map((text) => _buildWarningBullet(text)).toList(),
      ),
    );
  }

  Widget _buildWarningBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ',
              style: TextStyle(
                  color: warningColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}
