// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B737WindshearTakeoffEFB extends StatefulWidget {
  const B737WindshearTakeoffEFB({
    Key? key,
    this.width,
    this.height,
    this.referenceImageUrl, // Parameter for the uploaded reference image
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? referenceImageUrl;

  @override
  _B737WindshearTakeoffEFBState createState() =>
      _B737WindshearTakeoffEFBState();
}

class _B737WindshearTakeoffEFBState extends State<B737WindshearTakeoffEFB> {
  // --- Dark Mode Aviation Theme Colors (Professional EFB Style) ---
  final Color bgColor = const Color(0xFF0B1120); // Deep EFB Dark Background
  final Color cardColor = const Color(0xFF1E293B); // Dark Slate for Cards
  final Color accentBlue = const Color(0xFF38BDF8); // Boeing Cyan Accent
  final Color textWhite = const Color(0xFFF8FAFC); // Main Readability Text
  final Color textGrey = const Color(0xFF94A3B8); // Secondary Text
  final Color greenEngaged = const Color(0xFF4ADE80); // FMA Engaged Green
  final Color warningAmber = const Color(0xFFFBBF24); // Aviation Amber
  final Color redReject = const Color(0xFFEF4444); // Alerts / Limitations

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
            _buildHeader(), // العنوان الرئيسي ومعلومات FMC
            const SizedBox(height: 16),
            _buildAvoidWindshearCard(), // ملاحظة "FIRST RULE"
            const SizedBox(height: 16),
            _buildTakeoffNotesCard(), // ملاحظات الإقلاع (1-5)
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: _buildApproachRefDataCard()), // بيانات Approach Ref
                const SizedBox(width: 12),
                Expanded(child: _buildLandingNotesCard()), // ملاحظات الهبوط
              ],
            ),
            const SizedBox(height: 16),
            _buildWatchSpeedCard(), // تحذير السرعة
            const SizedBox(height: 16),
            _buildApproachStepsSequence(), // مسار الاقتراب (DOWNWIND, BASE, etc.)
            const SizedBox(height: 16),
            _buildConditionBoxesSequence(), // المربعات الشرطية (Go Around, VM 1, Altitudes)
            const SizedBox(height: 16),
            _buildFlapSpeedsTable(), // جدول سرعات القلابات
            const SizedBox(height: 16),
            _buildWindshearSystemsComparisonCard(), // مقارنة أنظمة Windshear
            const SizedBox(height: 24),
            _buildReferenceChartSection(), // القسم التلخيصي - الصورة القابلة للزووم
            const SizedBox(height: 24),
            _buildSafetyFooter(), // تذييل السلامة Page 12
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
            Text(
              "WINDSHEAR TAKEOFF",
              style: TextStyle(
                  color: accentBlue,
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
        const SizedBox(height: 4),
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

  // 2. FIRST RULE: Avoid Windshear Card
  Widget _buildAvoidWindshearCard() {
    return _buildNoteCard(
      title: "FIRST RULE: AVOID WINDSHEAR",
      icon: Icons.warning_amber_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("MICROBURST WINDSHEAR PROBABILITY GUIDE LINES",
              style: TextStyle(
                  color: textGrey, fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          _bulletText("Local localized strong winds (blowing dust) . . . H"),
          _bulletText(
              "Heavy precipitation . . . . . . . . . . . . . . . . . . . H"),
          _bulletText(
              "Onboard windshear detection system alert . . . . . . . . . H"),
          _bulletText(
              "With Rainshower or Lightning . . . . . . . . . . . . . M"),
          _bulletText(
              "With Virga (cooling air plunging earthward) . . . . . . M"),
          _bulletText(
              "With Moderate or greater turbulence . . . . . . . . . M"),
          _bulletText("With temp / dewpoint spread between 30 - 50°F . . . M"),
          const SizedBox(height: 8),
          _stepText("H = HIGH  |  M = MEDIUM  |  L = LOW"),
        ],
      ),
    );
  }

  // 3. Takeoff Notes Card
  Widget _buildTakeoffNotesCard() {
    return _buildCardWithTitle(
      title: "TAKEOFF NOTES",
      icon: Icons.notes,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _numberedNote("1.",
              "Select longest suitable runway available that avoids suspected areas of windshear."),
          _numberedNote("2.",
              "Flaps 1 offers better performance in airborne windshear but Flaps 5 results in better performance on the runway and is recommended as it covers a larger range of conditions."),
          _numberedNote("3.", "Use max rated takeoff thrust."),
          _numberedNote("4.",
              "Use increased rotation speed when available. Determine runway limit weight. Then determine Vr for that weight. Verify Vr use the higher. Do not reset the airspeed bugs."),
          _numberedNote("5.",
              "Use FD. All CO aircraft have FCC -2 or above, which can be used for windshear guidance. Do not change flaps, gear or trim position until terrain contact is no longer a factor. Focus attention on pitch attitude, and flying the airplane."),
          const SizedBox(height: 8),
          _stepText(
              "MP: Monitor attitude, IVSI, and altimeter. Inform PF of impending and negative vertical speeds by a callout of SINK RATE."),
        ],
      ),
    );
  }

  // 4. Approach Ref Data Card
  Widget _buildApproachRefDataCard() {
    return _buildCardWithTitle(
      title: "APPROACH REF (FMC)",
      icon: Icons.computer,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText("gross weight (x1000): 107.4"),
          _bulletText("flaps: 15° | 30° | 40°"),
          _bulletText("VREF: 142 KT | 132 KT | 128 KT"),
          const SizedBox(height: 12),
          _stepText("RWY: 12000 FT 3658 M"),
          _stepText("ILS 14L: 111.90 IHSO | CRS 146°"),
        ],
      ),
    );
  }

  // 5. Landing Notes Card (Yellow Warning Box)
  Widget _buildLandingNotesCard() {
    return _buildNoteCard(
      title: "LANDING NOTES",
      icon: Icons.checklist_rtl_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletTextAlert(
              "Below 1000' AGL, if uncontrolled changes exceed guidelines, initiate Windshear Recovery Procedure."),
          _bulletTextAlert("A reported airspeed loss should be added to VREF."),
          _bulletTextAlert(
              "Maintain target airspeed. Keep yoke centered with no autothrottle."),
          _bulletTextAlert(
              "Unusual throttle position for a significant period."),
          const SizedBox(height: 8),
          Text(
              "Recovery Guidelines (Uncontrolled changes below 1000' AGL):\n± 15 kts airspeed\n± 500 FPM vertical speed\n± 5° pitch attitude",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }

  // 6. Watch Speed Card
  Widget _buildWatchSpeedCard() {
    return _buildCard(
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.speed, color: warningAmber, size: 24),
                const SizedBox(width: 10),
                Text(
                  "WATCH SPEED",
                  style: TextStyle(
                      color: textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Flap limits are easily exceeded with no autothrottle.",
              textAlign: TextAlign.center,
              style: TextStyle(color: textWhite, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  // 7. Approach Sequence Section
  Widget _buildApproachStepsSequence() {
    return Column(
      children: [
        _buildApproachStepCard("DOWNWIND", Icons.south_rounded,
            "PF: FLAPS 1, SPEED*, APPROACH\n± 78% N1 thru deployment."),
        const SizedBox(height: 12),
        _buildApproachStepCard(
            "TURNING BASE", Icons.west_rounded, "PF: FLAPS 5, SPEED*"),
        const SizedBox(height: 12),
        _buildApproachStepCard("ON BASE LEG", Icons.flight_takeoff_rounded,
            "PF: FLAPS 10, SPEED*"),
        const SizedBox(height: 12),
        _buildClearedApproachCard(),
        const SizedBox(height: 12),
        _buildStep1To1AndAHalfDotsBelowGsCard(),
      ],
    );
  }

  Widget _buildApproachStepCard(String title, IconData icon, String content) {
    return _buildCard(
      padding: const EdgeInsets.all(12.0),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: accentBlue, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClearedApproachCard() {
    return _buildCard(
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "• Cleared for approach: Arm LOC or APP **\n• Observe VOR/LOC and/or GS ARM annunciation on FMA.\n• Transition to the ADI.",
          style: TextStyle(color: textWhite, fontSize: 13, height: 1.5),
        ),
      ),
    );
  }

  Widget _buildStep1To1AndAHalfDotsBelowGsCard() {
    return _buildCard(
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1 to 1 1/2 DOTS BELOW GS",
              style: TextStyle(
                  color: warningAmber,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "PF: GEAR DOWN\nFLAPS 15, TARGET\nLANDING CHECK\n\nPull throttle to 65% N1 to decelerate to VREF 15 + additive.",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  // 8. Condition Boxes (Go Around, VM 1, Altitudes)
  Widget _buildConditionBoxesSequence() {
    return Column(
      children: [
        _buildGoAroundHabitCard(),
        const SizedBox(height: 12),
        _buildAtVm1Card(),
        const SizedBox(height: 12),
        _buildAltitudesProceduresCard(),
      ],
    );
  }

  Widget _buildGoAroundHabitCard() {
    return _buildCardWithTitle(
      title: "GO AROUND (HABIT)",
      icon: Icons.alt_route,
      content: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: warningAmber, width: 3)),
        ),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Habit - keep finger on TOGA. To go around, press \"TOGA\". Smoothly straight-arm the throttle to Go-Around thrust, applying rudder to maintain heading, then dig your heel into the floorboard to lock in that rudder position.\n\nKeep the control wheel centered. Rotate to initial go-around altitude of 13°. Higher than normal pitch force required for rotation because of failed engine (decrease in power provides less pitch-up). Rotation thru approximately 10° yields positive rate of climb.",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.6),
            ),
            const SizedBox(height: 12),
            Text(
              "PF: FLAPS 1, CHECK POWER ...\nPOSITIVE RATE, GEAR UP\nCHECK MISSED APPROACH ALTITUDE",
              style: TextStyle(
                  color: greenEngaged,
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "Target speed is VREF15 + 5 *** Transition to FD.\nStraight out, keep heading within 5°.",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAtVm1Card() {
    return _buildCardWithTitle(
      title: "AT VM 1",
      icon: Icons.flight_takeoff_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText("PF: FLAPS UP (option)"),
          _bulletText(
              "SET MCT (Press CON on N1 LIMIT page)\nENG FAIL / FIRE CHECK"),
        ],
      ),
    );
  }

  Widget _buildAltitudesProceduresCard() {
    return _buildCard(
      content: Table(
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1.5),
        },
        children: [
          _buildAltitudeProcedureRow("STAY ON LOC.", ""),
          SeparatorTableRow(height: 1),
          _buildAltitudeProcedureRow("At 400'",
              "PF: HDG SEL or LNAV\nPM: Tell tower you are going straight out to clean up.\nSet radios for missed approach."),
          SeparatorTableRow(height: 1),
          _buildAltitudeProcedureRow("AT 800' OR OBSTACLE CLEARANCE ALTITUDE",
              "Decrease pitch,\nPF: SET TOP BUG\nAccelerate in slight climb."),
        ],
      ),
    );
  }

  TableRow _buildAltitudeProcedureRow(String alt, String proc) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(alt,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: textGrey, fontSize: 13, fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(proc,
            textAlign: TextAlign.start,
            style: TextStyle(color: textWhite, fontSize: 13)),
      ),
    ]);
  }

  // 9. Flap Speeds Table
  Widget _buildFlapSpeedsTable() {
    return _buildCardWithTitle(
      title: "FLAP MANEUVER SPEEDS (-300/500)",
      icon: Icons.offline_bolt_outlined,
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
            _tableHeader("> 117.0° *"),
          ]),
          _buildTableSeparatorRow(),
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

  TableRow _buildTableSeparatorRow() {
    return TableRow(children: [
      Container(height: 1, color: textWhite.withOpacity(0.1)),
      Container(height: 1, color: textWhite.withOpacity(0.1)),
      Container(height: 1, color: textWhite.withOpacity(0.1)),
    ]);
  }

  Widget _tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(color: textWhite, fontWeight: FontWeight.bold)),
    );
  }

  TableRow _tableRow(String flap, String speed1, String speed2) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(flap,
            textAlign: TextAlign.center, style: TextStyle(color: textWhite)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(speed1,
            textAlign: TextAlign.center, style: TextStyle(color: textWhite)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(speed2,
            textAlign: TextAlign.center, style: TextStyle(color: textWhite)),
      ),
    ]);
  }

  // 10. Windshear Systems Comparison
  Widget _buildWindshearSystemsComparisonCard() {
    return _buildCardWithTitle(
      title: "WINDSHEAR DETECTION SYSTEMS",
      icon: Icons.radar,
      content: Column(
        children: [
          _buildSystemTypeRow("WITH PREDICTIVE Windshear System",
              "Aural: \"MONITOR RADAR DISPLAY\"\nProvides detection minimum 10 sec prior..."),
          const Divider(color: Colors.white24, height: 16),
          _buildSystemTypeRow("WITH REACTIVE Windshear System",
              "GPWS test says \"WINDSHEAR\" three times.\nProvides alert after detection..."),
          const Divider(color: Colors.white24, height: 16),
          _buildSystemTypeRow("WITH NO REACTIVE Windshear System",
              "Aural: \"MONITOR RADAR DISPLAY\" only.\nAlert after detection..."),
        ],
      ),
    );
  }

  Widget _buildSystemTypeRow(String title, String proc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: greenEngaged,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child: Text(proc,
              textAlign: TextAlign.start,
              style: TextStyle(color: textWhite, fontSize: 13)),
        ),
      ],
    );
  }

  // 11. Reference Chart Viewer (The uploaded image container with Zoom)
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
                color: accentBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
                "Upload the reference chart image (Page 12) to view it here, where you can study the full flowchart and summary. Zoom in/out is available.",
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

  // 12. Safety Footer
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
              Icon(Icons.star, color: textWhite),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  "* Don't take hand off spd knob until you see flap movement.\n** Caution: Consider waiting until the 'feather' before arming GS.\n*** Vref 15 + 5 is approximately V2 for flaps 1 and should be considered a minimum speed.",
                  style: TextStyle(color: textGrey, fontSize: 12, height: 1.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Page 12", style: TextStyle(color: textGrey, fontSize: 12)),
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
          const SizedBox(height: 12),
          Text(
            "ALL LIMITS ARE CRITICAL - EXCEEDING THEM MAY COMPROMISE SAFETY.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: redReject, fontWeight: FontWeight.bold, fontSize: 14),
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

  Widget _buildNoteCard(
      {required String title,
      required IconData icon,
      required Widget content}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: redReject.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: redReject, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                      color: redReject,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
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
          Text("• ", style: TextStyle(color: redReject, fontSize: 16)),
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

  Widget _stepText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(color: textWhite, fontSize: 13, height: 1.4),
      ),
    );
  }
}

class SeparatorTableRow extends TableRow {
  final double height;
  SeparatorTableRow({required this.height})
      : super(children: [
          Container(
              height: height, color: const Color(0xFF94A3B8).withOpacity(0.1)),
          Container(
              height: height, color: const Color(0xFF94A3B8).withOpacity(0.1)),
        ]);
}
