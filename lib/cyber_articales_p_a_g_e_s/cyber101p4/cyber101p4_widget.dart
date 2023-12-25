import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'cyber101p4_model.dart';
export 'cyber101p4_model.dart';

class Cyber101p4Widget extends StatefulWidget {
  const Cyber101p4Widget({super.key});

  @override
  _Cyber101p4WidgetState createState() => _Cyber101p4WidgetState();
}

class _Cyber101p4WidgetState extends State<Cyber101p4Widget> {
  late Cyber101p4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cyber101p4Model());
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
            'Guide to Cyber Security for Beginners',
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
                  context.pushNamed('Cyber101p5');
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
                  'An Ultimate Guide to Cyber Security for Beginners\n',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  '6. Domain Name Server(DNS)\nConsider DNS as the phonebook of the internet. All the IP addresses and the name of the links are saved in it. For example, you want to go to google.com. You type this on your web application. Then, this name goes to the DNS server, and the DNS server finds the IP address of google.com. Then, the DNS server returns it to your computer with the IP address.\n\n7. DHCP\nDynamic host configuration protocol is a protocol that assigns an IP address to any device that wants to connect to the internet.\n\n8. Router\nThis is a device that routes the data that comes to it and then sends that data to the destination to ensure that it is on the appropriate path.\n\n9. Bots\nBots are computer programs that control your computer without your knowledge. They automatically send emails, retrieve web pages, and change computer settings.\n\nCommon Types of Attacks\nBefore we get into the types of attacks, we should know why these attacks happen, and this cyber security for beginners tutorial will help you learn A-Z of both. There is always a motive behind every attack; the main reason for attacks is money. Hackers penetrate the system and then demand ransom from the victims. There are other reasons like a financial loss to the target, achieving a state’s military objective, damaging the reputation of the target, or political maneuvering.\n\n\n',
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
                    '4 / 5',
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
