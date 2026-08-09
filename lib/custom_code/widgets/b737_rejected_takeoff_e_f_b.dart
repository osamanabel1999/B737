// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// --- Dark Mode Aviation Theme Colors (Professional EFB Style) ---
// تم إصلاح الخطأ: تحويل الألوان إلى متغيرات عالمية ثابتة (Global Constants)
// هذا ضروري جداً لـ FlutterFlow compiler ليتعرف عليها كقيم ثابتة وقت الكمبيلة.
// قمت بتسميتها ببادئة efb_ لتجنب تعارض الأسماء.
const Color efb_bgColor = Color(0xFF0B1120); // Deep EFB Dark Background
const Color efb_cardColor = Color(0xFF1E293B); // Dark Slate for Cards
const Color boeingCyanAccent = Color(0xFF38BDF8); // Boeing Cyan Accent
const Color efb_textWhite = Color(0xFFF8FAFC); // Main Readability Text
const Color efb_textGrey = Color(0xFF94A3B8); // Secondary Text
const Color aviationWarningAmber = Color(0xFFFBBF24); // Aviation Amber
const Color fmaGreenContinue = Color(0xFF4ADE80); // FMA Engaged Green
const Color limitationRedReject = Color(0xFFEF4444); // Alerts / Limitations

class B737RejectedTakeoffEFB extends StatefulWidget {
  const B737RejectedTakeoffEFB({
    Key? key,
    this.width,
    this.height,
    this.referenceImageUrl, // Parameter for the uploaded reference image
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? referenceImageUrl;

  @override
  _B737RejectedTakeoffEFBState createState() => _B737RejectedTakeoffEFBState();
}

class _B737RejectedTakeoffEFBState extends State<B737RejectedTakeoffEFB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      color: efb_bgColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(), // العنوان الرئيسي ومعلومات FMC
            const SizedBox(height: 16),
            _buildCriticalNotesCard(), // كرت الملاحظات النقدية (المربع البرتقالي العلوي)
            const SizedBox(height: 16),
            _buildSpeedIndicatorCard(), // كرت مؤشر السرعة (الرسوم البيانية في الوسط)
            const SizedBox(height: 16),
            _buildEvacuationPotentialCard(), // كرت احتمالية الإخلاء (اليسار)
            const SizedBox(height: 16),
            _buildEvacuationNecessaryCard(), // كرت إجراءات الإخلاء (اليسار)
            const SizedBox(height: 16),
            _buildLossOfGensCard(), // كرت تأثير فقدان المولدات (أسفل اليسار)
            const SizedBox(height: 16),
            _buildRejectedStepsCard(), // كرت خطوات النكسة (Step 1, Step 2)
            const SizedBox(height: 16),
            _buildCrewEvacuationDutiesCard(), // كرت واجبات الإخلاء للطاقم
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildMalfunctionFailureCard()), // كرت عطل/فشل
                const SizedBox(width: 12),
                Expanded(child: _buildRunwayLightingCard()), // كرت إضاءة المدرج
              ],
            ),
            const SizedBox(height: 16),
            _buildFlapSpeedsTable(), // جدول سرعات القلابات
            const SizedBox(height: 24),
            _buildEvacuationReferenceSection(), // القسم التلخيصي - الصورة القابلة للزووم
            const SizedBox(height: 24),
            _buildSafetyFooter(), // تذييل السلامة Page 9
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
              "REJECTED TAKEOFF",
              // تم إصلاح الخطأ: إزالة 'const' من أمام TextStyle (السطر 105 في الصورة)
              style: TextStyle(
                  color: boeingCyanAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            const Text(
              "B737 PROFILES",
              style: TextStyle(
                  color: efb_textGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          "PF = Pilot Flying  |  PM = Pilot Monitoring",
          style: TextStyle(color: efb_textGrey, fontSize: 14),
        ),
        const SizedBox(height: 12),
        Container(
          height: 2,
          width: double.infinity,
          color: boeingCyanAccent.withOpacity(0.3),
        ),
      ],
    );
  }

  // 2. Critical Notes Card (the top right orange box)
  Widget _buildCriticalNotesCard() {
    return _buildNoteCard(
      title: "NOTES",
      icon: Icons.notification_important,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _numberedNote("1",
              "Below 100 kts, reject for a takeoff configuration warning, engine failure or fire, OWI / DET annunciation except APU DET INOP, fumes or smoke, system failure, unusual noise or vibration, tire failure, abnormal acceleration, or a WINDSHEAR ALERT accompanied by a reported loss of airspeed, or a MICROBURST ALERT."),
          _numberedNote("2",
              "Over 100 kts, reject only for engine failure (not just a fire warning) or confirmed unsafe configuration or other condition whereby plane would be unsafe or unable to fly.\nIf a WINDSHEAR ALERT or a MICROBURST ALERT is received the takeoff may be rejected or continued at Captain's discretion."),
          _numberedNote("3",
              "Personal experience noted for educational purpose: I made the mistake of rejecting when a door light illuminated at 90 kts on a heavy -800 departing SEATAC for ANC. Speed peaked at 114 kts. Airplane stopped comfortably in 6500 ft. Over 30 minute brake cooling period was required. Decide ahead of time what, if any, amber lights you will reject for."),
          _numberedNote("4",
              "V1 is a flying speed, not a RTO speed. Be in a \"go\" mode."),
        ],
      ),
    );
  }

  // 3. Speed Indicator Card (the circle graphic and surrounding text)
  Widget _buildSpeedIndicatorCard() {
    return _buildCard(
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(FontAwesomeIcons.circleExclamation,
                        color: efb_textWhite, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      "RTO SPEED INDICATOR",
                      style: TextStyle(
                          color: efb_textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text("(P.9 Diagram Reference)",
                    style: TextStyle(color: efb_textGrey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 16),
            // Graphical representation placeholder and text
            Text("60  80  100  120  140  160  180  200",
                style: TextStyle(color: efb_textGrey, fontSize: 13)),
            const SizedBox(height: 6),
            Text("REJECT | MAYBE | CONTINUE",
                style: TextStyle(
                    color: boeingCyanAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildRtoSpeedZone("REJECT", "0-100 kts", limitationRedReject),
                _buildRtoSpeedZone("MAYBE", "100-V1 kts", aviationWarningAmber),
                _buildRtoSpeedZone("CONTINUE", "Above V1", fmaGreenContinue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 4. Evacuation Potential Card (the left column list)
  Widget _buildEvacuationPotentialCard() {
    return _buildCardWithTitle(
      title: "POTENTIAL FOR EVACUATION EXISTS",
      icon: Icons.checklist_rtl_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "STANDBY POWER . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . CONTACT"),
          _bulletText(
              "BAT . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . CONTACT"),
          _bulletText(
              "TOWER/GROUND . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . CONTACT"),
          const SizedBox(height: 12),
          _bulletText(
              "FLAPS . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 40°"),
          _bulletText(
              "SPEED BRAKE LEVER . . . . . . . . . . . . . . . . . . . . . FULL FORWARD"),
          _bulletText(
              "PRESSURIZATION . . . . . . . . . . . . . . . . . . . . . MAN DC / MAN & OPEN"),
        ],
      ),
    );
  }

  // 5. Evacuation Necessary Card (the left column list)
  Widget _buildEvacuationNecessaryCard() {
    return _buildCardWithTitle(
      title: "IF EVACUATION IS NECESSARY",
      icon: Icons.exit_to_app_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletTextAlert(
              "PARKING BRAKE . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . SET"),
          _bulletTextAlert(
              "TOWER/GROUND . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . NOTIFY"),
          _bulletTextAlert(
              "START LEVERS . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . CUTOFF"),
          _bulletTextAlert(
              "PASSENGER EVACUATION . . . . . . . . . . . . . . . EASY VICTOR, EASY VICTOR"),
          _bulletTextAlert(
              "EMERGENCY EXIT LIGHTS . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ON"),
        ],
      ),
    );
  }

  // 6. Loss of Gens Card (lower left column list)
  Widget _buildLossOfGensCard() {
    return _buildCardWithTitle(
      title: "EFFECT OF LOSS OF BOTH GENS BEFORE LIFTOFF",
      icon: Icons.electrical_services_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "Operative: Reversers, Anti-skid outbd, All N1s and EGTs, Left IRS, PA"),
          _bulletTextAlert(
              "Inoperative: Autobrakes, DC Bus 2, Anti-skid inbd, Auto spoilers, Right IRS, # 2 Nav/Comm"),
          const SizedBox(height: 12),
          Text(
              "On the ground, move STBY PWR to BATT for #1 Comm. (No overhead speakers)",
              style: TextStyle(color: efb_textGrey, fontSize: 13, height: 1.4)),
          const SizedBox(height: 10),
          _stepText("Note: -600 / 700 / 800 auto-transfers on the ground."),
        ],
      ),
    );
  }

  // 7. Rejected Steps Card (Steps 1 & 2)
  Widget _buildRejectedStepsCard() {
    return _buildCardWithTitle(
      title: "REJECTED TAKEOFF STEPS (Summarized Profile)",
      icon: Icons.linear_scale,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Stop the airplane by accomplishing these items simultaneously for a high speed reject:",
              style: TextStyle(
                  color: efb_textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  height: 1.4)),
          const SizedBox(height: 10),
          _flowStep("STEP 1",
              "Ca: REJECT - note ground speed.\n• Move throttles to idle.\n• Disconnect autothrottles (in THR HOLD > 84 kts)\n• Apply brakes as required.\n• Apply reverse thrust - Go-around N1 consistent with conditions...\n• Don't relinquish control of aircraft until Captain confirms he has control, especially the rudders.\n• Notify ATC of the rejected takeoff.\n• REMAIN SEATED, REMAIN SEATED"),
          const SizedBox(height: 12),
          _flowStep("STEP 2",
              "When the aircraft comes to a complete stop, the Captain will call:\nREJECTED TAKEOFF CHECKLIST"),
        ],
      ),
    );
  }

  // 8. Crew Evacuation Duties Card (right column list)
  Widget _buildCrewEvacuationDutiesCard() {
    return _buildCrewEvacuationDutiesCardWithNamedArgs(
      title: "CREW EVACUATION DUTIES",
      icon: Icons.group_add_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _flowStep("CA Duties",
              "Direct and assist passenger evacuation. Ensure all passengers and crew have evacuated the aircraft. May need PBD."),
          const SizedBox(height: 10),
          _flowStep("FO Duties",
              "Assist FA as necessary to ensure forward door(s) open and escape slide activated. Take a megaphone and proceed to ground without delay... Direct passengers to assembly point - up wind and off the concrete."),
        ],
      ),
    );
  }

  // 9. Malfunction / Failure Card (lower central column)
  Widget _buildMalfunctionFailureCard() {
    return _buildNoteCard(
      title: "MALFUNCTION / FAILURE",
      icon: Icons.error_outline_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pilot recognizing problem:",
              style: TextStyle(color: efb_textGrey, fontSize: 12)),
          const SizedBox(height: 4),
          _bulletTextAlert(
              "POWER LOSS, ENGINE FIRE,\nor whatever the unsafe condition."),
          const SizedBox(height: 8),
          Text("If no REJECT called, continue to fly the airplane.",
              style: TextStyle(
                  color: efb_textWhite,
                  fontStyle: FontStyle.italic,
                  fontSize: 13)),
        ],
      ),
    );
  }

  // 10. Runway Lighting Card (lower right central column)
  Widget _buildRunwayLightingCard() {
    return _buildNoteCard(
      title: "RUNWAY LIGHTING",
      icon: Icons.lightbulb_outline,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rowText("3000'-1000'", "CL lights change to alternate red-white"),
          _rowText("last 1000'", "CL lights are all red!"),
          _rowText("last 2000'", "rwy edge lights change from white to amber"),
        ],
      ),
    );
  }

  // 11. Flap Speeds Table
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

  // 12. Evacuation Reference Section (Summarized map with zoom)
  Widget _buildEvacuationReferenceSection() {
    return _buildCardWithTitle(
      title: "EVACUATION REF (Page 9 Reference Chart)",
      icon: Icons.map_outlined,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText("Tap image to view in full screen with zoom controls."),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _openZoomableImage(context),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: boeingCyanAccent.withOpacity(0.2), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.referenceImageUrl ??
                      'https://via.placeholder.com/600x400/1E293B/F8FAFC?text=Evacuation+Ref+P.9', // Placeholder if no URL
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

  // Function to open chart full screen with zoom
  void _openZoomableImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            AppBar(
              backgroundColor: efb_cardColor,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                "Evacuation Ref - P.9",
                style: TextStyle(color: Colors.white),
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
                        'https://via.placeholder.com/800x600/1E293B/F8FAFC?text=P.9+Detailed+Chart',
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

  // Helper widget when image fails to load
  Widget _buildImagePlaceholder() {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.white10,
      child: Center(
        child: Icon(Icons.broken_image, color: efb_textGrey, size: 48),
      ),
    );
  }

  // 13. Safety Footer
  Widget _buildSafetyFooter() {
    // تم إصلاح الخطأ: تحويل السطر 511 إلى Named Arguments
    return _buildSafetyFooterCard(
      pageNumber: "Page 9",
    );
  }

  // Helper function to build safety footer card
  Widget _buildSafetyFooterCard({required String pageNumber}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: efb_textWhite.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: limitationRedReject.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded,
                  color: limitationRedReject, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "ALL LIMITS ARE CRITICAL - EXCEEDING THEM MAY COMPROMISE SAFETY.",
                  style: TextStyle(
                      color: efb_textWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            pageNumber,
            style: TextStyle(color: efb_textGrey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(FontAwesomeIcons.shieldHalved,
                  color: boeingCyanAccent, size: 16),
              const SizedBox(width: 6),
              Text(
                "FLY SAFE",
                style: TextStyle(
                    color: efb_textWhite,
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
        color: efb_cardColor,
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
                Icon(icon,
                    color: isAlert ? limitationRedReject : boeingCyanAccent,
                    size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: isAlert ? limitationRedReject : boeingCyanAccent,
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
    return _buildCard(
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: aviationWarningAmber, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: aviationWarningAmber,
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
          Text("• ", style: TextStyle(color: efb_textWhite, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: efb_textWhite, fontSize: 13, height: 1.4),
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
          Text("• ",
              style: TextStyle(color: limitationRedReject, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: efb_textWhite, fontSize: 13, height: 1.4),
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
              color: efb_textWhite.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              number,
              style: TextStyle(
                  color: efb_textWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: efb_textWhite, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(color: efb_textWhite, fontSize: 13),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(color: efb_textWhite, fontSize: 13),
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
        style: TextStyle(color: efb_textWhite, fontSize: 13, height: 1.4),
      ),
    );
  }

  Widget _flowStep(String phase, String details) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border:
              Border(left: BorderSide(color: aviationWarningAmber, width: 3)),
        ),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              phase,
              style: TextStyle(
                  color: efb_textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              details,
              style: TextStyle(color: efb_textWhite, height: 1.4, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for table widgets
  Widget _tableHeader(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: boeingCyanAccent, fontWeight: FontWeight.bold)),
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
            textAlign: textAlign, style: TextStyle(color: efb_textWhite)),
      );

  // Helper for speed indicator zones
  Widget _buildRtoSpeedZone(String label, String range, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(range, style: TextStyle(color: efb_textGrey, fontSize: 12)),
        ],
      ),
    );
  }

  // Helper function to build a card with named arguments
  Widget _buildCrewEvacuationDutiesCardWithNamedArgs({
    required String title,
    required IconData icon,
    required Widget content,
    bool isAlert = false,
    bool isWarning = false,
  }) {
    return _buildCardWithTitle(
      title: title,
      icon: icon,
      content: content,
      isAlert: isAlert,
      isWarning: isWarning,
    );
  }
}
