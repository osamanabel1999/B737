// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B737TraditionalStepDownEFB extends StatefulWidget {
  const B737TraditionalStepDownEFB({
    Key? key,
    this.width,
    this.height,
    this.referenceImageUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? referenceImageUrl;

  @override
  _B737TraditionalStepDownEFBState createState() =>
      _B737TraditionalStepDownEFBState();
}

class _B737TraditionalStepDownEFBState
    extends State<B737TraditionalStepDownEFB> {
  // --- Dark Mode Aviation Theme Colors (Professional EFB Style) ---
  final Color bgColor = const Color(0xFF0B1120);
  final Color cardColor = const Color(0xFF1E293B);
  final Color accentBlue = const Color(0xFF38BDF8);
  final Color textWhite = const Color(0xFFF8FAFC);
  final Color textGrey = const Color(0xFF94A3B8);
  final Color greenEngaged = const Color(0xFF4ADE80);
  final Color warningAmber = const Color(0xFFFBBF24);
  final Color redWarning = const Color(0xFFEF4444);

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
            _buildTolerancesBriefCard(),
            const SizedBox(height: 16),
            _buildApproachSequenceSection(),
            const SizedBox(height: 16),
            _buildDetailedNotesCard(),
            const SizedBox(height: 16),
            _buildNonPrecisionApproachSection(),
            const SizedBox(height: 16),
            _buildFlapSpeedsTable(),
            const SizedBox(height: 24),
            _buildReferenceChartSection(),
            const SizedBox(height: 24),
            _buildSafetyFooter(),
          ],
        ),
      ),
    );
  }

  // 1. Header Section
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.airplanemode_active, color: textWhite, size: 24),
                const SizedBox(width: 8),
                Text(
                  "VOR, LOC, NDB, LOC (Back Crs)",
                  style: TextStyle(
                      color: textWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "B737 PROFILES",
              style: TextStyle(
                  color: textGrey, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          "(Traditional Step-Down Technique)",
          style: TextStyle(
              color: accentBlue, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "PF = Pilot Flying  |  PM = Pilot Monitoring",
          style: TextStyle(color: textGrey, fontSize: 12),
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

  // 2. Tolerances & Brief Card
  Widget _buildTolerancesBriefCard() {
    return _buildCardWithTitle(
      title: "TOLERANCES & BRIEF APPROACH",
      icon: Icons.track_changes,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("TOLERANCES",
                    style: TextStyle(
                        color: warningAmber, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                _bulletText("A/S: -5/+10 kts"),
                _bulletText("MDA: +50/-0 ft"),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: textWhite.withOpacity(0.1),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("BRIEF APPROACH",
                    style: TextStyle(
                        color: warningAmber, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                _bulletText("Complete IN RANGE CHECKLIST"),
                _bulletText("Use autothrottle and autopilot"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. Approach Sequence Section
  Widget _buildApproachSequenceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSequencePhaseCard(
            title: "DOWNWIND",
            phaseDescription:
                "Downwind, 7 nm prior to FAF on straight-in, or 3 nm prior to procedure turn outbound.",
            pfAction: "PF: FLAPS 1, SPEED*",
            icon: Icons.flight_takeoff),
        const SizedBox(height: 12),
        _buildSequencePhaseCard(
            title: "NO LATER THAN TURNING BASE",
            phaseDescription:
                "5 nm prior to FAF on a straight-in, or 1 nm prior to procedure turn outbound.",
            pfAction: "PF: FLAPS 5, SPEED*",
            icon: Icons.flight_land,
            isWarning: true),
        const SizedBox(height: 12),
        _buildSequencePhaseCard(
            title: "CLEARED APPROACH",
            phaseDescription:
                "Engage VNAV as early as possible. Set MCP to zero.",
            pfAction:
                "VOR or LOC approach: Arm VOR LOC.\nNDB or LOC / BC approach: Use LNAV or HDG SEL.",
            icon: Icons.flight),
      ],
    );
  }

  // Helper function for Sequence Phase Cards
  Widget _buildSequencePhaseCard(
      {required String title,
      required String phaseDescription,
      required String pfAction,
      required IconData icon,
      bool isWarning = false}) {
    return _buildCard(
      padding: const EdgeInsets.all(16.0),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: isWarning ? warningAmber : textWhite, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: isWarning ? warningAmber : textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  phaseDescription,
                  style: TextStyle(color: textWhite, fontSize: 13),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: greenEngaged, width: 1),
                  ),
                  child: Text(
                    pfAction,
                    style: TextStyle(
                        color: greenEngaged,
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 4. Detailed Notes Card
  Widget _buildDetailedNotesCard() {
    return _buildCardWithTitle(
      title: "DETAILED NOTES (Traditional Technique)",
      icon: Icons.notes,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _numberedNote("1",
              "VOR, LOC, NDB, LOC (Back Crs) approach with visibility equal to or less than 1 mi or 5000 RVR requires monitored approach procedure and autothrottles and autopilot if available."),
          _numberedNote("2",
              "For LOC or VOR approach: If charted wpts match wpts in FMC, consider using LNAV. Single FMC w/o GPS use VOR LOC, (EXP displays TCAS & radar). LNAV keeps things simple... MP in Map mode for situational awareness."),
          _numberedNote("3",
              "For NDB or LOC (Back Crs) approach, use LNAV or HDG SEL. If using LNAV, shooting an 'overlay' approach; raw data must be monitored and is controlling."),
          _numberedNote("4",
              "At each ALT HOLD, set next altitude and stay ahead of the airplane. Vertical work is the most difficult task of this approach."),
          _numberedNote("5",
              "At FAF, V/S down at least 1000 fpm - check your ground speed."),
          _numberedNote(
              "6", "At 1,000 ft AFE max V/S is 1,000 fpm. Level off at MDA."),
          _numberedNote("7",
              "At VDP with approach lights in sight, start down to 100' above TDZE. Cannot descend below 100' above TDZE unless visual reference to runway is established."),
          _numberedNote("8", "Disconnect AP at or prior to MDA minus 50'."),
          _numberedNote("9",
              "RA technique: Set to 250 ft AGL (300 ft w/o FAF). TERPS guarantees terrain clearance on final approach segment prior to MDA."),
          _numberedNote("10",
              "4 ways to compute Visual Descent Point (VDP) described in back."),
          _numberedNote("11",
              "If LEGS page has RNP / ANP, check ANP is less than RNP. Low ANP (.5 or less) indicates accurate FMC position."),
        ],
      ),
    );
  }

  // Helper widget for numbered notes
  Widget _numberedNote(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: textWhite.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              number,
              style: TextStyle(
                  color: textWhite, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  // 5. Non Precision Approach Section
  Widget _buildNonPrecisionApproachSection() {
    return _buildCardWithTitle(
      title: "NON PRECISION APPROACH - 1 ENGINE INOP",
      icon: Icons.error_outline_rounded,
      isAlert: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletTextAlert("Disconnect A/T prior to approach."),
          _bulletTextAlert(
              "1-1 1/2 miles from FAF:\nGEAR DOWN, FLAPS 15, TARGET*\nLANDING CHECK"),
          _bulletTextAlert("Reduce to VREF 15 + wind additive."),
          _bulletTextAlert("Review SE missed approach procedures."),
          const SizedBox(height: 8),
          Text(
            "If overweight, may delay gear and landing flaps until landing is assured.",
            style: TextStyle(
                color: textWhite, fontStyle: FontStyle.italic, fontSize: 13),
          ),
          const Divider(color: Colors.white12, height: 24),
          Text(
            "EXAMPLE: (stepdown to MDA)",
            style: TextStyle(
                color: warningAmber, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          _stepText("MDA = 750'"),
          _stepText(
              "At FAF:\nALT SEL . . . . . . . . . . . . . . . SET 800'\nV/S Thumbwheel . . . 1000-1500 fpm Down"),
          _stepText(
              "After ALT HOLD at 800': Set Missed Approach altitude. (Arms V/S)"),
          _stepText(
              "If still in IMC:\nV/S Thumbwheel . . . . . . . . . 500' Down\nAt 750' . . . . . . press ALT HOLD (Lead 20')"),
          _stepText(
              "At VDP with field in sight:\nFD bars may be used as reference or de-selected. To set FD bars using V/S, take 1/2 groundspeed and add zero (equals 2.8°)."),
          _stepText("A/P . . . . . DISENGAGE 50' below MDA min"),
        ],
      ),
    );
  }

  // Helper widget for step texts in alert card
  Widget _stepText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        text,
        style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
      ),
    );
  }

  // 6. Flap Speeds Table
  Widget _buildFlapSpeedsTable() {
    return _buildCardWithTitle(
      title: "FLAP MANEUVER SPEEDS (-300/500)",
      icon: Icons.speed,
      content: Table(
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
          _tableRow("0", "210 kts", "220 kts"),
          _tableRow("1", "190 kts", "200 kts"),
          _tableRow("5", "180 kts", "190 kts"),
          _tableRow("10", "170 kts", "180 kts"),
          _tableRow("15", "150 kts", "160 kts"),
          _tableRow("25", "140 kts", "150 kts"),
        ],
      ),
    );
  }

  // Helper for table widgets
  Widget _tableHeader(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(color: accentBlue, fontWeight: FontWeight.bold)),
      );

  TableRow _tableRow(String flap, String speed1, String speed2) =>
      TableRow(children: [
        _tableCell(flap, textAlign: TextAlign.center),
        _tableCell(speed1, textAlign: TextAlign.center),
        _tableCell(speed2, textAlign: TextAlign.center),
      ]);

  Widget _tableCell(String text, {TextAlign textAlign = TextAlign.start}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Text(text,
            textAlign: textAlign, style: TextStyle(color: textWhite)),
      );

  // 7. Reference Chart Section
  Widget _buildReferenceChartSection() {
    final bool hasImage = widget.referenceImageUrl != null &&
        widget.referenceImageUrl!.isNotEmpty;

    return _buildCardWithTitle(
      title: "APPROACH PROFILE DIAGRAM (Summarized)",
      icon: Icons.map_outlined,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText("Tap image to view in full screen with zoom controls."),
          const SizedBox(height: 12),
          if (hasImage)
            GestureDetector(
              onTap: () =>
                  _openChartFullScreen(context, widget.referenceImageUrl!),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: accentBlue.withOpacity(0.2), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.referenceImageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildImagePlaceholder(),
                  ),
                ),
              ),
            )
          else
            _buildImagePlaceholder(),
        ],
      ),
    );
  }

  // Placeholder widget
  Widget _buildImagePlaceholder() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.broken_image, color: textGrey, size: 48),
            const SizedBox(height: 8),
            Text(
              "No chart image available",
              style: TextStyle(color: textGrey, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  // Function to open chart full screen
  void _openChartFullScreen(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            AppBar(
              backgroundColor: cardColor,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                "Approach Profile - Page 4",
                style: TextStyle(color: textWhite),
              ),
            ),
            Expanded(
              child: Center(
                child: InteractiveViewer(
                  panEnabled: true,
                  boundaryMargin: const EdgeInsets.all(20),
                  minScale: 1.0,
                  maxScale: 6.0,
                  child: Image.network(imageUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 8. Safety Footer
  Widget _buildSafetyFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: textWhite.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: redWarning.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: redWarning, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "ALL LIMITS ARE CRITICAL - EXCEEDING THEM MAY COMPROMISE SAFETY.",
                  style: TextStyle(
                      color: textWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "DO NOT take off spd knob until you see flap movement.\nExtension of flaps from 15 to landing flap setting can be delayed at pilot's option if ceiling and visibility are relatively high.\nIf entire Missed Approach has been programmed.",
            style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
          ),
        ],
      ),
    );
  }

  // --- Helper UI Builders ---

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

  Widget _buildCardWithTitle(
      {required String title,
      required IconData icon,
      required Widget content,
      bool isAlert = false,
      bool isWarning = false}) {
    return _buildCard(
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: isAlert ? redWarning : accentBlue, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: isAlert ? redWarning : accentBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }

  Widget _bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(color: textWhite, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletTextAlert(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(color: redWarning, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
