import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'java101p2_model.dart';
export 'java101p2_model.dart';

class Java101p2Widget extends StatefulWidget {
  const Java101p2Widget({super.key});

  @override
  State<Java101p2Widget> createState() => _Java101p2WidgetState();
}

class _Java101p2WidgetState extends State<Java101p2Widget> {
  late Java101p2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Java101p2Model());

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
              context.pop();
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
                  context.pushNamed('Java101p3');
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
              Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          '\nJava 101: A Beginner’s Guide to Object-Oriented Programming',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          '\n\n2. Object-Oriented Programming\nAs we mentioned, Java is an object-oriented programming language that organises and structures code based on the concept of “objects.” Objects happen to be instances of classes. Classes, on the other hand, define the blueprint or template for creating objects. OOP is centred around four main principles: encapsulation, inheritance, polymorphism, and abstraction.\n\n-Encapsulation includes bundling data and methods that operate on the data into one class.\n-Inheritance is the mechanism that enables a class to inherit properties and behaviours from another class, promoting code reuse and simplifying program design. \n-Abstraction allows developers to hide unnecessary details and focus on essential features when designing classes. \n-Polymorphism lets objects take on different forms based on their context or usage.\n\n3. Simplicity and Robustness\nOne of the main features that makes Java popular is its simplicity and robustness. This very programming language is designed to be user-friendly and easy to learn, even for beginners. It has a clear and readable syntax based on C and C++ languages that avoids complex features and syntax found in some other languages.\n\nAdditionally, Java has a strong error-handling mechanism and exceptional handling capability. This helps in creating reliable and resilient applications.\n\n4. Security and Portability\nAnother main feature of this programming language is its focus on security and portability as it was designed with the goal of creating a language that is secure and can be used on different platforms.\n\n',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 11.0,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Text(
                            '2 / 8',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 12.0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
