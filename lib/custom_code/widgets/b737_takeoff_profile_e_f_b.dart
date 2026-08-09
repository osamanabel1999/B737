// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class B737TakeoffProfileEFB extends StatefulWidget {
  const B737TakeoffProfileEFB({
    Key? key,
    this.width,
    this.height,
    this.imageUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? imageUrl; // Parameter for the uploaded reference image

  @override
  _B737TakeoffProfileEFBState createState() => _B737TakeoffProfileEFBState();
}

class _B737TakeoffProfileEFBState extends State<B737TakeoffProfileEFB> {
  // --- Dark Mode Aviation Theme Colors ---
  final Color bgColor = const Color(0xFF0B1120); // Deep EFB Dark Background
  final Color cardColor = const Color(0xFF1E293B); // Dark Slate for Cards
  final Color accentBlue = const Color(0xFF38BDF8); // Boeing Cyan Accent
  final Color textWhite = const Color(0xFFF8FAFC); // Main Readability Text
  final Color textGrey = const Color(0xFF94A3B8); // Secondary Text
  final Color fmaGreen = const Color(0xFF4ADE80); // FMA Engaged Green
  final Color warningAmber = const Color(0xFFFBBF24); // Aviation Amber

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
            _buildTakeoffAlternateCard(),
            const SizedBox(height: 16),
            _buildKeyNotesCard(),
            const SizedBox(height: 16),
            _buildSpeedsReviewCard(),
            const SizedBox(height: 16),
            _buildTakeoffFlowCard(),
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
          "B737 NORMAL TAKEOFF",
          style: TextStyle(
            color: accentBlue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
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

  // 2. Takeoff Alternate Card
  Widget _buildTakeoffAlternateCard() {
    return _buildCard(
      title: "TAKEOFF ALTERNATE & MINIMUMS",
      icon: Icons.track_changes,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bulletText(
              "If departure weather is below landing minimums (CAT I) you need a takeoff alternate within one hour (still air - 390 nm)."),
          _bulletText(
              "Takeoff alternate must meet same weather minimums as regular alternate."),
          const SizedBox(height: 12),
          Text(
            "Takeoff Minimums: 2 Engine",
            style: TextStyle(color: warningAmber, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _bulletText("Standard: 5000 RVR / 1 mile"),
          _bulletText(
              "Reduced to 1600 RVR: Controlling RVR required if available."),
          _bulletText(
              "Reduced to 1200/1000 RVR: Required Controlling for TDZ and Rollout."),
        ],
      ),
    );
  }

  // 3. Key Notes Card (1-10 from the chart)
  Widget _buildKeyNotesCard() {
    return _buildCard(
      title: "CRITICAL OPERATIONAL NOTES",
      icon: Icons.list_alt_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _numberedText("1",
              "Flaps 1 offers better climb performance than Flaps 5 but requires a little longer runway and about 6 kts more airspeed."),
          _numberedText("2",
              "If full thrust is desired during reduced power TO, manually position levers to max thrust limit. (This is a distraction, 5 min. limit)."),
          _numberedText("3", "A/P can be engaged above 1,000 ft AGL."),
          _numberedText("6",
              "Pitch attitude for tail strike: -300 = 13° / -500 = 14.5° / -700 = 15° / -800 = 11° / -900 = 9°."),
          _numberedText("8",
              "Crosswind consideration: Spoiler deflection begins at 1.6 units control wheel steering for OG737 and 1.2 units for NG737."),
          const SizedBox(height: 12),
          Text("ICAO Procedures:",
              style: TextStyle(color: accentBlue, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          _numberedText("9",
              "ICAO Procedure A: Climb at V2 + 10-20 to 1500 ft AGL. At 1500 ft AGL: LEVEL CHANGE. Climb to 3000 ft AGL."),
          _numberedText("10",
              "ICAO Procedure B: Climb at V2+10-20 to 1,000 ft AGL. At 1000 ft AFE: VNAV, FLAPS 1, or LEVEL CHANGE, SET TOP BUG, FLAPS 1."),
        ],
      ),
    );
  }

  // 4. Speeds Review Card
  Widget _buildSpeedsReviewCard() {
    return _buildCard(
      title: "REVIEW OF SPEEDS",
      icon: Icons.speed_rounded,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rowText("MAX ANGLE", "Approx top bug + 10 kts"),
          const Divider(color: Colors.white24),
          _rowText("L/D MAX",
              "Green Donut on 300/500 EFIS speed tape. Equals TGT SPD on Eng Out page."),
          const Divider(color: Colors.white24),
          Text(
            "Flap Maneuver Speeds (Example: Flaps 5 = 180 / 190 kts)",
            style: TextStyle(
                color: textGrey, fontSize: 13, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  // 5. Takeoff Flow & Sequence
  Widget _buildTakeoffFlowCard() {
    return _buildCard(
      title: "TAKEOFF SEQUENCE & CALLOUTS",
      icon: Icons.flight_takeoff,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _flowStep("Thrust Setting",
              "PF: Stabilize thrust approx. 40% N1. Push to 70-80% N1, Press TOGA. \nPM: Check FMA - TOGA, N1. Check 8500 pph FF."),
          _flowStep("80 Knots",
              "PM: '80 Knots'. Both compare primary airspeed to standby."),
          _flowStep("V1 & Rotate",
              "PM: 'V1, Rotate'. Rotate at 2.5° per sec to approximately 15° (6° in classic)."),
          _flowStep("Positive Rate",
              "PM: 'Positive Rate'. \nPF: 'Gear Up'. IAS and VS are primary instruments."),
          _flowStep("400' AFE",
              "PF: HDG SEL or LNAV. (Minimum alt to start a turn)."),
          _flowStep("1000' AFE (Flaps 5 TO)",
              "PF: VNAV, FLAPS 1, or LEVEL CHANGE, SET TOP BUG, FLAPS 1."),
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
            backgroundColor: cardColor, // نفس درجة الرمادي الكحلي للبطاقات
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
            automaticallyImplyLeading:
                false, // يخفي زر الرجوع الافتراضي لنعتمد على زر X
          ),
          body: Center(
            child: InteractiveViewer(
              panEnabled: true, // يتيح السحب يمين ويسار
              minScale: 0.5, // أقل زووم
              maxScale: 5.0, // أقصى زووم (5 أضعاف)
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
          Text("• ", style: TextStyle(color: textWhite, fontSize: 16)),
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

  Widget _numberedText(String number, String text) {
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
              number,
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
              style: TextStyle(color: fmaGreen, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(color: textWhite),
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
                  fontSize: 15),
            ),
            const SizedBox(height: 4),
            Text(
              details,
              style: TextStyle(color: textWhite, height: 1.4, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
