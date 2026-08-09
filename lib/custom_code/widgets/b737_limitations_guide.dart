// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class B737LimitationsGuide extends StatefulWidget {
  const B737LimitationsGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<B737LimitationsGuide> createState() => _B737LimitationsGuideState();
}

class _B737LimitationsGuideState extends State<B737LimitationsGuide> {
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
          _buildSectionTitle('ALTITUDE'),
          _buildInfoCard([
            _buildDataRow(
                'Maximum Operating Altitude (Service Ceiling)', '41,000 FT'),
            _buildDataRow('Maximum Takeoff Altitude', '8,400 FT'),
            _buildDataRow(
                'Minimum altitude for Autopilot use on Takeoff', '500 Ft AFL'),
            _buildDataRow('Maximum Flap Extension Altitude', '20,000 Ft.'),
            _buildDataRow(
                'Minimum Speedbrake Deployment Altitude', '1000 Ft. RA'),
            _buildDataRow('Final Flap Setting (Procedural)', '1000 Ft. AFL',
                isLast: true),
          ]),
          _buildSectionTitle('AMBIENT & ATMOSPHERIC'),
          _buildInfoCard([
            _buildDataRow(
                'Maximum/Minimum Takeoff and Landing\nTemperature Limits',
                '+54°C/-54°C'),
            _buildDataRow('Maximum Fuel Tank Temp', '+49°C'),
            _buildDataRow('Minimum Inflight Tank Fuel Temp',
                'Jet A - 40°C, Jet A1 - 43°C',
                isLast: true),
          ]),
          _buildSectionTitle('FLIGHT PLANNING & WEIGHT AND BALANCE'),
          _buildInfoCard([
            _buildDataRow('Operational Envelope',
                'Aircraft must only be operated within the approved weight and balance limits.'),
            _buildDataRow('Maximum Distance for Takeoff Alternate',
                '330NM (FM Part 1 Sec 6)',
                isLast: true),
          ]),
          _buildSectionTitle('RUNWAY CONDITIONS'),
          _buildInfoCard([
            _buildDataRow('Maximum Runway slope', '+/- 2%'),
            _buildDataRow(
                'Minimum Runway Width', '148FT/45 Meters\n(FM Part 1 Sec 6)'),
            _buildDataRow(
              'Takeoff Not Authorized under the following\nconditions: (FM Part 1 Sec. 8 pg 6)',
              '• More than 3 inches of dry snow\n• More than ½ inch of wet snow\n• More than ½ inch of slush or standing water\n• Chunks of hardened snow or ice',
              isLast: true,
            ),
          ]),
          _buildSectionTitle('WIND LIMITS'),
          _buildInfoCard([
            _buildDataRow('Maximum T/O & Landing Crosswind',
                '36Kts (Demonstrated, Company Policy)'),
            _buildDataRow('Maximum T/O & Landing Tailwind',
                '10Kts, Up to 15Kts only if specified by Special Takeoff and Landing Analysis in Performance Manual'),
            _buildCrosswindTable(),
            _buildDataRow(
                'Runway Width Less than Standard', '20Kts (FM Part 1 Sec 6)'),
            _buildDataRow('Maximum Tailwind for CAT II and CAT III', '10Kts'),
            _buildDataRow('Maximum Headwind for CAT II and CAT III', '25kts'),
            _buildDataRow('Maximum Wind Gust', '50Kts (Except in an emergency)',
                isLast: true),
          ]),
          _buildSectionTitle('AIR CONDITIONING AND PRESSURIZATION'),
          _buildInfoCard([
            _buildAlertRow(
                'With Engine Bleed Air Switches ON, do not operate the air conditioning packs in HIGH for takeoff, approach or landing.'),
            _buildDataRow(
                'Maximum Cabin Differential Pressure (System Relief):',
                '9.1 PSI'),
            _buildDataRow('Maximum Differential Pressure for T/O and Landing:',
                '0.125 PSI'),
            _buildAlertRow(
                'Use of wing anti-ice above approximately FL350 may cause bleed trip off and possible loss of cabin pressure.'),
            _buildDataRow(
                'Max Altitude for unpressurized flight following an inflight depressurization:',
                '14,000FT\n(may be exceeded for terrain avoidance)'),
            _buildDataRow(
                'Maximum Altitude when aircraft is dispatched for unpressurized flight:',
                '10,000FT',
                isLast: true),
          ]),
          const SizedBox(height: 20),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
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

  Widget _buildAlertRow(String text) {
    return Container(
      decoration: BoxDecoration(
        color: warningColor.withOpacity(0.15),
        border: Border(bottom: BorderSide(color: headerColor, width: 1)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: warningColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: warningColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCrosswindTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: headerColor, width: 1)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(color: headerColor, width: 1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Crosswind Limitations (Landing)',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBullet('Observe Most Restrictive Limit'),
                    _buildBullet(
                        'Rolling takeoff is strongly advised when crosswind exceeds 20 knots'),
                    _buildBullet('All winds include gusts'),
                    _buildBullet(
                        'May be further restricted for Restricted Captains (Exemption 5549, FM Part 1, Sec. 10)'),
                    _buildBullet(
                        'For dispatch to an airport, use steady state winds'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  _buildSubTableRow('Runway Condition', 'Limit',
                      isHeader: true),
                  _buildSubTableRow('Dry', '36'),
                  _buildSubTableRow('Fair', '20'),
                  _buildSubTableRow('Poor', '10'),
                  _buildSubTableRow('Visibility', '', isSubHeader: true),
                  _buildSubTableRow('Less than ¾ mi (4000 RVR)', '15'),
                  _buildSubTableRow('Less than ½ mi (1800 RVR)', '10'),
                  _buildSubTableRow('Instrument Approach', '',
                      isSubHeader: true),
                  _buildSubTableRow('Non-ILS (Less than ¾ mi 4000 RVR)', '15'),
                  _buildSubTableRow('CAT I ILS', '15'),
                  _buildSubTableRow('CAT II or CAT III', '10', isLast: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubTableRow(String key, String val,
      {bool isHeader = false, bool isSubHeader = false, bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isHeader
            ? headerColor
            : (isSubHeader ? cardColor.withOpacity(0.5) : Colors.transparent),
        border: isLast
            ? null
            : Border(
                bottom:
                    BorderSide(color: headerColor.withOpacity(0.5), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              key,
              style: TextStyle(
                color: isHeader
                    ? Colors.white
                    : (isSubHeader ? accentColor : subTextColor),
                fontSize: 12,
                fontWeight: isHeader || isSubHeader
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontStyle: isSubHeader ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ),
          if (val.isNotEmpty)
            Text(
              val,
              style: TextStyle(
                color: isHeader ? Colors.white : textColor,
                fontSize: 12,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(color: accentColor, fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: subTextColor, fontSize: 12, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Divider(color: Colors.white24),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '',
              style: TextStyle(color: subTextColor, fontSize: 10),
            ),
            Text(
              ' ',
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
