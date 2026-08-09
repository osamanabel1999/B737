import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'limitions_model.dart';
export 'limitions_model.dart';

class LimitionsWidget extends StatefulWidget {
  const LimitionsWidget({super.key});

  static String routeName = 'LIMITIONS';
  static String routePath = '/limitions';

  @override
  State<LimitionsWidget> createState() => _LimitionsWidgetState();
}

class _LimitionsWidgetState extends State<LimitionsWidget> {
  late LimitionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitionsModel());
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
              if (FFAppState().Limition == 1.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737LimitationsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 2.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.B737AirspeedsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 3.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.ApuLimitationsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 4.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.ElectricalLimitationsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 5.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.EvacuationSystemsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 6.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.FlightControlsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 7.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.FlightInstrumentsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 8.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.IcingConditionsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 9.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.MiscellaneousLimitationsGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 10.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.NavigationPerformanceGuide(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().Limition == 11.0)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.WeightsAndThrustGuide(
                      width: double.infinity,
                      height: double.infinity,
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
