import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'python101p3_model.dart';
export 'python101p3_model.dart';

class Python101p3Widget extends StatefulWidget {
  const Python101p3Widget({super.key});

  @override
  State<Python101p3Widget> createState() => _Python101p3WidgetState();
}

class _Python101p3WidgetState extends State<Python101p3Widget> {
  late Python101p3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Python101p3Model());

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
                  context.pushNamed('Python101p4');
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Text(
                  'Step 3: Learn the Basic Syntax, Quickly\nI know, I know. I said we’d spend as little time as possible on syntax. Unfortunately, this step can’t be skipped entirely. \n\nHere are some good resources to help you learn the Python basics without killing your motivation:\n\nDataquest – Introduction to Python Programming Course — I started Dataquest to make learning Python and data science easier. Dataquest teaches Python syntax in the context of learning data science. For example, you’ll learn basic Python commands while analyzing weather data.\nLearn Python the Hard Way — A book that teaches Python concepts from the basics to more in-depth programs.\nThe Python Tutorial — The tutorial on the main Python site.\nI can’t emphasize this enough: Learn what syntax you can and move on. Ideally, you will spend a couple of weeks on this phase, but no more than a month.\n\nThe sooner you can get to work on projects, the faster you will learn. You can always refer back to the syntax later, if necessary.\n\nQuick note: Learn Python 3, not Python 2. Unfortunately, a lot of “learn Python” resources online still teach Python 2. But Python 2 is no longer supported, so bugs and security holes will not be fixed!\n\nStep 4: Make Structured Projects\nOnce you’ve learned the basic Python syntax, start doing projects. Applying your knowledge right away will help you remember everything you’ve learned.\n\nIt’s better to begin with structured projects until you feel comfortable enough to make projects on your own. Here at Dataquest, we’ve strategically included structured projects in virtually all of our Python courses. That way, you can immediately apply what you’ve learned. \n\n\n\n',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 11.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  '3 / 8',
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
