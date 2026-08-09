// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class MiscLimitationsContinuedGuide extends StatefulWidget {
  const MiscLimitationsContinuedGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<MiscLimitationsContinuedGuide> createState() =>
      _MiscLimitationsContinuedGuideState();
}

class _MiscLimitationsContinuedGuideState
    extends State<MiscLimitationsContinuedGuide> {
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
          _buildSectionTitle('LANDING GEAR and TIRES'),
          _buildInfoCard([
            _buildDataRow(
              'Brakes',
              'Do NOT apply brakes until after touchdown',
              isWarning: true,
            ),
            _buildDataRow(
              'Tire Pressure',
              '195 PSI Minimum on stem pressure gauge',
            ),
            _buildDataRow(
              'Maximum Tire Speed',
              '196 Kts (225 Mph as specified on tire)',
              isLast: true,
            ),
          ]),
          const SizedBox(height: 24),
          _buildSectionTitle('OXYGEN'),
          _buildInfoCard([
            _buildDataRow(
              'Minimum Crew Oxygen for Dispatch',
              '1000 PSI Recommended, See Preflight and MEL 35-2 for pressure/temperature chart.',
            ),
            _buildDataRow(
              'Maximum Preflight Oxygen pressure',
              '1850 PSI',
            ),
            _buildDataRow(
              'Normal Duration of Passenger Oxygen',
              '12 mins',
              isLast: true,
            ),
          ]),
          const SizedBox(height: 24),
          _buildSectionTitle('POWERPLANT'),
          _buildInfoCard([
            _buildDataRow(
              'Powerplant',
              'CFM56-7B26\n22K, 24K, 26K, 27K Max Power Rating.\nProduces 26,400 LBS of static thrust at Sea Level (27,000 Lbs Thrust Bump Orange County (SNA) only)',
            ),
            _buildDataRow(
              'Reverse Thrust',
              'Intentional use of reverse thrust inflight is prohibited',
              isWarning: true,
            ),
            _buildDataRow(
              'Engine Display Markings',
              'RED: Maximum and Minimum\nAMBER: Caution limits\nGREEN: Normal limits',
              isWarning: true,
            ),
            _buildDataRow(
              'EEC Operations',
              'Both EEC\'s must be ON for Takeoff\nIf EECs are in Alternate mode for Takeoff:\n• Both EEC\'s must be in Alternate mode\n• 26K Max (27K Max at KSNA) takeoff thrust must be used\n• Do not use the FMS takeoff N1 or V-Speed values\n• Use of autothrottle for takeoff is prohibited',
              isWarning: true,
            ),
            _buildDataRow(
              'Engine Ignition Must Be On',
              'TILT OVER\nTakeoff [CONT or AUTO]\nIcing Conditions (Anti-ice operations) [CONT or AUTO]\nLanding [CONT or AUTO]\nTurbulence (Maneuvers [FLT])\nOperating in heavy rain [CONT]\nVolcanic Ash (QRH MISC, [FLT])\nEmergency Descents (Maneuvers/QRH 12.1 [CONT])\nTraining,Test & Thrust Bump Flights',
              isWarning: true,
              isLast: true,
            ),
          ]),
          const SizedBox(height: 24),
          _buildSectionTitle('FLIGHT DECK DOOR and ACCESS SYSTEM'),
          _buildInfoCard([
            _buildDataRow(
              'Reinforced Flight Deck Door and\nFlight Deck Access System (AFM)',
              'Accomplish Pre-Flight check prior to the first flight of the day',
              isWarning: true,
              isLast: true,
            ),
          ]),
          const SizedBox(height: 24),
          _buildSectionTitle('WEATHER RADAR'),
          _buildInfoCard([
            _buildDataRow(
              'Weather Radar',
              'Do not operate weather radar during fueling, near fuel spills, or people',
              isWarning: true,
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
