import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'python101p2_model.dart';
export 'python101p2_model.dart';

class Python101p2Widget extends StatefulWidget {
  const Python101p2Widget({super.key});

  @override
  _Python101p2WidgetState createState() => _Python101p2WidgetState();
}

class _Python101p2WidgetState extends State<Python101p2Widget> {
  late Python101p2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Python101p2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'How to Learn Python ',
            style: FlutterFlowTheme.of(context).bodyLarge,
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 9.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_forward,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('Python101p3');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Text(
                  'How to Learn Python (Step-By-Step) in 2023',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Text(
                    'An Easier Way\nAfter many failed attempts, I found a process that worked better for me. In fact, I believe this is the best way to learn Python programming.\n\nFirst, I spent as little time as possible memorizing Python syntax. Then, I took what I learned and immediately dove headfirst into a project I actually found interesting.\n\nFollowing the steps outlined below is not only more fun, but it allows you to learn at an incredible rate!\n\nIn fact, this better way of learning is why I built Dataquest. Our data science courses will have you building projects immediately with minimal time spent doing the boring stuff. Check out our courses here. Signing up is free.\n\nStep 2: Identify What Motivates You \nHere’s the good news: Anyone can reach a high level of proficiency in Python with the right motivation.\n\nAs a beginner, I struggled to keep myself awake when trying to memorize syntax. However, when I needed to apply Python fundamentals to build an interesting project, I happily stayed up all night to finish it.\n\nWhat’s the lesson here? You need to find what motivates you and get excited about it! To get started, find one or two areas \nthat interest you:\n-Data Science / Machine learning\n-Mobile Apps\n-Websites\n-Computer Science\n-Games\n-Data Processing and Analysis\n-Hardware / Sensors / Robots\n-Automating Work Tasks\n\n\n\n',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 11.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  '2 / 8',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
