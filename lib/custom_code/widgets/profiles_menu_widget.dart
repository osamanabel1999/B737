// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ProfilesMenuWidget extends StatefulWidget {
  const ProfilesMenuWidget({
    Key? key,
    this.width,
    this.height,
    this.onTakeoffProfileEFBTap,
    this.onIlsApproachProfileEFBTap,
    this.onTraditionalStepDownEFBTap,
    this.onRnavApproachProfileEFBTap,
    this.onRejectedTakeoffEFBTap,
    this.onV1CutProfileEFBTap,
    this.onOneEngIlsMissedApproachEFBTap,
    this.onWindshearTakeoffEFBTap,
    this.onApproachToStallProfileEFBTap,
    this.onSteepTurnsProfileEFBTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future Function()? onTakeoffProfileEFBTap;
  final Future Function()? onIlsApproachProfileEFBTap;
  final Future Function()? onTraditionalStepDownEFBTap;
  final Future Function()? onRnavApproachProfileEFBTap;
  final Future Function()? onRejectedTakeoffEFBTap;
  final Future Function()? onV1CutProfileEFBTap;
  final Future Function()? onOneEngIlsMissedApproachEFBTap;
  final Future Function()? onWindshearTakeoffEFBTap;
  final Future Function()? onApproachToStallProfileEFBTap;
  final Future Function()? onSteepTurnsProfileEFBTap;

  @override
  State<ProfilesMenuWidget> createState() => _ProfilesMenuWidgetState();
}

class _ProfilesMenuWidgetState extends State<ProfilesMenuWidget> {
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
          _buildMenuButton(
              'Takeoff Profile EFB', widget.onTakeoffProfileEFBTap),
          _buildMenuButton(
              'ILS Approach Profile EFB', widget.onIlsApproachProfileEFBTap),
          _buildMenuButton(
              'Traditional Step Down EFB', widget.onTraditionalStepDownEFBTap),
          _buildMenuButton(
              'RNAV Approach Profile EFB', widget.onRnavApproachProfileEFBTap),
          _buildMenuButton(
              'Rejected Takeoff EFB', widget.onRejectedTakeoffEFBTap),
          _buildMenuButton('V1 Cut Profile EFB', widget.onV1CutProfileEFBTap),
          _buildMenuButton('One Eng ILS Missed Approach EFB',
              widget.onOneEngIlsMissedApproachEFBTap),
          _buildMenuButton(
              'Windshear Takeoff EFB', widget.onWindshearTakeoffEFBTap),
          _buildMenuButton('Approach To Stall Profile EFB',
              widget.onApproachToStallProfileEFBTap),
          _buildMenuButton(
              'Steep Turns Profile EFB', widget.onSteepTurnsProfileEFBTap),
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
