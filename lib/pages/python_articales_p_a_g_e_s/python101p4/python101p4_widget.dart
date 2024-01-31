import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'python101p4_model.dart';
export 'python101p4_model.dart';

class Python101p4Widget extends StatefulWidget {
  const Python101p4Widget({super.key});

  @override
  State<Python101p4Widget> createState() => _Python101p4WidgetState();
}

class _Python101p4WidgetState extends State<Python101p4Widget> {
  late Python101p4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Python101p4Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.pushNamed('Python101p5');
    });

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
                  context.pushNamed('Python101p5');
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
                  'Here are some examples of actual Dataquest projects. Which one ignites your curiosity?\n\n- Learning and Installing Jupyter Notebook — Run Python code in a Jupyter Notebook and learn how to install Jupyter locally.\n-Building a Word Guessing Game — Have some fun, and create a functional and interactive word-guessing game using Python.\n-Building a Food Ordering App — Create a functional and interactive food ordering application using Python.\n-Data Cleaning and Visualization Star Wars-Style: Fans of Star Wars will not want to miss this structured project using real data from the movie. \n-Predicting Car Prices: Use the machine learning workflow predict car prices.\n-Predicting the Weather Using Machine Learning: Learn how to train a machine learning model for predicting the weather.\n-Exploring eBay Car Sales Data: Analyze and clean a real dataset about car sales from eBay.\n-Predicting Heart Disease: Build a k-nearest neighbors classifier to predict whether patients might be at risk of heart disease.\nInspiration for Structured Projects\nWhen it comes to structured projects, there is no one right place to start. The best resources for you will depend on what motivates you as well as what your goals are for Python programming. \n\nAre you interested in general data science or machine learning? Do you want to build something specific like an app or website? Here are some recommended resources for inspiration, organized by category:\n\nData Science / Machine Learning\nDataquest — Teaches you Python and data science interactively. You analyze a series of interesting datasets, ranging from CIA documents to NBA player stats. You eventually build complex algorithms, including neural networks and decision trees.\nScikit-learn Documentation — Scikit-learn is the main Python machine learning library. It has some great documentation and tutorials.\n',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 11.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  '4 / 8',
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
