// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B737SteepTurnsProfileEFB extends StatefulWidget {
  const B737SteepTurnsProfileEFB({
    Key? key,
    this.width,
    this.height,
    this.referenceImageUrl, // Parameter for the uploaded reference image
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? referenceImageUrl;

  @override
  _B737SteepTurnsProfileEFBState createState() =>
      _B737SteepTurnsProfileEFBState();
}

class _B737SteepTurnsProfileEFBState extends State<B737SteepTurnsProfileEFB> {
  // --- Dark Mode Aviation Theme Colors ---
  final Color bgColor = const Color(0xFF0B1120); // Deep EFB Dark Background
  final Color cardColor = const Color(0xFF1E293B); // Dark Slate for Cards
  final Color accentBlue = const Color(0xFF38BDF8); // Boeing Cyan Accent
  final Color textWhite = const Color(0xFFF8FAFC); // Main Readability Text
  final Color textGrey = const Color(0xFF94A3B8); // Secondary Text
  final Color greenEngaged = const Color(0xFF4ADE80); // FMA Engaged Green
  final Color warningAmber = const Color(0xFFFBBF24); // Aviation Amber
  final Color redReject = const Color(0xFFEF4444); // Alerts / Limitations

  // Unique layout colors from image_12.png
  final Color tolerancesColor = const Color(0xFF38BDF8); // Blue
  final Color inRangeColor = const Color(0xFF4ADE80); // Green
  final Color startTurnColor = const Color(0xFF9333EA); // Purple
  final Color at45Color = const Color(0xFF1E40AF); // Dark Blue
  final Color call15Color = const Color(0xFFF97316); // Orange

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
            _buildTolerancesCard(),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildInRangeCheckCard()),
                const SizedBox(width: 12),
                Expanded(child: _buildStartTurnCard()),
                const SizedBox(width: 12),
                Expanded(child: _buildAt45BankCard()),
              ],
            ),
            const SizedBox(height: 16),
            _buildCall15LeadCard(),
            const SizedBox(height: 24),
            _buildBottomSectionData(), // EFIS notes, graphs, tables
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "B737 PROFILES",
                  style: TextStyle(
                      color: textGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Not endorsed by any airline. Attempt to make AC120-29A compliant.",
                    style: TextStyle(color: textGrey, fontSize: 10),
                  ),
                ),
              ],
            ),
            Text(
              "STEEP TURNS",
              style: TextStyle(
                  color: textWhite,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("PF = Pilot Flying",
                    style: TextStyle(color: textGrey, fontSize: 12)),
                Text("PM = Pilot Monitoring",
                    style: TextStyle(color: textGrey, fontSize: 12)),
              ],
            ),
          ],
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

  // 2. TOLERANCES Card
  Widget _buildTolerancesCard() {
    return _buildNoteCard(
      title: "TOLERANCES:",
      icon: Icons.track_changes,
      color: tolerancesColor,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText("•  ± 100'"),
          _bulletText("•  ± 10 kts"),
          _bulletText("•  45° bank ± 5°"),
          _bulletText("•  Hdg ± 5° of recovery heading."),
        ],
      ),
    );
  }

  // 3. الأقسام الثلاثة الرئيسية (In-Range, Start Turn, At 45°)
  Widget _buildInRangeCheckCard() {
    return _buildConfigCard(
      title: "IN-RANGE CHECK",
      icon: Icons.checklist_rtl_rounded,
      color: inRangeColor,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Panel lights on bright to see pitch bars.",
              style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
          const SizedBox(height: 8),
          _stepText(
              "On your altitude:\n• A/P ON **\n• A/T ON (set spd 250 kts)"),
          _stepText(
              "• Put CDI on nose and de-tune radio.\n• Note pitch and N1. 4 1/2°, 62% N1"),
          _stepText(
              "• A/T OFF\n• Deselect HDG\n• *Deselect ALT HOLD by spinning MCP...\n• Set HDG bug on tail\n• A/P OFF"),
        ],
      ),
    );
  }

  Widget _buildStartTurnCard() {
    return _buildConfigCard(
      title: "START THE TURN",
      icon: Icons.alt_route,
      color: startTurnColor,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stepText(
              "As bank is increased beyond 25°, increase pitch 1/2° and push in power one knob (8% N1)."),
          _stepText("Non EFIS, use the F/S anticipator."),
          _stepText(
              "Pitch attitude control is utilized to maintain or correct back to the altitude; power is employed to maintain the airspeed."),
          _stepTextCheckbox("Don't trim."),
        ],
      ),
    );
  }

  Widget _buildAt45BankCard() {
    return _buildConfigCard(
      title: "AT 45° BANK",
      icon: Icons.shield_rounded,
      color: at45Color,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stepText(
              "You'll be 5 ± 1/2° nose up at 45° bank.\nReference:\nControl Instruments:"),
          _bulletText("• ADI - 5° pitch / 45° bank\n• Power - 68% N1"),
          _stepText(
              "\nPerformance Instruments:\n• Airspeed, (non-EFIS - F/S indicator) and altimeter."),
          _criticalNote(
              "Use light control pressures when making any corrections back to the desired pitch or bank indication."),
        ],
      ),
    );
  }

  // 4. CALL THE 15° LEAD Card
  Widget _buildCall15LeadCard() {
    return _buildConfigCard(
      title: "CALL THE 15° LEAD",
      icon: Icons.notification_important,
      color: call15Color,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _stepText(
                    "Ask PM to call the 15° lead.\nRule: Average amount of lead is approximately 1/3 the angle of bank.\nRollout same rate as entry."),
                _stepText(
                    "Control Instruments:\n• ADI - Relax back pressure to entry pitch."),
                _stepText("• Power - Pull throttles back to entry N1"),
              ],
            ),
          ),
          _buildVerticalDivider(),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _stepText(
                    "Performance Instruments:\n• Airspeed, (non-EFIS - F/S indicator) and altimeter.\nRepeat in other direction."),
                _stepText(
                    "On your altitude:\n• A/P ON **\n• A/T ON (set top bug for next maneuver)."),
                _boldText("Prepare for stall series."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 5. Bottom Section Data (Notes, graphs, tables)
  Widget _buildBottomSectionData() {
    return _buildCard(
      padding: const EdgeInsets.all(12.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _buildEfisNotesCard(),
              ),
              const SizedBox(width: 12),
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
                    style: TextStyle(color: call15Color, fontSize: 12)),
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

  Widget _buildEfisNotesCard() {
    return _buildNoteCard(
      title: "EFIS aircraft NOTES",
      icon: Icons.grid_view_rounded,
      color: accentBlue,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("3 STEPS TO ENGAGE A/P",
              style: TextStyle(color: textWhite, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          _numberedNote("1.", "A/P ON (set HDG SEL, press HDG and ALT HOLD)"),
          _numberedNote("2.", "A/T ON (set speed)"),
          _numberedNote("3.", "Check FMA"),
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
          const Text("FLY SAFE",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Page 13", style: TextStyle(color: textGrey, fontSize: 12)),
              Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: redReject, size: 16),
                  const SizedBox(width: 6),
                  Text(
                      "ALL LIMITS ARE CRITICAL - EXCEEDING THEM MAY COMPROMISE SAFETY.",
                      style: TextStyle(
                          color: redReject,
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
    required IconData icon,
    required Color color,
    required Widget content,
  }) {
    return _buildCard(
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
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
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildNoteCard({
    required String title,
    required IconData icon,
    required Color color,
    required Widget content,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
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
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() => Container(
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
              color: tolerancesColor,
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
              color: inRangeColor, fontSize: 14, fontWeight: FontWeight.bold)),
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
            child: Text(text,
                style: TextStyle(color: textWhite, fontSize: 13, height: 1.4)),
          ),
        ],
      ),
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
