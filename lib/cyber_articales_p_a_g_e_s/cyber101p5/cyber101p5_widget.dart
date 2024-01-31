import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'cyber101p5_model.dart';
export 'cyber101p5_model.dart';

class Cyber101p5Widget extends StatefulWidget {
  const Cyber101p5Widget({super.key});

  @override
  State<Cyber101p5Widget> createState() => _Cyber101p5WidgetState();
}

class _Cyber101p5WidgetState extends State<Cyber101p5Widget> {
  late Cyber101p5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cyber101p5Model());

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
                  'An Ultimate Guide to Cybersecurity for Beginners',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  'There are mainly five types of attacks:\nDistributed denial of service(DDoS)\nMan in the middle\nEmail attacks\nPassword attacks\nMalware attack\nIn the next section of this cyber security for beginners tutorial, let’s look at all the attacks in detail:\n\n1. Distributed Denial of Service\nIt is an attack used to restrict a user from accessing the resources by flooding the traffic that is used to access resources. A botnet controller controls all the bots that are under it. The attacker sends a command to the botnet controller that tells all bots to attack a server so that the server will be flooded. When a user wants to access a website, he will not be able to, as the traffic on the website will be at full capacity.\n\n2. Man in the Middle\nLet’s look at an example to understand this better. Suppose you want to do an online transaction and you connect to your bank and make the payment.Now, while you are completing the transaction, you have to put in credit card details and the PIN. The attacker can spoof you and monitor your transaction. As soon as you put in your details, he will see them.\n\n3. Password Attack\nTo crack a password or find a password, we use this technique. There are five types of password attacks:\n\nDictionary attack: In this method, we handle every password that is possible through the dictionary.\nBrute force: This is a trial and error method used to decode the password or data. This attack takes the most amount of time.\nKeylogger: As the name suggests, a keylogger records all keystrokes on a keyboard. ',
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
                    '5 / 5',
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
