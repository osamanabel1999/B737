// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class FlightInstrumentsGuide extends StatefulWidget {
  const FlightInstrumentsGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<FlightInstrumentsGuide> createState() => _FlightInstrumentsGuideState();
}

class _FlightInstrumentsGuideState extends State<FlightInstrumentsGuide> {
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
          _buildSectionTitle('FLIGHT INSTRUMENTS'),

          _buildSubTitle('HEADS UP DISPLAY (HUD)'),
          _buildInfoCard([
            _buildDataRow(
              'HUD and No. 1 Radio Altimeter',
              'Use of HUD with an inoperative Number 1 Radio Altimeter (RA) is prohibited. (AFM)',
            ),
            _buildDataRow(
              'HUD Modes',
              'NP – ILS approaches, terminal area or enroute flight.\nAI – CAT I approaches\nAII – CAT II approaches\nAIII – CAT III approaches, may be selected at any time above 500 ft AGL, needs up to seven seconds from selection to engagement (before reaching 500ft AGL).',
            ),
            _buildDataRow(
              'Glideslope Angle',
              'Default: 3°\nValid range: 2.00° to 4.00°\nAIII valid range: 2.5° to 3.0°',
            ),
            _buildDataRow(
              'Runway Length',
              'Default: 10,000 ft.\nValid range: 5000 to 15000 ft\nAIII valid range: 5500 to 13600 ft.',
            ),
            _buildDataRow(
              'Runway Elevation',
              'Default: -0- ft, when a runway is selected for departure or arrival, the navigation database runway elevation is set as the default.\nValid range: -1000 to 12000 ft.',
              isLast: true,
            ),
          ]),

          const SizedBox(height: 24),

          _buildSubTitle('RVSM OPERATIONS'),
          _buildInfoCard([
            _buildDataRow(
              'Maximum allowable in-flight difference between Captain and First Officer altitude displays',
              '200 Ft.',
            ),
            _buildDataRow(
              'Maximum allowable on-the-ground difference between Captain and First Officer altitude displays',
              '• 50 Ft. (From Sea Level to 5000 Ft.)\n• 60 Ft. (From 5001 to 10,000 Ft.)',
            ),
            _buildDataRow(
              'Maximum allowable on-the-ground difference between Captain or First Officer altitude displays and field elevation',
              '75 Ft.',
              isLast: true,
            ),
          ]),

          const SizedBox(height: 16),

          // Warning block for the final yellow highlighted RVSM note
          _buildWarningBlock([
            'Standby altimeter does not meet altimeter accuracy requirements of RVSM airspace.',
          ]),

          const SizedBox(height: 20),
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

  Widget _buildSubTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
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
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: TextStyle(
                color: subTextColor,
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
        children: warnings.map((text) => _buildWarningText(text)).toList(),
      ),
    );
  }

  Widget _buildWarningText(String text) {
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
