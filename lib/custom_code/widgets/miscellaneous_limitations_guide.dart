// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class MiscellaneousLimitationsGuide extends StatefulWidget {
  const MiscellaneousLimitationsGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<MiscellaneousLimitationsGuide> createState() =>
      _MiscellaneousLimitationsGuideState();
}

class _MiscellaneousLimitationsGuideState
    extends State<MiscellaneousLimitationsGuide> {
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
          _buildSectionTitle('AUTOFLIGHT'),
          _buildInfoCard([
            _buildDataRow('Autopilot use after takeoff',
                'Do not engage autopilot below 500AFL'),
            _buildDataRow('Single Channel Operations during approach',
                'Autopilot shall not remain engaged below 50 FT AGL (AFM)'),
            _buildDataRow(
                'Aileron Trim', 'Must not be used with autopilot engaged'),
            _buildDataRow('Minimum Altitude during Non-ILS Approaches',
                'Autopilot must not be engaged below 50 FT below the MDA'),
            _buildDataRow('Dual Channel Autopilot Approaches', 'Prohibited',
                isLast: true),
          ]),
          const SizedBox(height: 24),
          _buildSectionTitle('COMMUNICATIONS'),
          _buildInfoCard([
            _buildDataRow(
              'HF Radio Operations',
              'If one HF radio is selected for transmission, deselect the other HF radio on all audio select panels to prevent audio interference.',
              isWarning: true,
            ),
            _buildDataRow(
              'HF Radio Power Output\n(From maintenance manual)',
              'Modulation Technique  |  Power Output\nUSB  |  400 Watts PEP\nAM  |  125 Watts',
              isLast: true,
            ),
          ]),
          const SizedBox(height: 24),
          _buildSectionTitle('FUEL'),
          _buildInfoCard([
            _buildDataRow('Minimum Dispatch Fuel',
                'See FAR 121.639, 121.647 (FM Part 1 Sec 6)'),
            _buildDataRow('Reserve Fuel (45 minutes)',
                '4,080 LBS (for manual flight planning purposes)'),
            _buildDataRow('Maximum Fuel Capacity',
                '46,000 LBS – 6,875 Gallons (6.7 lbs/U.S. gallon)'),
            _buildDataRow('Tank 1 and 2 Capacity', '8,600 LBS – 1,288 Gallons'),
            _buildDataRow('Center Tank Capacity', '28,800 LBS – 4,299 Gallons'),
            _buildDataRow(
                'Minimum Fuel for ground operation of Electrical Hydraulic Pumps',
                '1,675 LBS in related Main tank. (OM II – Hydraulics)'),
            _buildDataRow('Maximum Fuel Tank Temp', '49°C', isWarning: true),
            _buildDataRow('Minimum Inflight Tank Fuel Temp',
                'Jet A - 40°C, Jet A1 - 43°C',
                isWarning: true),
            _buildDataRow('Ballast Fuel', 'NOT AUTHORIZED', isWarning: true),
            _buildDataRow(
                'Crossfeed Valve', 'Must be closed for Takeoff & Landing',
                isWarning: true),
            _buildDataRow('Maximum Lateral Moment',
                'Main tanks 1 and 2 must be full if center tank contains more than 1000 LBS',
                isWarning: true),
            _buildDataRow(
              'Maximum Lateral Imbalance',
              [
                'Tank 1 and Tank 2 must be scheduled to ZERO',
                'Random fuel imbalance must not exceed 1000LBS for taxi, takeoff, flight or landing'
              ],
              isWarning: true,
            ),
            _buildDataRow(
              'Center Tank Fuel Pumps (AFM)',
              [
                'For Ground Ops, Center Tank Fuel Pump Switches must not be ON unless the center tank fuel quantity exceeds 1000 pounds, except when defueling or transferring fuel.',
                'Center Tank Fuel Pump Switches must be turned OFF when both center tank fuel pump LOW PRESSURE lights illuminate. If a center tank fuel pump LOW PRESSURE Light(s) illuminate during takeoff or climb, the center tank pump(s) may remain on until the climb attitude is reduced and the light(s) extinguish or workload allows for the pumps to be turned OFF.',
                'Center Tank Fuel Pumps must not be ON unless personnel are available in the flight deck to monitor LOW PRESSURE Lights.'
              ],
              isWarning: true,
            ),
            _buildDataRow('Fuel Specifications\n(Systems)',
                'Standard Fuels:\t\tJet A and Jet A-1\nAlternate Fuels:\t\tJP-5 and JP-8\nProhibited Fuels:\t\tJP-4 and Jet B'),
            _buildDataRow(
              'Refueling\n(Systems)\n\n(Do not operate HF or WX radar [except in test mode], ground equipment must be positioned under wing-tips, fuel supply unit and aircraft must be properly bonded [ground wires])',
              [
                'No.1 and No.2 Main tanks should normally be scheduled equally until full, additional fuel is then loaded into Center Tank.',
                'Main tanks must be scheduled full if the Center tank contains more than 1000 pounds. With less than 1000 pounds of center tank fuel, partial main tank fuel may be loaded provided the effects of balance have been considered.',
                'Recommended maximum nozzle pressure is 50 psi, this is approximately 300 U.S. gallons per minute.',
                'A fueling control panel containing all the controls required for operation of the refueling system is located in the lower leading edge of the right wing.'
              ],
              isLast: true,
            ),
          ]),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }

  Widget _buildDataRow(String title, dynamic valueContent,
      {bool isLast = false, bool isWarning = false}) {
    Color rowBgColor =
        isWarning ? warningColor.withOpacity(0.15) : Colors.transparent;
    Color titleColor = isWarning ? warningColor : textColor;
    Color valueColor = isWarning ? warningColor : subTextColor;

    Widget valueWidget;
    if (valueContent is String) {
      valueWidget = Text(
        valueContent,
        style: TextStyle(
          color: valueColor,
          fontSize: 14,
          height: 1.5,
          fontWeight: isWarning ? FontWeight.w600 : FontWeight.normal,
        ),
      );
    } else if (valueContent is List<String>) {
      valueWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: valueContent
            .map((text) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          color: valueColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          text,
                          style: TextStyle(
                            color: valueColor,
                            fontSize: 14,
                            height: 1.4,
                            fontWeight:
                                isWarning ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      );
    } else {
      valueWidget = const SizedBox();
    }

    return Container(
      decoration: BoxDecoration(
        color: rowBgColor,
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
                color: titleColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 6,
            child: valueWidget,
          ),
        ],
      ),
    );
  }
}
