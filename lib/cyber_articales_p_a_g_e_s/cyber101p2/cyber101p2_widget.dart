import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'cyber101p2_model.dart';
export 'cyber101p2_model.dart';

class Cyber101p2Widget extends StatefulWidget {
  const Cyber101p2Widget({super.key});

  @override
  State<Cyber101p2Widget> createState() => _Cyber101p2WidgetState();
}

class _Cyber101p2WidgetState extends State<Cyber101p2Widget> {
  late Cyber101p2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cyber101p2Model());

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
            'Guide to Cybersecurity for Beginners',
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
                  context.pushNamed('Cyber101p3');
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
                  'An Ultimate Guide to Cybersecurity for Beginners',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 9.0),
                child: Text(
                  'Specialties in Cybersecurity',
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  'To pursue your career in cybersecurity, it is essential to know about the areas of specialization in it, and this cyber security for beginners tutorial will help you do just that. There are nine:\n\nAccess control systems and methodology: This deals with protecting critical system resources from unauthorized modification.\nTelecommunications and network security: This focuses on communications, protocols, and network services, and the potential vulnerabilities associated with each.\nSecurity management practices: This area deals effectively with catastrophic systems failures, natural disasters, and other types of service interruptions.\nSecurity architecture and models: This focuses mostly on having security policies and procedures in place. This particular security domain involves policy planning for just about every type of security issue.\nLaw, investigation, and ethics: This handles the legal issues associated with computer security.\nApplication and system development security: This person covers things like database security models and the implementation of multilevel security for in-house applications. \nCryptography: Designed to help you understand how and when to use encryption. \nComputer operations security: This covers all those things that happen while your computers are running. \nPhysical security: This primarily addresses questions about physical access to your servers and workstations.\nA cyber security bootcamp provides hands-on experience and theoretical insights, allowing individuals to uncover their specific interests and strengths. By focusing on these specialties, participants can enhance their skills and knowledge, preparing them for roles that demand expertise in specific aspects of cybersecurity.',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 11.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    '2 / 5',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
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
