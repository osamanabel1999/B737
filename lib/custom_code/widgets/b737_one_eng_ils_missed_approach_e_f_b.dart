// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B737OneEngIlsMissedApproachEFB extends StatefulWidget {
  const B737OneEngIlsMissedApproachEFB({
    Key? key,
    this.width,
    this.height,
    this.referenceChartUrl, // Parameter for the uploaded reference image
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? referenceChartUrl;

  @override
  _B737OneEngIlsMissedApproachEFBState createState() =>
      _B737OneEngIlsMissedApproachEFBState();
}

class _B737OneEngIlsMissedApproachEFBState
    extends State<B737OneEngIlsMissedApproachEFB> {
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
            _buildApproachRefDataCard(), // كرت بيانات Approach Ref (جديد)
            const SizedBox(height: 16),
            _buildBeforeMissedApproachChecklistCard(), // كرت القائمة المرجعية قبل Missed Approach
            const SizedBox(height: 16),
            _buildNotesCard(), // كرت الملاحظات (المربع الأحمر العلوي)
            const SizedBox(height: 16),
            _buildWatchSpeedCard(), // كرت ملاحظة تجاوز السرعة
            const SizedBox(height: 16),
            _buildIfYouGetALittleSlowCard(), // كرت نصائح "إذا تباطأت قليلاً"
            const SizedBox(height: 16),
            _buildApproachSequenceSection(), // مسار الاقتراب (DOWNWIND, BASE, etc.)
            const SizedBox(height: 16),
            _buildGoAroundHabitCard(), // كرت إجراء Go Around (HABIT)
            const SizedBox(height: 16),
            _buildAtVm1Card(), // كرت إجراء At VM 1
            const SizedBox(height: 16),
            _buildAltitudesProceduresCard(), // كرت إجراءات الارتفاع (400', 800')
            const SizedBox(height: 16),
            _buildFlapSpeedsTable(), // جدول سرعات القلابات
            const SizedBox(height: 24),
            _buildReferenceChartViewer(), // الحاوية السفلية المخصصة للصورة المرفوعة والزووم
            const SizedBox(height: 24),
            _buildSafetyFooter(), // تذييل السلامة Page 11
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
              "ONE ENGINE ILS TO A MISSED APPROACH",
              style: TextStyle(
                  color: accentBlue, fontSize: 22, fontWeight: FontWeight.bold),
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

  // 2. Approach Ref Data Card
  Widget _buildApproachRefDataCard() {
    return _buildCard(
      title: "Approach Ref Data (FMC)",
      icon: Icons.computer,
      content: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        children: [
          _buildTableRow("GROSS WT", "FLAPS", "VREF"),
          _buildTableRow("107.4", "15°", "142 KT"),
          _buildTableRow("", "30°", "132 KT"),
          _buildTableRow("", "40°", "128 KT"),
          _buildTableRowSeparator(),
          _buildTableRowSingleCell("GA N1: 93.4 / 93.4%"),
          _buildTableRowSingleCell("WIND CORR: -05 KT"),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String col1, String col2, String col3) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(col1,
            textAlign: TextAlign.start,
            style: TextStyle(color: textGrey, fontSize: 13)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(col2,
            textAlign: TextAlign.center,
            style: TextStyle(color: textWhite, fontSize: 13)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(col3,
            textAlign: TextAlign.center,
            style: TextStyle(color: textWhite, fontSize: 13)),
      ),
    ]);
  }

  TableRow _buildTableRowSingleCell(String text) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(text,
            textAlign: TextAlign.start,
            style: TextStyle(color: textWhite, fontSize: 13)),
      ),
      const SizedBox(),
      const SizedBox(),
    ]);
  }

  TableRow _buildTableRowSeparator() {
    return TableRow(children: [
      Container(height: 1, color: textWhite.withOpacity(0.1)),
      Container(height: 1, color: textWhite.withOpacity(0.1)),
      Container(height: 1, color: textWhite.withOpacity(0.1)),
    ]);
  }

  // 3. Before Missed Approach Checklist Card
  Widget _buildBeforeMissedApproachChecklistCard() {
    return _buildCard(
      title: "BEFORE MISSED APPROACH (Checklist)",
      icon: Icons.checklist_rtl_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText("Check weather, brief approach, company, and FAs."),
          _bulletText("Use of autopilot is recommended."),
          _bulletText(
              "Complete ONE ENGINE INOP APPROACH and LANDING check at appropriate time.\n(Includes IN RANGE, APPROACH and LANDING checks)"),
          _bulletText("Flight Directors ON. Autothrottle OFF."),
          _bulletText("Consider autobrakes 2-3 due to high landing speed."),
        ],
      ),
    );
  }

  // 4. Notes Card (Red Title Box)
  Widget _buildNotesCard() {
    return _buildNoteCard(
      title: "NOTES",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _numberedNote("1.",
              "Because of the requirement for transfer of control, the Monitored Approach Procedure is not authorized with an engine inop even though an auto-coupled approach is authorized. The pilot flying the approach in conditions at or below 2400 RVR with an engine inop should also make the landing."),
          _numberedNote("2.",
              "Missed Approach\nRequest straight out.\nFlaps can be left at 1° if returning.\nMaintain runway heading (center control column with rudder).\nTurn both FDs ON for TOGA."),
        ],
      ),
    );
  }

  // 5. Watch Speed Card
  Widget _buildWatchSpeedCard() {
    return _buildNoteCard(
      title: "WATCH SPEED",
      icon: Icons.speed,
      content: Text(
        "Flap limits are easily exceeded with no autothrottle.",
        style: TextStyle(color: textWhite, fontSize: 13),
      ),
    );
  }

  // 6. If You Get A Little Slow Card
  Widget _buildIfYouGetALittleSlowCard() {
    return _buildNoteCard(
        title: "IF YOU GET A LITTLE SLOW IN SE",
        icon: Icons.flight_takeoff_rounded,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bulletText(
                "It is easier to go to the next flap setting than it is to recover the lost speed."),
            _bulletText(
                "Any change in power will require a change in pitch and rudder."),
            _bulletText(
                "Practice is required to keep your scan sharp and quick."),
            _bulletText("Make small corrections on the localizer."),
            _bulletText(
                "Include the sky pointer and the compass rose in your scan."),
          ],
        ));
  }

  // 7. Approach Sequence Section
  Widget _buildApproachSequenceSection() {
    return Column(
      children: [
        _buildApproachStep(
            title: "DOWNWIND",
            content: "PF: FLAPS 1\nSPEED*\nAPPROACH",
            note: "± 78% N1 thru Deployment.",
            icon: Icons.south_rounded),
        const SizedBox(height: 12),
        _buildApproachStep(
            title: "TURNING BASE",
            content: "PF: FLAPS 5\nSPEED*",
            icon: Icons.west_rounded),
        const SizedBox(height: 12),
        _buildApproachStep(
            title: "ON BASE LEG",
            content: "PF: FLAPS 10\nSPEED*",
            icon: Icons.flight_takeoff_rounded),
        const SizedBox(height: 12),
        _buildApproachClearedCard(),
        const SizedBox(height: 12),
        _buildApproachStep(
            title: "LOC CAPTURE", content: "Set M/A hdg.", note: ""),
        const SizedBox(height: 12),
        _buildApproachStep(
            title: "GS CAPTURE", content: "Set M/A alt.", note: ""),
        const SizedBox(height: 12),
        _buildStep1To1AndAHalfDotsBelowGsCard(),
      ],
    );
  }

  Widget _buildApproachStep(
      {required String title,
      required String content,
      String? note,
      IconData? icon}) {
    return _buildCard(
      padding: const EdgeInsets.all(12.0),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(icon, color: accentBlue, size: 24),
            ),
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
          if (note != null && note.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: textWhite.withOpacity(0.1)),
                ),
                child: Text(
                  note,
                  style: TextStyle(
                      color: textGrey,
                      fontSize: 12,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildApproachClearedCard() {
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

  // 8. Go Around Habit Card
  Widget _buildGoAroundHabitCard() {
    return _buildCard(
      title: "GO AROUND (HABIT)",
      content: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: warningAmber, width: 3)),
        ),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Habit - keep finger on TOGA. To go around, press \"TOGA\".\nSmoothly straight-arm the throttle to Go-Around thrust, applying rudder to maintain heading, then dig your heel into the floorboard to lock in that rudder position.\n\nKeep the control wheel centered.\nRotate to initial go-around altitude of 13°. Higher than normal pitch force required for rotation because of failed engine (decrease in power provides less pitch-up). Rotation thru approximately 10° yields positive rate of climb.",
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
              "Maintain visual reference to runway to maintain directional control until runway disappears under the nose.\nTarget speed is VREF15 + 5 *** Transition to FD.\nStraight out, keep heading within 5°.",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }

  // 9. At Vm1 Card
  Widget _buildAtVm1Card() {
    return _buildCard(
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

  // 10. Altitudes Procedures Card
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

  // 11. Flap Speeds Table
  Widget _buildFlapSpeedsTable() {
    return _buildCard(
      title: "FLAP MANEUVER SPEEDS (-300/500)",
      icon: Icons.offline_bolt_outlined,
      content: Table(
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1.5),
        },
        children: [
          _buildTableSeparatorRow(),
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
          _buildTableSeparatorRow(),
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

  // 12. Reference Chart Viewer (The uploaded image container with Zoom)
  Widget _buildReferenceChartViewer() {
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
                "Upload the reference chart image (image_6.png) to view it here, where you can study the full flowchart and summary. Zoom in/out is available.",
                style: TextStyle(color: textGrey, fontSize: 13, height: 1.4),
              ),
              const SizedBox(height: 16),
              if (widget.referenceChartUrl != null &&
                  widget.referenceChartUrl!.isNotEmpty)
                InteractiveViewer(
                  panEnabled: true,
                  boundaryMargin: const EdgeInsets.all(20),
                  minScale: 1.0,
                  maxScale: 6.0,
                  child: Image.network(
                    widget.referenceChartUrl!,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildImagePlaceholder(),
                  ),
                )
              else
                _buildImagePlaceholder(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.white10,
      child: Center(
        child: Text(
          "Image not uploaded yet.",
          style: TextStyle(color: textGrey, fontSize: 13),
        ),
      ),
    );
  }

  // 13. Safety Footer
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
              Text("Page 11", style: TextStyle(color: textGrey, fontSize: 12)),
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

  Widget _buildCard({
    String? title,
    IconData? icon,
    required Widget content,
    EdgeInsetsGeometry? padding,
  }) {
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
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null || icon != null)
              Row(
                children: [
                  if (icon != null) Icon(icon, color: accentBlue, size: 20),
                  if (icon != null && title != null) const SizedBox(width: 8),
                  if (title != null)
                    Text(
                      title,
                      style: TextStyle(
                          color: accentBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            if (title != null || icon != null) const SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildNoteCard({
    required String title,
    required Widget content,
    IconData? icon,
  }) {
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
                if (icon != null) Icon(icon, color: redReject, size: 20),
                if (icon != null) const SizedBox(width: 8),
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

  Widget _numberedNote(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$number ", style: TextStyle(color: textWhite, fontSize: 14)),
          const SizedBox(width: 6),
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
