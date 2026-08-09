// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class LimitationsMenuWidget extends StatefulWidget {
  const LimitationsMenuWidget({
    Key? key,
    this.width,
    this.height,
    this.onB737LimitationsTap,
    this.onB737AirspeedsTap,
    this.onApuLimitationsTap,
    this.onElectricalLimitationsTap,
    this.onEvacuationSystemsTap,
    this.onFlightControlsTap,
    this.onFlightInstrumentsTap,
    this.onIcingConditionsTap,
    this.onMiscellaneousLimitationsTap,
    this.onNavigationPerformanceTap,
    this.onWeightsAndThrustTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future Function()? onB737LimitationsTap;
  final Future Function()? onB737AirspeedsTap;
  final Future Function()? onApuLimitationsTap;
  final Future Function()? onElectricalLimitationsTap;
  final Future Function()? onEvacuationSystemsTap;
  final Future Function()? onFlightControlsTap;
  final Future Function()? onFlightInstrumentsTap;
  final Future Function()? onIcingConditionsTap;
  final Future Function()? onMiscellaneousLimitationsTap;
  final Future Function()? onNavigationPerformanceTap;
  final Future Function()? onWeightsAndThrustTap;

  @override
  State<LimitationsMenuWidget> createState() => _LimitationsMenuWidgetState();
}

class _LimitationsMenuWidgetState extends State<LimitationsMenuWidget> {
  final Color bgColor = const Color(0xFF0B132B);
  final Color cardColor = const Color(0xFF1C2541);
  final Color borderColor = const Color(0xFF3A506B);
  final Color accentColor = const Color(0xFF5BC0BE);
  final Color textColor = const Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        children: [
          _buildMenuButton('B737 Limitations', widget.onB737LimitationsTap),
          _buildMenuButton('B737 Airspeeds', widget.onB737AirspeedsTap),
          _buildMenuButton('APU Limitations', widget.onApuLimitationsTap),
          _buildMenuButton(
              'Electrical Limitations', widget.onElectricalLimitationsTap),
          _buildMenuButton('Evacuation Systems', widget.onEvacuationSystemsTap),
          _buildMenuButton('Flight Controls', widget.onFlightControlsTap),
          _buildMenuButton('Flight Instruments', widget.onFlightInstrumentsTap),
          _buildMenuButton('Icing Conditions', widget.onIcingConditionsTap),
          _buildMenuButton('Miscellaneous Limitations',
              widget.onMiscellaneousLimitationsTap),
          _buildMenuButton(
              'Navigation Performance', widget.onNavigationPerformanceTap),
          _buildMenuButton('Weights and Thrust', widget.onWeightsAndThrustTap),
        ],
      ),
    );
  }

  Widget _buildMenuButton(String title, Future Function()? onTapAction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: InkWell(
        onTap: () async {
          if (onTapAction != null) {
            await onTapAction();
          }
        },
        borderRadius: BorderRadius.circular(12),
        splashColor: accentColor.withOpacity(0.2),
        highlightColor: accentColor.withOpacity(0.1),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: accentColor,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
