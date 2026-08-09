// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ApuLimitationsGuide extends StatefulWidget {
  const ApuLimitationsGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<ApuLimitationsGuide> createState() => _ApuLimitationsGuideState();
}

class _ApuLimitationsGuideState extends State<ApuLimitationsGuide> {
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
          _buildSectionTitle('ALTITUDES'),
          _buildInfoCard([
            _buildDataRow('Maximum APU Operating Altitude', '41,000 Ft.'),
            _buildDataRow(
                'Maximum APU Start Altitude', '41,000 Ft. (FL250 Recommended)'),
            _buildDataRow('Maximum APU Electrical Load Altitude', '41,000 Ft.'),
            _buildDataRow('Maximum APU Bleed Load Altitude', '17,000 Ft.'),
            _buildDataRow(
                'Maximum APU Combined Bleed and Electrical Load\nAltitude',
                '10,000 Ft.',
                isLast: true),
          ]),
          const SizedBox(height: 24),
          _buildInfoCard([
            _buildDataRow('Normal APU Fuel Source', 'Tank 1'),
            _buildDataRow('Alternate APU Fuel Source',
                'Center Tank with (L) CTR pump ON.'),
            _buildDataRow('Maximum APU Start Time', '120 Sec.'),
            _buildDataRow(
                'Minimum voltage for APU Start', '18V (Removed from OM)'),
            _buildDataRow('Time it takes for APU inlet door to close',
                '20 seconds after OFF selected. (wait 1+20 before selecting BATT off)'),
            _buildDataRow('APU Operation during refueling',
                'Do not attempt to start or shutdown APU while refueling is in progress due to the possibility of vapors igniting.',
                isLast: true),
          ]),
          const SizedBox(height: 24),
          _buildWarningBlock(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
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
          Text(
            'APU Bleed valve must be closed when:',
            style: TextStyle(
              color: warningColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildWarningBullet(
              'Ground Air is connected and isolation valve is open'),
          _buildWarningBullet('Engine No. 1 bleed valve is open'),
          _buildWarningBullet(
              'Isolation valve and engine No. 2 bleed valves are open'),
          const SizedBox(height: 12),
          Text(
            'APU bleed valve may be open during engine start, but avoid engine power above idle.',
            style: TextStyle(
              color: warningColor,
              fontSize: 13,
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ',
              style: TextStyle(
                  color: warningColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: warningColor,
                fontSize: 13,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
