// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class HomePageMenuWidget extends StatefulWidget {
  const HomePageMenuWidget({
    Key? key,
    this.width,
    this.height,
    this.onLimitationsTap,
    this.onProceduresTap,
    this.onCockpitLayoutTap,
    this.onExamTap,
    this.onTermsOfUseTap,
    this.onPrivacyPolicyTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future Function()? onLimitationsTap;
  final Future Function()? onProceduresTap;
  final Future Function()? onCockpitLayoutTap;
  final Future Function()? onExamTap;
  final Future Function()? onTermsOfUseTap;
  final Future Function()? onPrivacyPolicyTap;

  @override
  State<HomePageMenuWidget> createState() => _HomePageMenuWidgetState();
}

class _HomePageMenuWidgetState extends State<HomePageMenuWidget> {
  final Color bgColor = const Color(0xFF0B132B);
  final Color cardColor = const Color(0xFF1C2541);
  final Color borderColor = const Color(0xFF3A506B);
  final Color accentColor = const Color(0xFF5BC0BE);
  final Color textColor = const Color(0xFFFFFFFF);
  final Color subTextColor = const Color(0xFFA1A1AA); // Added for footer text

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        children: [
          // App Title Header
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0, top: 16.0),
            child: Text(
              'B737 INSTRUCTOR',
              style: TextStyle(
                color: accentColor,
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Main Menu Buttons
          _buildMenuButton(
            'Limitations',
            widget.onLimitationsTap,
            Icons.warning_amber_rounded,
          ),
          _buildMenuButton(
            'Procedures',
            widget.onProceduresTap,
            Icons.library_books_rounded,
          ),
          _buildMenuButton(
            'Cockpit Layout',
            widget.onCockpitLayoutTap,
            Icons.dashboard_rounded,
          ),
          _buildMenuButton(
            'B737 Type Rating Exam',
            widget.onExamTap,
            Icons.quiz_rounded,
          ),

          // Spacing before footer
          const SizedBox(height: 60.0),

          // Footer Links (Terms & Privacy)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterLink('Terms of use', widget.onTermsOfUseTap),
              const SizedBox(width: 24.0), // Space between the two links
              _buildFooterLink('Privacy policy', widget.onPrivacyPolicyTap),
            ],
          ),
          const SizedBox(height: 20.0), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildMenuButton(
      String title, Future Function()? onTapAction, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
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
            border: Border.all(color: borderColor, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: accentColor,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: accentColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLink(String text, Future Function()? onTapAction) {
    return InkWell(
      onTap: () async {
        if (onTapAction != null) {
          await onTapAction();
        }
      },
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          text,
          style: TextStyle(
            color: subTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: subTextColor,
          ),
        ),
      ),
    );
  }
}
