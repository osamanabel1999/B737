import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'procedures_model.dart';
export 'procedures_model.dart';

class ProceduresWidget extends StatefulWidget {
  const ProceduresWidget({super.key});

  static String routeName = 'PROCEDURES';
  static String routePath = '/procedures';

  @override
  State<ProceduresWidget> createState() => _ProceduresWidgetState();
}

class _ProceduresWidgetState extends State<ProceduresWidget> {
  late ProceduresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProceduresModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF1E293B),
        appBar: AppBar(
          backgroundColor: Color(0xFF1E293B),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'B737',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FFAppState().Procedure == '1')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737TakeoffProfileEFB(
                      width: double.infinity,
                      height: double.infinity,
                      imageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/6F870EBE-8FCD-422E-9A56-1F69802870E8.png',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '2')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737IlsApproachProfileEFB(
                      width: double.infinity,
                      height: double.infinity,
                      imageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/6446A620-569B-4207-AC65-1B9374925FE9.png',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '3')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737TraditionalStepDownEFB(
                      width: double.infinity,
                      height: double.infinity,
                      referenceImageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/2D319166-AB37-485D-AA5A-2159500BC482.png',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '4')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737RnavApproachProfileEFB(
                      width: double.infinity,
                      height: double.infinity,
                      referenceImageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/8A00871F-800D-4BBC-824D-5129F9D29A1A.jpeg',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '5')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737RejectedTakeoffEFB(
                      width: double.infinity,
                      height: double.infinity,
                      referenceImageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/E63CFBA3-FB4D-4B1F-B231-6D08C1C20D98.png',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '6')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737V1CutProfileEFB(
                      width: double.infinity,
                      height: double.infinity,
                      referenceImageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/A7464D97-9FD0-44A0-9D88-F59F4A23DACF.png',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '7')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737OneEngIlsMissedApproachEFB(
                      width: double.infinity,
                      height: double.infinity,
                      referenceChartUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/4591EE74-5B19-41CC-9445-35984E6F8CD9.png',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '8')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737WindshearTakeoffEFB(
                      width: double.infinity,
                      height: double.infinity,
                      referenceImageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/D29811DC-6E54-4A45-BF7D-4FB1A8401ED6.png',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '9')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737ApproachToStallProfileEFB(
                      width: double.infinity,
                      height: double.infinity,
                      referenceImageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/8F81695E-D4F6-4D78-A9DB-2D071D35558C.png',
                    ),
                  ),
                ),
              if (FFAppState().Procedure == '10')
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737SteepTurnsProfileEFB(
                      width: double.infinity,
                      height: double.infinity,
                      referenceImageUrl:
                          'https://raw.githubusercontent.com/osamanabel1999/App-assets/refs/heads/main/F6D3187C-B7CF-44E8-A84C-6E7B12B96F49.png',
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                FlutterFlowAdBanner(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  showsTestAd: false,
                  iOSAdUnitID: 'ca-app-pub-7880697829268273/1962313303',
                  androidAdUnitID: 'ca-app-pub-7880697829268273/3249530151',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
