// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B737V1CutProfileEFB extends StatefulWidget {
  const B737V1CutProfileEFB({
    Key? key,
    this.width,
    this.height,
    this.referenceImageUrl, // Parameter for the uploaded reference image
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? referenceImageUrl;

  @override
  _B737V1CutProfileEFBState createState() => _B737V1CutProfileEFBState();
}

class _B737V1CutProfileEFBState extends State<B737V1CutProfileEFB> {
  // --- Dark Mode Aviation Theme Colors ---
  final Color bgColor = const Color(0xFF0B1120); // Deep EFB Dark Background
  final Color cardColor = const Color(0xFF1E293B); // Dark Slate for Cards
  final Color accentBlue = const Color(0xFF38BDF8); // Boeing Cyan Accent
  final Color textWhite = const Color(0xFFF8FAFC); // Main Readability Text
  final Color textGrey = const Color(0xFF94A3B8); // Secondary Text
  final Color greenEngaged = const Color(0xFF4ADE80); // FMA Engaged Green
  final Color warningAmber = const Color(0xFFFBBF24); // Aviation Amber
  final Color criticalOrange =
      const Color(0xFFF97316); // Critical Steps (from image)
  final Color redReject = const Color(0xFFEF4444); // Alerts / Limitations

  // Unique layout colors from the legend in image_5.png
  final Color legendGreen = const Color(0xFF22C55E);
  final Color legendOrange = const Color(0xFFF97316);
  final Color legendBlue = const Color(0xFF2563EB);
  final Color legendPurple = const Color(0xFF9333EA);

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
            _buildHeader("V1 CUT", "Page 10"),
            const SizedBox(height: 16),
            _buildLegendsCard(),
            const SizedBox(height: 16),
            _buildNotesCard(),
            const SizedBox(height: 16),
            _buildTestBriefWarningSection(),
            const SizedBox(height: 16),
            _buildStartupPFPMCard(), // Stabilize to V1, Rotate section
            const SizedBox(height: 16),
            _buildDetailedV1CutDescriptionCard(), // The central detailed paragraph
            const SizedBox(height: 16),
            _buildProceduralStepsCard(), // The altitude and condition boxes
            const SizedBox(height: 16),
            _buildEngFailFireCheckFlowCard(),
            const SizedBox(height: 16),
            _buildManeuverSpeedsTable(),
            const SizedBox(height: 24),
            _buildReferenceChartSection(), // Summarized Section with Zoom
            const SizedBox(height: 24),
            _buildSafetyFooter(), // Footer for Page 10
          ],
        ),
      ),
    );
  }

  // --- Helper UI Builders ---

  // 1. Header Section
  Widget _buildHeader(String title, String pageNum) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: textWhite,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            Text(
              // تم إزالة كلمة const من هنا
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

  // 2. Legend Card
  Widget _buildLegendsCard() {
    return _buildCard(
      padding: const EdgeInsets.all(12.0),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _legendItem("Normal Takeoff", legendGreen),
          _legendItem("V1 Cut", legendOrange),
          _legendItem("Normal Go-around", legendBlue),
          _legendItem("1 Engine Go Around", legendPurple),
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

  // 3. Notes Card
  Widget _buildNotesCard() {
    return _buildCardWithTitle(
      title: "NOTES",
      icon: Icons.notes,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _numberedNote("1.", "Tell tower of Emergency and intentions."),
          _numberedNote("2.",
              "Stay on runway heading (Straight out to 800' AGL or unless terrain is a problem)."),
          _numberedNote("3.",
              "With autothrottle ON and in N1 mode, failed engine throttle advances 8°. This is the range of N1 equalization control."),
          _numberedNote("4.",
              "With autothrottle ON and in SPD mode, both thrust levers advance together to maintain the target speed."),
          _numberedNote("5.", "Turn autothrottle OFF for approach segment."),
          _numberedNote("6.", "Take extra time if necessary."),
          _numberedNote("7.",
              "As the FP, use your teammate to operate the MCP at your command."),
        ],
      ),
    );
  }

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

  // 4. TEST, BRIEF, Warning Section
  Widget _buildTestBriefWarningSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildCardWithTitle(
                  title: "Brief FA (TEST)",
                  icon: Icons.checklist_rtl_rounded,
                  content: Text(
                    "• Get WX\n• Brief approach\nPF: ONE ENG (INOP APPROACH AND LANDING CHECK)\n(Includes In Range, Approach, and Landing Checks and closes fuel crossfeed.)",
                    style:
                        TextStyle(color: textWhite, fontSize: 13, height: 1.4),
                  )),
              const SizedBox(height: 12),
              _buildCard(
                  padding: const EdgeInsets.all(12.0),
                  content: Text(
                    "Watch speed - flap limits.\n± 78% N1\nAutopilot is OK for maneuvering but no input to rudder.\nFuel balance - use center tank fuel; otherwise, Crossfeed open and pump out of \"dead engine\" (monitor).",
                    style: TextStyle(
                        color: warningAmber, fontSize: 13, height: 1.4),
                  ))
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            children: [
              _buildCardWithTitle(
                  title: "\"TEST\" Definition",
                  icon: Icons.quiz_outlined,
                  content: Text(
                    "T: Type of emergency.\nE: Evacuation necessary?\nS: Signal for brace and evacuation.\nT: Time available for preparation.\nNOTE: 4 bells is emergency.",
                    style:
                        TextStyle(color: textWhite, fontSize: 13, height: 1.4),
                  )),
              const SizedBox(height: 12),
              _buildCard(
                  padding: const EdgeInsets.all(12.0),
                  content: Text(
                    "Climb at L/D Max\nEFIS-green donut.\nNon-EFIS, check Eng Out page.\nConsider in-flight engine start.\nKeep yoke centered with feet and rudder trim.",
                    style: TextStyle(
                        color: warningAmber, fontSize: 13, height: 1.4),
                  ))
            ],
          ),
        )
      ],
    );
  }

  // 5. Startup PF/PM Card
  Widget _buildStartupPFPMCard() {
    return _buildCardWithTitle(
      title: "Stabilize to V1, Rotate",
      icon: Icons.flight_takeoff,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bulletText("Stabilize thrust 40 ± 5 % N1,"),
                _bulletText("Push to 70 - 80 % N1,"),
                _bulletText("Press TOGA (check A/T movement)\nCHECK POWER"),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: criticalOrange, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PM: V1, ROTATE",
                          style: TextStyle(
                              color: criticalOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(
                        "Rotate towards 13° pitch at 2.5° per sec. All engine liftoff attitude is 9 - 10°.",
                        style: TextStyle(
                            color: criticalOrange, fontSize: 13, height: 1.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                _bulletText("Anyone may call POWER LOSS"),
                _bulletText("Check max power."),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 6. Detailed V1 Cut Description (Central Box)
  Widget _buildDetailedV1CutDescriptionCard() {
    return _buildCard(
      padding: const EdgeInsets.all(16.0),
      content: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: legendOrange, width: 4)),
        ),
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.flight_land_rounded, color: legendOrange, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "V1 Cut Main Description (Detailed)",
                    style: TextStyle(
                        color: legendOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Smoothly apply lots of rudder to parallel runway centerline, then dig your heel into the floorboard to lock in that rudder position. Maintain heading and keep the control wheel centered. Yoke points to rudder that needs application. The sky-pointer is also useful. Don't exceed 10° heading change.\n\nRotate to initial go-around altitude of 13°. Higher than normal pitch force required for rotation because of failed engine (decrease in power provides less pitch-up).\n\nPM: POSITIVE RATE\nPF: GEAR UP\n\nMaintain visual reference to runway to maintain directional control until runway disappears under the nose.\nApply small rudder application with ankle movement to maintain constant heading and to keep control wheel centered.\nTrim pitch after established on V2.\nClimb at V2 for failure at V1 or if obstacle is present; otherwise, climb at V2 to V2 + 20, depending on when engine failed.\nTransition to FD.\nStraight out, keep heading within 5°. Takes about 4° rudder trim.",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }

  // 7. Procedural Steps (Altitude and Condition Boxes)
  Widget _buildProceduralStepsCard() {
    return _buildCardWithTitle(
      title: "PROCEDURAL STEPS & CONDITIONAL BOXES",
      icon: Icons.alt_route,
      content: Column(
        children: [
          _flowStep("1000' AFE and VREF30 + 15",
              "PF: LEVEL CHANGE, SET TOP BUG, FLAPS 5\n\nAt VM 5: PF: FLAPS 1\n\nAt VM 1: PF: FLAPS UP, AFTER T/O CHECK\n\nClimb to 3000 ft AFE at VM 0\n3000 AFE: VNAV or SET 250"),
          _flowStep("400' AGL Condition",
              "PF: HDG SEL or LNAV\nDeclare an emergency. You do have the gear up, don't you?"),
          _flowStep("At 800' ft AGL or published obstruction clearance",
              "PF: SET TOP BUG\n\nAccelerate in slight climb - 100 to 200 fpm.\n\nIf an engine fire occurs prior to 800' AFE or obstacle clearance altitude, at flap retraction altitude call:\nPF: SET TOP BUG, ENGINE FAIL / FIRE CHECK\nand complete through discharging the fire bottles.\nIf fire light extinguishes, test fire detection system."),
          _flowStep("Maintain takeoff flaps for close in turn:",
              "V2 - max bank angle 15° (salmon bug).\nV2+15 - up to 30° (white bug).")
        ],
      ),
    );
  }

  // 8. ENG FAIL / FIRE CHECK Flow
  Widget _buildEngFailFireCheckFlowCard() {
    return _buildCardWithTitle(
      title: "ENG FAIL / FIRE CHECK (Checkbox list)",
      icon: Icons.checklist_outlined,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("At V2 + 15 (bug)",
              style: TextStyle(color: textGrey, fontSize: 12)),
          const SizedBox(height: 6),
          _bulletTextCheckbox("PF: FLAPS 1"),
          _bulletTextCheckbox("At VM 1: PF: FLAPS UP"),
          _bulletTextCheckbox("SET MCT"),
          const Divider(color: Colors.white24, height: 16),
          _bulletText("ENG FAIL / FIRE CHECK"),
          _bulletText(
              "Press CON on N1 LIMIT page to move chevrons but don't pull the power back until you're at top bug."),
        ],
      ),
    );
  }

  // 9. Maneuver Speeds Table
  Widget _buildManeuverSpeedsTable() {
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
          _tableRow("0", "210", "220"),
          _tableRow("1", "190", "200"),
          _tableRow("5", "180", "190"),
          _tableRow("10", "170", "180"),
          _tableRow("15", "150", "160"),
          _tableRow("25", "140", "150"),
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

  // 10. Reference Chart Section (summarized image with zoom option)
  Widget _buildReferenceChartSection() {
    return _buildCardWithTitle(
      title: "APPROACH REF (Page 10 Reference Chart)",
      icon: Icons.map_outlined,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "Tap image to view in full screen with zoom controls for detailed flowchart analysis."),
          const SizedBox(height: 12),
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
                  widget.referenceImageUrl ??
                      'https://via.placeholder.com/600x400/1E293B/F8FAFC?text=V1+Cut+P.10+Detailed+Flowchart',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildImagePlaceholder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Placeholder widget when image fails to load
  Widget _buildImagePlaceholder() {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.white10,
      child: Center(
        child: Icon(Icons.broken_image, color: textGrey, size: 48),
      ),
    );
  }

  // Function to open chart full screen with zoom
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
                "Approach Chart Flowchart - Page 10",
                style: TextStyle(color: textWhite),
              ),
            ),
            Expanded(
              child: Center(
                child: InteractiveViewer(
                  panEnabled: true, // Set to false to prevent panning
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

  // 11. Safety Footer
  Widget _buildSafetyFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: textWhite.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: redReject.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: redReject, size: 24),
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
            "FLY SAFE",
            style: TextStyle(
                color: greenEngaged, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }

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
                Icon(icon, color: isAlert ? redReject : accentBlue, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: isAlert ? redReject : accentBlue,
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

  Widget _bulletTextCheckbox(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_box_outline_blank, color: textGrey, size: 16),
          const SizedBox(width: 8),
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

  Widget _stepText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
      ),
    );
  }

  Widget _flowStep(String phase, String details) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: warningAmber, width: 3)),
        ),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              phase,
              style: TextStyle(
                  color: textWhite, fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              details,
              style: TextStyle(color: textWhite, height: 1.4, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
