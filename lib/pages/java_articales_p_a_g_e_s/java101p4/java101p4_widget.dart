import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'java101p4_model.dart';
export 'java101p4_model.dart';

class Java101p4Widget extends StatefulWidget {
  const Java101p4Widget({super.key});

  @override
  State<Java101p4Widget> createState() => _Java101p4WidgetState();
}

class _Java101p4WidgetState extends State<Java101p4Widget> {
  late Java101p4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Java101p4Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            'JAVA 101: LEARN JAVA',
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
                  context.pushNamed('Java101p5');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      '\nJava 101: A Beginner’s Guide to Object-Oriented Programming',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      '\n-Concurrency: This refers to multiple tasks happening at the same time.\n-Parallelism: This happens when tasks are being executed simultaneously on different cores or processors.\n-Thread synchronisation: This gives coordinating access to shared resources among threads.\n-Thread scheduling: This is deciding which thread gets CPU time.\n-Thread pooling: This means reusing threads instead of creating new ones for each task.\n-Context switching: This enables switching between executing threads.\n-Deadlock: This is a situation where two or more threads get blocked forever, waiting for each other.\n-Race condition: This is an unexpected behaviour due to the unpredictable ordering of operations in concurrent programs.\n\n6. Distributed and Dynamic\n\n\nJava has two important features that make it stand out: distributed applications and dynamic programming.\n\nWith technologies like Remote Method Invocation (RMI) and Enterprise JavaBeans (EJB), this language allows developers to create distributed applications, enabling different components of the application to communicate with each other over a network. This makes it easier to build large-scale systems that span multiple machines.\n\nIn addition, this language is pretty dynamic, which means that it can adapt and change during runtime. It supports extensibility through inheritance and subclassing, allowing developers to add new classes and methods without modifying existing code.\n\nThis flexibility is crucial when building complex software systems that may require frequent updates or modifications.',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 11.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Text(
                        '4 / 8',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 12.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
