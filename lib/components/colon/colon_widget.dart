import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'colon_model.dart';
export 'colon_model.dart';

class ColonWidget extends StatefulWidget {
  const ColonWidget({Key? key}) : super(key: key);

  @override
  _ColonWidgetState createState() => _ColonWidgetState();
}

class _ColonWidgetState extends State<ColonWidget> {
  late ColonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 70.0,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      ':',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 26.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      ':',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 26.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      ':',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 26.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      ':',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 26.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      ':',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 26.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
