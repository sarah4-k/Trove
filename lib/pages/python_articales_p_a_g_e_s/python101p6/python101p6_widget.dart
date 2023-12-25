import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'python101p6_model.dart';
export 'python101p6_model.dart';

class Python101p6Widget extends StatefulWidget {
  const Python101p6Widget({super.key});

  @override
  _Python101p6WidgetState createState() => _Python101p6WidgetState();
}

class _Python101p6WidgetState extends State<Python101p6Widget> {
  late Python101p6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Python101p6Model());
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
                  context.pushNamed('Python101p7');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('Python101p7');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Text(
                    'How to Learn Python (Step-By-Step) in 2023',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Text(
                    'Scripts to Automate Your Work\n\nAutomate the Boring Stuff with Python — Learn how to automate day-to-day tasks using Python.\nProjects are crucial. They stretch your capabilities, help you learn new Python concepts, and allow you to showcase your abilities to potential employers. Once you’ve done a few structured projects, you can move on to working on your own projects.\n\nStep 5: Work on Python Projects on Your Own\n\nAfter you’ve worked through a few structured projects, it’s time to ramp things up. You can speed up your learning by working on independent Python projects.\n\nHere’s the key: Start with a small project. It’s better to finish a small project rather than embark on a huge project that never gets completed.\n\n8 Tips for Discovering Captivating Python Projects\nI know it can feel daunting to find a good Python project to work on. Here are some tips to finding interesting projects:\n\nExtend the projects you were working on before and add more functionality.\nCheck out our list of Python projects for beginners.\nGo to Python meetups in your area and find people working on interesting projects.\nFind open source packages to contribute to.\nSee if any local nonprofits are looking for volunteer developers.\nFind projects other people have made and see if you can extend or adapt them. Github is a good place to start.\nBrowse through other people’s blog posts to find interesting project ideas.\nThink of tools that would make your everyday life easier. Then, build them.\n\n\n\n\n',
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
      ),
    );
  }
}
