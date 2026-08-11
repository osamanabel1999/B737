import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'proceduremenu_model.dart';
export 'proceduremenu_model.dart';

class ProceduremenuWidget extends StatefulWidget {
  const ProceduremenuWidget({super.key});

  static String routeName = 'Proceduremenu';
  static String routePath = '/proceduremenu';

  @override
  State<ProceduremenuWidget> createState() => _ProceduremenuWidgetState();
}

class _ProceduremenuWidgetState extends State<ProceduremenuWidget> {
  late ProceduremenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProceduremenuModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            'Page Title',
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.ProfilesMenuWidget(
                    width: double.infinity,
                    height: double.infinity,
                    onTakeoffProfileEFBTap: () async {
                      FFAppState().Procedure = '1';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onIlsApproachProfileEFBTap: () async {
                      FFAppState().Procedure = '2';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onTraditionalStepDownEFBTap: () async {
                      FFAppState().Procedure = '3';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onRnavApproachProfileEFBTap: () async {
                      FFAppState().Procedure = '4';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onRejectedTakeoffEFBTap: () async {
                      FFAppState().Procedure = '5';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onV1CutProfileEFBTap: () async {
                      FFAppState().Procedure = '6';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onOneEngIlsMissedApproachEFBTap: () async {
                      FFAppState().Procedure = '7';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onWindshearTakeoffEFBTap: () async {
                      FFAppState().Procedure = '8';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onApproachToStallProfileEFBTap: () async {
                      FFAppState().Procedure = '9';
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                    onSteepTurnsProfileEFBTap: () async {
                      safeSetState(() {});

                      context.pushNamed(ProceduresWidget.routeName);
                    },
                  ),
                ),
              ),
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
