// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class B737IlsApproachProfileEFB extends StatefulWidget {
  const B737IlsApproachProfileEFB({
    Key? key,
    this.width,
    this.height,
    this.imageUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? imageUrl;

  @override
  _B737IlsApproachProfileEFBState createState() =>
      _B737IlsApproachProfileEFBState();
}

class _B737IlsApproachProfileEFBState extends State<B737IlsApproachProfileEFB> {
  // --- Dark Mode Aviation Theme Colors ---
  final Color bgColor = const Color(0xFF0B1120); // Deep EFB Dark Background
  final Color cardColor = const Color(0xFF1E293B); // Dark Slate for Cards
  final Color accentBlue = const Color(0xFF38BDF8); // Boeing Cyan Accent
  final Color textWhite = const Color(0xFFF8FAFC); // Main Readability Text
  final Color textGrey = const Color(0xFF94A3B8); // Secondary Text
  final Color fmaGreen = const Color(0xFF4ADE80); // FMA Engaged Green
  final Color warningAmber = const Color(0xFFFBBF24); // Aviation Amber
  final Color alertRed = const Color(0xFFEF4444); // Alerts / Warnings

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
            const SizedBox(height: 20),
            _buildApproachPreparationCard(),
            const SizedBox(height: 16),
            _buildApproachSequenceCard(),
            const SizedBox(height: 16),
            _buildTolerancesLimitsCard(),
            const SizedBox(height: 16),
            _buildMonitoredProcedureCard(),
            const SizedBox(height: 24),
            _buildReferenceImageSection(context),
          ],
        ),
      ),
    );
  }

  // 1. Header Section
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "ILS APPROACH",
          style: TextStyle(
            color: accentBlue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          "MONITORED PROCEDURE / CAT I, II, III",
          style: TextStyle(
            color: textWhite,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          "PF = Pilot Flying  |  PM = Pilot Monitoring",
          style: TextStyle(color: textGrey, fontSize: 14),
        ),
        const SizedBox(height: 16),
        Container(
          height: 2,
          width: double.infinity,
          color: accentBlue.withOpacity(0.3),
        ),
      ],
    );
  }

  // 2. Approach Preparation Card
  Widget _buildApproachPreparationCard() {
    return _buildCard(
      title: "APPROACH PREPARATION",
      icon: Icons.checklist_rtl_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "Check weather, select desired approach, brief transition and approach, especially stepdowns."),
          _bulletText("Complete IN RANGE CHECK."),
          _bulletText("Use autothrottle and autopilot."),
        ],
      ),
    );
  }

  // 3. Approach Sequence Card
  Widget _buildApproachSequenceCard() {
    return _buildCard(
      title: "APPROACH SEQUENCE & CONFIGURATION",
      icon: Icons.flight_land,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _flowStep("Downwind", "PF: FLAPS 1, SPEED* \nAPPROACH CHECK"),
          _flowStep("Turning Base", "PF: FLAPS 5, SPEED*"),
          _flowStep("On Base Leg", "PF: FLAPS 10, SPEED*"),
          _flowStep("Cleared for Approach: ARM",
              "• LOC or APP \n• Observe VOR/LOC and/or GS ARM annunciation on FMA \n• Engage second A/P \n• Transition to the ADI"),
          _flowStep("1 1/2 Dots Below GS",
              "PF: GEAR DOWN, FLAPS 15, SPEED* \nLANDING CHECK"),
          _flowStep("GS Capture",
              "PF: FLAPS 30 / 40, TARGET* \nSet M/A altitude. FMA annunciates G/S ENGAGED and GA."),
        ],
      ),
    );
  }

  // 4. Tolerances & Limits Card
  Widget _buildTolerancesLimitsCard() {
    return _buildCard(
      title: "TOLERANCES & APP LIMITS (CAT II/IIIA)",
      icon: Icons.warning_amber_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Final Approach Segment:",
            style: TextStyle(color: accentBlue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _rowText("G/S & LOC", "± 1 Dot"),
          _rowText("Airspeed", "-5 / +15 of target"),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: alertRed.withOpacity(0.1),
              border: Border(left: BorderSide(color: alertRed, width: 3)),
            ),
            child: Text(
              "Unstable approach below 1,000 ft must terminate in a go-around.",
              style: TextStyle(
                  color: alertRed, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const Divider(color: Colors.white24, height: 24),
          Text(
            "Decision Regime (500' to Flare):",
            style: TextStyle(color: accentBlue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _rowText("LOC", "± 1/3 Dot"),
          _rowText("Airspeed", "± 5 kts of target"),
          _rowText("Max Descent", "1,000 fpm"),
          _rowText("Max Crab Angle", "10°"),
          const SizedBox(height: 8),
          _bulletText("No new warning lights, flags, or GPWS activation."),
          const SizedBox(height: 8),
          Text(
            "Wind Limits:",
            style: TextStyle(
                color: warningAmber, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          _bulletText("Headwind 20 kts | Tailwind 10 kts | Crosswind 15 kts"),
        ],
      ),
    );
  }

  // 5. Monitored Procedure & Go Around
  Widget _buildMonitoredProcedureCard() {
    return _buildCard(
      title: "MONITORED PROCEDURE & GO-AROUND",
      icon: Icons.sync_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "Press TOGA: If A/T is on, press once for reduced thrust, twice for full thrust. If A/T is off, straight-arm throttles to cursors."),
          const SizedBox(height: 12),
          Text(
            "Single A/P vs Dual A/P:",
            style: TextStyle(color: accentBlue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          _numberedText("S",
              "Single A/P: A/P disengages. Manually rotate to 15°. Look at the ADI."),
          _numberedText("D",
              "Dual A/P: A/P rotates to 15° then controls pitch to hold airspeed... Accomplish steps no faster than you can do them, slow down."),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: warningAmber.withOpacity(0.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PF CALLOUTS:",
                  style: TextStyle(
                      color: warningAmber, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "FLAPS 15, CHECK POWER... \nPOSITIVE RATE... \nGEAR UP... \nCHECK MISSED APPROACH ALTITUDE",
                  style: TextStyle(
                      color: textWhite,
                      height: 1.5,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 6. Uploaded Image Viewer Section
  Widget _buildReferenceImageSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.image, color: accentBlue),
                const SizedBox(width: 8),
                Text(
                  "REFERENCE CHART",
                  style: TextStyle(
                    color: accentBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty)
              Text(
                "Tap to Zoom",
                style: TextStyle(color: fmaGreen, fontSize: 12),
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
          padding: const EdgeInsets.all(8),
          child: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
              ? GestureDetector(
                  onTap: () => _openZoomableImage(context, widget.imageUrl!),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.imageUrl!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildImagePlaceholder(),
                    ),
                  ),
                )
              : _buildImagePlaceholder(),
        ),
      ],
    );
  }

  // Function to open image in full screen with zoom
  void _openZoomableImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: cardColor,
            elevation: 0,
            iconTheme: IconThemeData(color: textWhite),
            title: Text(
              "CHART VIEWER",
              style: TextStyle(
                  color: accentBlue, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 5.0,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_upload_outlined, color: textGrey, size: 48),
          const SizedBox(height: 12),
          Text(
            "No reference image uploaded.",
            style: TextStyle(color: textGrey),
          ),
          Text(
            "Upload chart via widget parameters.",
            style: TextStyle(color: textGrey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // --- Helper UI Builders ---

  Widget _buildCard(
      {required String title,
      required IconData icon,
      required Widget content}) {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: accentBlue, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: accentBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
          Text("• ",
              style: TextStyle(
                  color: accentBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textWhite, fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberedText(String letter, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: accentBlue.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Text(
              letter,
              style: TextStyle(
                color: accentBlue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                text,
                style: TextStyle(color: textWhite, fontSize: 14, height: 1.4),
              ),
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
              style: TextStyle(
                  color: fmaGreen, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(color: textWhite, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _flowStep(String phase, String details) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: accentBlue, width: 3)),
        ),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              phase,
              style: TextStyle(
                  color: warningAmber,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
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
