import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'java101p6_model.dart';
export 'java101p6_model.dart';

class Java101p6Widget extends StatefulWidget {
  const Java101p6Widget({super.key});

  @override
  State<Java101p6Widget> createState() => _Java101p6WidgetState();
}

class _Java101p6WidgetState extends State<Java101p6Widget> {
  late Java101p6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Java101p6Model());

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
                  context.pushNamed('Java101p7');
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
                  '\nThis bytecode is a set of instructions for the Java Virtual Machine (JVM) rather than instructions for a particular computer architecture.\n\n4. Java Virtual Machine (JVM)\nThe Java Virtual Machine (JVM), as part of the JRE, is a virtualised execution environment for this language’s applications. It interprets or compiles bytecode, allowing platform-independent execution of Java programs.\n\nThe JVM abstracts the underlying operating system and hardware, enabling the “Write Once, Run Anywhere” (WORA) principle. It manages memory, provides runtime support, and executes applications on various devices with a compatible JVM.\n\n5. Java Class Library (JCL)\nIncluded within the JDK and available to all Java applications is the Java Class Library. This is a vast collection of pre-written classes and interfaces that provide essential functionalities for Java programs. Some of these include:\n\n-Input/output (File, Scanner, PrintWriter)\n-Networking (Socket, URL, ServerSocket)\n-Data manipulation (String, Arrays, Collections)\n-User interface development (Swing, JavaFX)\n-Security (Cryptography, AccessControl)\n\n6. Garbage Collector\nThe Garbage Collector (GC) is a critical part of the JRE. It is responsible for automatically managing memory by reclaiming memory that is no longer in use or referenced by the program. This process helps prevent memory leaks, allows for memory usage optimisation, and reduces the risk of memory-related errors.\n\n\n',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 11.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  '6 / 8',
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
