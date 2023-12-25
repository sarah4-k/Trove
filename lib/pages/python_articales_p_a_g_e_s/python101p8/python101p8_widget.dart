import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'python101p8_model.dart';
export 'python101p8_model.dart';

class Python101p8Widget extends StatefulWidget {
  const Python101p8Widget({super.key});

  @override
  _Python101p8WidgetState createState() => _Python101p8WidgetState();
}

class _Python101p8WidgetState extends State<Python101p8Widget> {
  late Python101p8Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Python101p8Model());
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
                  'Step 6: Keep Working on Harder (and Harder) Projects\n\nAs you find success with independent projects, keep increasing the difficulty and scope of your projects. Learning Python is a process, and you’ll need momentum to get through it. \n\nOnce you’re completely comfortable with what you’re building, it’s time to try something harder. Continue to find new projects that challenge your skills and push you to grow.\n\n5 Prompts for Mastering Python\n\nHere are some ideas for when that time comes:\nTry teaching a novice how to build one of your projects.\nAsk yourself: Can you scale your tool? Can it work with more data, or can it handle more traffic?\nTry making your program run faster.\nImagine how you might make your tool useful for more people.\nImagine how to commercialize what you’ve made.\n\nGoing Forward with Python\n\nRemember, Python is continually evolving. There are only a few people in the world who can claim to completely understand Python. And these are the people who created it!\n\nWhere does that leave you? In a constant state of learning and working on new projects to hone your skill. \n\nSix months from now, you’ll find yourself looking back on your code and thinking about how terrible it is. Don’t despair! When you get to this point, you’ll know you’re on the right track.\n\nIf you’re the type of person who thrives with minimal structure, then you have all you need to start your journey. However, if you need a little more guidance, then our courses may help.\n\nI founded Dataquest to help people learn quickly and avoid the things that usually make people quit. You’ll be writing actual code within minutes and completing real projects within hours.',
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
