// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B737RnavApproachProfileEFB extends StatefulWidget {
  const B737RnavApproachProfileEFB({
    Key? key,
    this.width,
    this.height,
    this.referenceImageUrl, // Parameter for the uploaded reference image
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? referenceImageUrl;

  @override
  _B737RnavApproachProfileEFBState createState() =>
      _B737RnavApproachProfileEFBState();
}

class _B737RnavApproachProfileEFBState
    extends State<B737RnavApproachProfileEFB> {
  // --- Dark Mode Aviation Theme Colors (Professional EFB Style) ---
  final Color bgColor = const Color(0xFF0B1120); // Deep EFB Dark Background
  final Color cardColor = const Color(0xFF1E293B); // Dark Slate for Cards
  final Color accentBlue = const Color(0xFF38BDF8); // Boeing Cyan Accent
  final Color textWhite = const Color(0xFFF8FAFC); // Main Readability Text
  final Color textGrey = const Color(0xFF94A3B8); // Secondary Text
  final Color greenEngaged = const Color(0xFF4ADE80); // FMA Engaged Green
  final Color warningAmber = const Color(0xFFFBBF24); // Aviation Amber
  final Color redWarning = const Color(0xFFEF4444); // Alerts / Limitations

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
            _buildHeader(), // العنوان الرئيسي والرموز
            const SizedBox(height: 16),
            _buildTolerancesRequirementsImportant(), // كروت التفاوتات والمتطلبات والملاحظات الهامة
            const SizedBox(height: 16),
            _buildStraightInLandingTable(), // جدول الهبوط المستقيم RWY/26L
            const SizedBox(height: 16),
            _buildSpeedFlightPathCard(), // كرت السرعة ومسار الرحلة
            const SizedBox(height: 16),
            _buildAltitudeSpeedRemindersTable(), // جدول تذكيرات الارتفاع والسرعة
            const SizedBox(height: 16),
            _buildGotchasVectorPhaseSection(), // كروت Gotchas و Vector Phase
            const SizedBox(height: 16),
            _buildFlapManeuverSpeedsTable(), // جدول سرعات مناورة القلابات
            const SizedBox(height: 16),
            _buildVpaDeviationsTable(), // جدول انحرافات الـ VPA بناءً على الحرارة
            const SizedBox(height: 24),
            _buildApproachProfileSequence(), // مراحل الاقتراب (Downwind, Turning Base...)
            const SizedBox(height: 24),
            _buildReferenceChartSection(), // القسم التلخيصي - الصورة القابلة للزووم
            const SizedBox(height: 24),
            _buildSafetyFooter(), // تذييل السلامة Page 6
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
                Icon(FontAwesomeIcons.planeCircleCheck,
                    color: textWhite, size: 24),
                const SizedBox(width: 8),
                Text(
                  "RNAV, GPS, VOR, NDB APPROACH",
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
          "(Single and Dual FMC, with/without GPS) / CAT I",
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

  // 2. Tolerances, Requirements & Important Notes Section
  Widget _buildTolerancesRequirementsImportant() {
    return Column(
      children: [
        _buildCardWithTitle(
          title: "REQUIREMENTS",
          icon: Icons.track_changes,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bulletNote("1. RADAR required."),
              _bulletNote(
                  "2. Baro-VNAV not authorized below -15°C (5°F). 3. GPS or RNP-0.3 required."),
              _bulletNote("4. DME/DME RNP-0.3 not authorized."),
              _bulletNote(
                  "5. Dual simultaneous approach authorized with ILS Rwy 26R or ILS Rwy 27."),
              _bulletNote(
                  "6. Special aircraft and aircrew authorization required."),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildCardWithTitle(
          title: "IMPORTANT & VISIBILITY",
          icon: Icons.notification_important,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Check procedure notes and minimums for equipment, RNP requirements, etc.",
                        style: TextStyle(color: textWhite, fontSize: 13)),
                    const SizedBox(height: 4),
                    _bulletText("VOR-DME updating is never allowed for RNAV."),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 60,
                color: textWhite.withOpacity(0.1),
                margin: const EdgeInsets.symmetric(horizontal: 12),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bulletText("With a DA/H there can't be any level flight."),
                    const SizedBox(height: 4),
                    Text(
                        "Visibility must be geometric distance from DA/H point to runway threshold. (Roberts)",
                        style: TextStyle(color: textGrey, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 3. Straight-In Landing Table
  Widget _buildStraightInLandingTable() {
    return _buildCardWithTitle(
      title: "STRAIGHT-IN LANDING RWY/26L",
      icon: Icons.flight_land,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("VNAV / VNAV * DA(H) 580' (483')",
                  style:
                      TextStyle(color: textWhite, fontWeight: FontWeight.bold)),
              Text("Alt s.out", style: TextStyle(color: textGrey)),
            ],
          ),
          const SizedBox(height: 6),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(1.5),
            },
            children: [
              TableRow(children: [
                _tableHeader("Alt"),
                _tableHeader("RVR 60 or 1 1/4"),
                _tableHeader("1 3/4"),
              ]),
              _tableRowSpeed("Alt s.out", "", ""),
            ],
          ),
        ],
      ),
    );
  }

  // 4. Speed / Flight Path Card
  Widget _buildSpeedFlightPathCard() {
    return _buildCardWithTitle(
      title: "SPEED / FLIGHT PATH",
      icon: Icons.speed,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "Speed entries on the LEGS page are not required; speed control comes from flap handle or speed window."),
          _bulletText(
              "Using LNAV should be flown with autopilot or FD. AP recommended to reduce lateral error."),
          _bulletText(
              "From APPROACH REF page, select WIND CORR and VREF speed."),
          _bulletText(
              "VOR, VNAV PATH stepdown will begin in .7 nm. GREEN DONUT with this label."),
          _bulletText("Set minimums (DA) on baro altimeter."),
          _bulletNote("RNP: .3 or less."),
        ],
      ),
    );
  }

  // 5. Altitude / Speed Reminders Table
  Widget _buildAltitudeSpeedRemindersTable() {
    return _buildCardWithTitle(
      title: "ALTITUDE / SPEED REMINDERS",
      icon: Icons.timer,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1000' AFE and VREF 30 + 15",
              style: TextStyle(color: accentBlue, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(3.5),
            },
            children: [
              TableRow(children: [
                _tableHeader("Condition"),
                _tableHeader("PF ACTION / PM CALL"),
              ]),
              _tableRow(
                "VREF 30+15",
                "PF: LEVEL CHANGE, SET TOP BUG, FLAPS 5",
              ),
              _tableRow(
                "VREF 30+15",
                "PM: SET M/A ALTITUDE, FMA G/S ENGAGED",
              ),
              _tableRow("ALT HOLD", "MCP to ZERO", isSubRow: true),
              _tableRow("400'", "PF: HDG SEL or LNAV", isSubRow: true),
              _tableRow("3000' AFE", "PF: VNAV or LEVEL CHANGE, SET 250",
                  isSubRow: true),
            ],
          ),
        ],
      ),
    );
  }

  // 6. Gotchas & Vector Phase Section
  Widget _buildGotchasVectorPhaseSection() {
    return Column(
      children: [
        _buildCardWithTitle(
          title: "RNAV / VNAV GOTCHAS",
          icon: Icons.warning_amber_rounded,
          isAlert: true,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _bulletTextAlert("Intercepting wrong wpt."),
              _bulletTextAlert("Arriving at FAF too high."),
              _bulletTextAlert("Forgetting to dial zero altitude."),
              _bulletTextAlert("Forgetting to engage VNAV."),
              _bulletNoteAlert("Manual entry of RNP required if FMC fails."),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildCardWithTitle(
          title: "VECTOR PHASE",
          icon: Icons.map_outlined,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PF: APPROACH CHECK",
                  style:
                      TextStyle(color: textWhite, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              _stepText("On base leg: PF: FLAPS 5 (See Speed Note)"),
              _stepText(
                  "Intercept leg-to-wpt. Tricky! anticipate wpt location."),
              _stepText("Cleared approach: Engage LNAV*"),
            ],
          ),
        ),
      ],
    );
  }

  // 7. Flap Maneuver Speeds Table
  Widget _buildFlapManeuverSpeedsTable() {
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
            _tableHeader("> 117.0°"),
          ]),
          _tableRowSpeed("0", "210 kts", "220 kts"),
          _tableRowSpeed("1", "190 kts", "200 kts"),
          _tableRowSpeed("5", "180 kts", "190 kts"),
          _tableRowSpeed("10", "170 kts", "180 kts"),
          _tableRowSpeed("15", "150 kts", "160 kts"),
          _tableRowSpeed("25", "140 kts", "150 kts"),
        ],
      ),
    );
  }

  // 8. VPA Deviations Table
  Widget _buildVpaDeviationsTable() {
    return _buildCardWithTitle(
      title: "VPA DEVIATIONS (RWY/26L)",
      icon: Icons.thermostat,
      content: Table(
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1.5),
        },
        children: [
          TableRow(children: [
            _tableHeader("Alt"),
            _tableHeader("AP TEMP"),
            _tableHeader("ACTUAL VPA"),
          ]),
          _tableRowSpeed("Alt s.out", "+30°C", "3.2°"),
          _tableRowSpeed("", "+15°C", "3.2°"),
          _tableRowSpeed("", "0°C", "2.8°"),
          _tableRowSpeed("", "-15°C", "2.67°"),
          _tableRowSpeed("", "-31°C", "2.5°"),
        ],
      ),
    );
  }

  // 9. Approach Profile Sequence
  Widget _buildApproachProfileSequence() {
    return _buildCardWithTitle(
      title: "APPROACH PROFILE SEQUENCE (Summarized Profile)",
      icon: Icons.linear_scale,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stepText(
              "279° -> NIXIN D7.5 IJYV -> KERNS D10.9 IJYV -> GRIEG D15.5 IJYV -> MKAYE D20.6 IJYV"),
          const SizedBox(height: 10),
          _bulletText(
              "1 1/2 dots below GS: PF: GEAR DOWN, FLAPS 15, SPEED*, LANDING CHECK"),
          _bulletText(
              "GS CAPTURE: PF: FLAPS 30/40, TARGET*, Set M/A altitude, FMA annunciates G/S ENGAGED and GA"),
          _bulletText(
              "APPROACHING FAF: ALT HOLD, MCP to ZERO, Check LNAV/VNAV PATH, PF: FLAPS 30/40"),
          _bulletText(
              "400': PF: HDG SEL or LNAV, Tell tower of Missed and intentions"),
          _bulletText("100' above DA: PM: APPROACHING MINIMUMS"),
          _bulletText("At DA: PM: MINIMUMS"),
          _bulletText("At MDA and MA point: PF: GOING AROUND"),
          const SizedBox(height: 6),
          _stepText("TCH 56', TDZ 95', RW26L D1.7 IJYV, GP 2.98°"),
        ],
      ),
    );
  }

  // 10. Reference Chart Section (Summarized profile map with zoom)
  Widget _buildReferenceChartSection() {
    return _buildCardWithTitle(
      title: "APPROACH REF (SUMMARIZED MAP) - TAP TO ZOOM",
      icon: Icons.map_outlined,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "Tap image to open reference chart (P.6) in full screen for detailed view and zoom."),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _openChartFullScreen(context),
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
                      'https://via.placeholder.com/600x400/1E293B/F8FAFC?text=Approach+P.6+Reference', // Placeholder if no URL
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
  void _openChartFullScreen(BuildContext context) {
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
                "Approach Chart Reference - P.6",
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
                  child: Image.network(
                    widget.referenceImageUrl ??
                        'https://via.placeholder.com/800x600/1E293B/F8FAFC?text=P.6+Detailed+Chart',
                    fit: BoxFit.contain,
                  ),
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
            "Page 6",
            style: TextStyle(color: textGrey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(FontAwesomeIcons.shieldHalved, color: accentBlue, size: 16),
              const SizedBox(width: 6),
              Text(
                "FLY SAFE",
                style: TextStyle(
                    color: textWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ],
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
      bool isAlert = false}) {
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

  Widget _bulletNote(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(color: accentBlue, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: textWhite,
                  fontSize: 13,
                  height: 1.4,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletNoteAlert(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(color: redWarning, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: textWhite,
                  fontSize: 13,
                  height: 1.4,
                  fontWeight: FontWeight.w600),
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
        style: TextStyle(color: textGrey, fontSize: 12, height: 1.3),
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

  TableRow _tableRow(String label1, String label2, {bool isSubRow = false}) =>
      TableRow(children: [
        _tableCell(label1, textAlign: TextAlign.center),
        _tableCell(label2, isSubRow: isSubRow),
      ]);

  TableRow _tableRowSpeed(String flap, String speed1, String speed2) =>
      TableRow(children: [
        _tableCell(flap, textAlign: TextAlign.center),
        _tableCell(speed1, textAlign: TextAlign.center),
        _tableCell(speed2, textAlign: TextAlign.center),
      ]);

  Widget _tableCell(String text,
          {TextAlign textAlign = TextAlign.start, bool isSubRow = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Text(text,
            textAlign: textAlign,
            style: TextStyle(color: isSubRow ? greenEngaged : textWhite)),
      );
}
