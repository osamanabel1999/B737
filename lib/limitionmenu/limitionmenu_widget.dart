import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'limitionmenu_model.dart';
export 'limitionmenu_model.dart';

class LimitionmenuWidget extends StatefulWidget {
  const LimitionmenuWidget({super.key});

  static String routeName = 'Limitionmenu';
  static String routePath = '/limitionmenu';

  @override
  State<LimitionmenuWidget> createState() => _LimitionmenuWidgetState();
}

class _LimitionmenuWidgetState extends State<LimitionmenuWidget> {
  late LimitionmenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitionmenuModel());
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
            'LIMITIONS',
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
                  child: custom_widgets.LimitationsMenuWidget(
                    width: double.infinity,
                    height: double.infinity,
                    onB737LimitationsTap: () async {
                      FFAppState().Limition = 1.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onB737AirspeedsTap: () async {
                      FFAppState().Limition = 2.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onApuLimitationsTap: () async {
                      FFAppState().Limition = 3.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onElectricalLimitationsTap: () async {
                      FFAppState().Limition = 4.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onEvacuationSystemsTap: () async {
                      FFAppState().Limition = 5.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onFlightControlsTap: () async {
                      FFAppState().Limition = 6.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onFlightInstrumentsTap: () async {
                      FFAppState().Limition = 7.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onIcingConditionsTap: () async {
                      FFAppState().Limition = 8.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onMiscellaneousLimitationsTap: () async {
                      FFAppState().Limition = 9.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onNavigationPerformanceTap: () async {
                      FFAppState().Limition = 10.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
                    },
                    onWeightsAndThrustTap: () async {
                      FFAppState().Limition = 11.0;
                      safeSetState(() {});

                      context.pushNamed(LimitionsWidget.routeName);
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
