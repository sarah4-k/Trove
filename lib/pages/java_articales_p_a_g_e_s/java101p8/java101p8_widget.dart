import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'java101p8_model.dart';
export 'java101p8_model.dart';

class Java101p8Widget extends StatefulWidget {
  const Java101p8Widget({super.key});

  @override
  _Java101p8WidgetState createState() => _Java101p8WidgetState();
}

class _Java101p8WidgetState extends State<Java101p8Widget> {
  late Java101p8Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Java101p8Model());
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
          actions: const [],
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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  '\nJava 101: A Beginner’s Guide to Object-Oriented Programming',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  '\n3. Enterprise Software Development\nBesides web and mobile app development, Java is widely used to develop software for desktop computers, enterprise servers, and mobile devices. It offers a variety of tools and APIs that facilitate interconnectivity and platform compatibility. With features like automatic memory management, robustness, and scalability, Java is well-suited for building large-scale enterprise applications.\n\n4. Big Data and Data Analytics\nThanks to its versatility and compatibility with various software frameworks and programming models, Java is used in the fields of Big Data and Data Analytics. It is the main language used for developing applications in frameworks like Apache Hadoop, Apache Spark, and Apache Flink, which enable distributed processing of large datasets.\n\nThis language’s ecosystem also includes libraries and tools for machine learning and artificial intelligence, contributing to data analysis and predictive modelling in Big Data applications.\n\n5. Internet of Things (IoT)\nInternet of Things (IoT) pretty much refers to the huge network of devices connected through the Internet, which allows them to exchange information and perform tasks. \n\nJava is considered the most suitable programming language for IoT applications because it offers flexibility and adaptability. Many IoT coders use it as their main programming language because it allows them to write code that can run on different devices with ease.\n\nAnother reason why this programming language is a popular choice for IoT programmers is its large library of application processes. This means that developers have access to pre-written code components, making it convenient to build complex IoT programs quickly.\n\n\n',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 11.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  '8 / 8',
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
