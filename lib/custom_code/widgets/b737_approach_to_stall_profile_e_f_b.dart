// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B737ApproachToStallProfileEFB extends StatefulWidget {
  const B737ApproachToStallProfileEFB({
    Key? key,
    this.width,
    this.height,
    this.referenceImageUrl, // Parameter for the uploaded reference image
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? referenceImageUrl;

  @override
  _B737ApproachToStallProfileEFBState createState() =>
      _B737ApproachToStallProfileEFBState();
}

class _B737ApproachToStallProfileEFBState
    extends State<B737ApproachToStallProfileEFB> {
  // --- Dark Mode Aviation Theme Colors ---
  final Color bgColor = const Color(0xFF0B1120); // Deep EFB Dark Background
  final Color cardColor = const Color(0xFF1E293B); // Dark Slate for Cards
  final Color accentBlue = const Color(0xFF38BDF8); // Boeing Cyan Accent
  final Color textWhite = const Color(0xFFF8FAFC); // Main Readability Text
  final Color textGrey = const Color(0xFF94A3B8); // Secondary Text
  final Color greenEngaged = const Color(0xFF4ADE80); // FMA Engaged Green
  final Color warningAmber = const Color(0xFFFBBF24); // Aviation Amber
  final Color criticalOrange = const Color(0xFFF97316); // MAX THROTTLE etc.

  // Legends colors from image
  final Color cleanColor = const Color(0xFF22C55E); // Green for Clean
  final Color turningColor = const Color(0xFF2563EB); // Blue for Turning
  final Color landingColor = const Color(0xFF9333EA); // Purple for Landing

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      color: bgColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildAviationNoteCard(), // Top general note
            const SizedBox(height: 16),
            _buildLegendsCard(),
            const SizedBox(height: 16),
            _buildCleanConfigurationCard(),
            const SizedBox(height: 16),
            _buildTurningConfigurationCard(),
            const SizedBox(height: 16),
            _buildLandingConfigurationCard(),
            const SizedBox(height: 16),
            _buildBottomSectionData(), // Notes, graphs, tables
            const SizedBox(height: 24),
            _buildReferenceChartSection(), // Summarized Section with Zoom
            const SizedBox(height: 24),
            _buildSafetyFooter(), // Footer for Page 13
          ],
        ),
      ),
    );
  }

  // --- Helper UI Builders ---

  // 1. Header Section
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "APPROACH TO STALL",
              style: TextStyle(
                  color: textWhite,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            Text(
              "B737 PROFILES",
              style: TextStyle(
                  color: textGrey, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          "PF = Pilot Flying  |  PM = Pilot Monitoring",
          style: TextStyle(color: textGrey, fontSize: 14),
        ),
        const SizedBox(height: 12),
        Container(
          height: 1.5,
          width: double.infinity,
          color: textWhite.withOpacity(0.1),
        ),
      ],
    );
  }

  // 2. Aviation Note Card (Top general note)
  Widget _buildAviationNoteCard() {
    return _buildCard(
        padding: const EdgeInsets.all(12.0),
        content: Text(
          "These recovery procedures are for low altitude, minimum altitude loss situations with terrain as a factor. If an indication of an impending stall is encountered at cruising altitude, the wing may have to be unloaded. It may be necessary to lower the pitch attitude below the horizon to trade altitude for airspeed.",
          style: TextStyle(color: warningAmber, fontSize: 13, height: 1.4),
        ));
  }

  // 3. Legend Card
  Widget _buildLegendsCard() {
    return _buildCard(
      padding: const EdgeInsets.all(12.0),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _legendItem("Clean Config", cleanColor),
          _legendItem("Turning Config", turningColor),
          _legendItem("Landing Config", landingColor),
        ],
      ),
    );
  }

  Widget _legendItem(String text, Color color) {
    return Row(
      children: [
        Icon(Icons.flight_takeoff, color: color, size: 16),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: textWhite, fontSize: 12)),
      ],
    );
  }

  // 4. CLEAN Configuration Card
  Widget _buildCleanConfigurationCard() {
    return _buildConfigCard(
      title: "CLEAN CONFIGURATION",
      color: cleanColor,
      leftContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "Recovery objective: Accelerate to normal maneuvering speed with no altitude loss"),
        ],
      ),
      middleContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boldText("IN-RANGE CHECK"),
          _stepText(
              "Set seat back so shoulders do not leave the seat when you throw the throttles forward. This will keep the control column hand stationary."),
          const SizedBox(height: 8),
          _stepTextCheckbox("A/P ON *"),
          _stepTextCheckbox("AT ON, set top bug"),
          const SizedBox(height: 12),
          Text(
              "A/T OFF\nA/P OFF\nDeselect HDG\n*Deselect ALT HOLD...\nSET 40% N1",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
          const SizedBox(height: 8),
          _criticalNote(
              "MAX THROTTLE - push throttles to their mechanical stops, using finger tips if necessary..."),
          const SizedBox(height: 8),
          _boldText("Reference Control instruments:"),
          _stepText("ADI - Hold pitch attitude. Power - Pull to entry N1."),
        ],
      ),
      rightContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stepText(
              "Set pitch from step 2.\nA/T ON, set top bug.\nA/P ON **\nSet up for next maneuver."),
        ],
      ),
    );
  }

  // 5. TURNING Configuration Card
  Widget _buildTurningConfigurationCard() {
    return _buildConfigCard(
      title: "TURNING CONFIGURATION",
      color: turningColor,
      leftContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText("Flaps 5, Gear down, 20° bank"),
          _bulletText(
              "Recovery objective: Maintain altitude and accelerate to Flaps 5 maneuvering"),
        ],
      ),
      middleContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boldText("IN-RANGE CHECK"),
          _stepTextCheckbox("A/P ON *"),
          _stepTextCheckbox("AT ON (set spd VM 0)"),
          _bulletText("FLAPS 1, set V M 1"),
          _bulletText("FLAPS 5, set V M 5"),
          _bulletText("GEAR DOWN, LANDING CHECK"),
          _bulletText("SET 50% N1"),
          const SizedBox(height: 12),
          Text(
              "A/T OFF\nA/P OFF\nDeselect HDG\n*Deselect ALT HOLD...\nSET 50% N1",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
          const SizedBox(height: 8),
          _stepText(
              "Establish 20° bank.\nShaker at ± 18° (1 g.)\nDo not lose any altitude."),
          const SizedBox(height: 8),
          _criticalNote(
              "MAX THROTTLE - push throttles to their mechanical stops."),
        ],
      ),
      rightContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stepText(
              "Return to entry speed.\nA/T ON (set spd at 190).\nA/P ON **\nSet up for next maneuver."),
        ],
      ),
    );
  }

  // 6. LANDING Configuration Card
  Widget _buildLandingConfigurationCard() {
    return _buildConfigCard(
      title: "LANDING CONFIGURATION",
      color: landingColor,
      leftContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText("Flaps 30, Gear down"),
          _bulletText(
              "Recovery objective: Maintain altitude and accelerate to Flaps 30 Target"),
        ],
      ),
      middleContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stepTextCheckbox("A/P ON **"),
          _stepTextCheckbox("AT ON"),
          _bulletText("FLAPS 15, LANDING CHECK"),
          _bulletText("FLAPS 30 (Set target)."),
          const SizedBox(height: 12),
          Text(
              "A/T OFF\nA/P OFF\nDeselect HDG\n*Deselect ALT HOLD...\nSET 50% N1",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
          const SizedBox(height: 8),
          _stepText("Lots of drag. Do not lose any altitude."),
          const SizedBox(height: 8),
          _criticalNote(
              "MAX THROTTLE - push throttles to their mechanical stops."),
          const SizedBox(height: 8),
          _stepText("Performance instruments:\nAirspeed and altimeter."),
        ],
      ),
      rightContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boldText("SET TOP BUG"),
          _bulletText(
              "Clean up:\nFLAPS 15, (Positive rate) GEAR UP, FLAPS 5, FLAPS 1, FLAPS UP..."),
          _stepText("On your altitude:\nA/T ON\nA/P ON **"),
        ],
      ),
    );
  }

  // 7. Bottom Section Data (Notes, graphs, tables)
  Widget _buildBottomSectionData() {
    return _buildCard(
      padding: const EdgeInsets.all(12.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("* EFIS aircraft\n** 3 STEPS TO ENGAGE A/P (set spd)",
              style: TextStyle(color: textGrey, fontSize: 12)),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _stepText("This APPROACH REF page shows..."),
                    const SizedBox(height: 8),
                    _buildFmcRefDataTable(),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: Text(
                    "NOTE: Consider pitch change with power change. An increase in power pitches the nose up.",
                    style: TextStyle(color: landingColor, fontSize: 12)),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: _buildFlapManeuverSpeedsTable(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFmcRefDataTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        TableRow(children: [
          _tableHeader("APPROACH REF"),
          _tableHeader("FLAPS"),
          _tableHeader("VREF"),
        ]),
        _tableRow("GROSS WT 107.4", "15°", "142 KT"),
        _tableRow("GA N1 93.4 / 93.4%", "30°", "132 KT"),
        _tableRow("RWY 12000 FT", "40°", "128 KT"),
      ],
    );
  }

  Widget _buildFlapManeuverSpeedsTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.5),
      },
      children: [
        TableRow(children: [
          _tableHeader("Flaps"),
          _tableHeader("≤ 117.0°"),
          _tableHeader("> 117.0°"),
        ]),
        _tableRowSpeed("0", "210", "220"),
        _tableRowSpeed("1", "190", "200"),
        _tableRowSpeed("5", "180", "190"),
        _tableRowSpeed("10", "170", "180"),
        _tableRowSpeed("15", "150", "160"),
        _tableRowSpeed("25", "140", "150"),
      ],
    );
  }

  // Helper for table widgets
  Widget _tableHeader(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: accentBlue, fontWeight: FontWeight.bold, fontSize: 11)),
      );

  TableRow _tableRow(String label1, String label2, String label3) =>
      TableRow(children: [
        _tableCell(label1),
        _tableCell(label2, textAlign: TextAlign.center),
        _tableCell(label3, textAlign: TextAlign.center),
      ]);

  TableRow _tableRowSpeed(String flap, String speed1, String speed2) =>
      TableRow(children: [
        _tableCell(flap, textAlign: TextAlign.center),
        _tableCell(speed1, textAlign: TextAlign.center),
        _tableCell(speed2, textAlign: TextAlign.center),
      ]);

  Widget _tableCell(String text, {TextAlign textAlign = TextAlign.start}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(text,
            textAlign: textAlign,
            style: TextStyle(color: textWhite, fontSize: 11)),
      );

  // 8. Reference Chart Section (summarized image with zoom option)
  Widget _buildReferenceChartSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.map, color: accentBlue),
            const SizedBox(width: 8),
            Text(
              "REFERENCE CHART VIEWER",
              style: TextStyle(
                  color: accentBlue, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: accentBlue.withOpacity(0.3)),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                "Upload the reference chart image (Page 13) to view it here, where you can study the full flowchart and summary. Zoom in/out is available.",
                style: TextStyle(color: textGrey, fontSize: 13, height: 1.4),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  if (widget.referenceImageUrl != null &&
                      widget.referenceImageUrl!.isNotEmpty) {
                    _openZoomableImage(context, widget.referenceImageUrl!);
                  }
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white10,
                  child: widget.referenceImageUrl != null &&
                          widget.referenceImageUrl!.isNotEmpty
                      ? InteractiveViewer(
                          panEnabled: true,
                          minScale: 1.0,
                          maxScale: 6.0,
                          child: Image.network(
                            widget.referenceImageUrl!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Center(
                          child: Icon(Icons.broken_image,
                              color: textGrey, size: 48)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _openZoomableImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: cardColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.close, color: textWhite),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text("Chart Zoom", style: TextStyle(color: textWhite)),
          ),
          body: Center(
            child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(20),
              minScale: 1.0,
              maxScale: 6.0,
              child: Image.network(imageUrl),
            ),
          ),
        ),
      ),
    );
  }

  // 9. Safety Footer
  Widget _buildSafetyFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: textWhite.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: textWhite.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded,
                  color: Colors.redAccent, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "ALL LIMITS ARE CRITICAL - EXCEEDING THEM MAY COMPROMISE SAFETY.",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Page 13", style: TextStyle(color: textGrey, fontSize: 12)),
              Row(
                children: [
                  Icon(Icons.shield, color: greenEngaged, size: 16),
                  const SizedBox(width: 6),
                  Text("FLY SAFE",
                      style: TextStyle(
                          color: textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Helper Layout Builders ---

  Widget _buildCard({required Widget content, EdgeInsetsGeometry? padding}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child:
          padding != null ? Padding(padding: padding, child: content) : content,
    );
  }

  Widget _buildConfigCard({
    required String title,
    required Color color,
    required Widget leftContent,
    required Widget middleContent,
    required Widget rightContent,
  }) {
    return _buildCard(
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.flight_takeoff, color: color, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: leftContent),
                _buildDivider(),
                Expanded(flex: 3, child: middleContent),
                _buildDivider(),
                Expanded(flex: 2, child: rightContent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() => Container(
      width: 1,
      height: 150,
      color: textWhite.withOpacity(0.1),
      margin: const EdgeInsets.symmetric(horizontal: 12));

  Widget _bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(color: textWhite, fontSize: 16)),
          Expanded(
            child: Text(text,
                style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
          ),
        ],
      ),
    );
  }

  Widget _stepTextCheckbox(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_box_outline_blank, color: textGrey, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
          ),
        ],
      ),
    );
  }

  Widget _criticalNote(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(text,
          style: TextStyle(
              color: criticalOrange,
              fontSize: 13,
              height: 1.4,
              fontStyle: FontStyle.italic)),
    );
  }

  Widget _boldText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(text,
          style: TextStyle(
              color: accentBlue, fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  Widget _stepText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(text,
          style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
    );
  }
}
