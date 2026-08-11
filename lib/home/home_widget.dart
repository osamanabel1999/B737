import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'HOME';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.HomePageMenuWidget(
                    width: double.infinity,
                    height: double.infinity,
                    onLimitationsTap: () async {
                      context.pushNamed(LimitionmenuWidget.routeName);
                    },
                    onProceduresTap: () async {
                      context.pushNamed(ProceduremenuWidget.routeName);
                    },
                    onCockpitLayoutTap: () async {
                      context.pushNamed(LayoutWidget.routeName);
                    },
                    onExamTap: () async {
                      context.pushNamed(ExamWidget.routeName);
                    },
                    onTermsOfUseTap: () async {
                      await launchURL(
                          'https://doc-hosting.flycricket.io/b737-instructor-terms-of-use/e5f1c5fb-506d-4134-b235-b8d8e6c41026/terms');
                    },
                    onPrivacyPolicyTap: () async {
                      await launchURL(
                          'https://doc-hosting.flycricket.io/b737-privacy-policy/38616bb4-855d-4b10-9db5-e657419417a4/privacy');
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
