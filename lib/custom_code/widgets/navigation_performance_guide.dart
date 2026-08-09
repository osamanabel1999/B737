// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NavigationPerformanceGuide extends StatefulWidget {
  const NavigationPerformanceGuide({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<NavigationPerformanceGuide> createState() =>
      _NavigationPerformanceGuideState();
}

class _NavigationPerformanceGuideState
    extends State<NavigationPerformanceGuide> {
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
          _buildSectionTitle('NAVIGATION PERFORMANCE'),
          _buildInfoCard([
            _buildDataRow(
              'Maximum Flight Operating Latitudes',
              '82N through 82S',
              isWarning: true,
            ),
            _buildDataRow(
              'Operating Latitude Exceptions',
              '80W–130W (70N) and 120E–160E (60S)',
              isWarning: true,
            ),
            _buildDataRow(
              'Non-ILS LNAV Approach RNP',
              '0.3 NM',
            ),
            _buildDataRow(
              'RNP Specified on Approach Plate',
              'Use as specified',
            ),
            _buildDataRow(
              'Air Data Inertial Reference Unit\n(ADIRU)',
              'ADIRU alignment must not be attempted at latitudes greater than 78°15"',
              isWarning: true,
            ),
            _buildDataRow(
              'Global Positioning System (GPS)\n(AFM)',
              'GPS updating must be disabled for approach operation when operating outside the United States National Airspace, if the FMC database and charts are not referenced to WGS-84 reference datum, unless other appropriate procedures are used.',
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
