import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'primarybutton_model.dart';
export 'primarybutton_model.dart';

class PrimarybuttonWidget extends StatefulWidget {
  const PrimarybuttonWidget({Key? key}) : super(key: key);

  @override
  _PrimarybuttonWidgetState createState() => _PrimarybuttonWidgetState();
}

class _PrimarybuttonWidgetState extends State<PrimarybuttonWidget> {
  late PrimarybuttonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimarybuttonModel());

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

    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: 'EDIT PROFILE',
      options: FFButtonOptions(
        width: 160.0,
        height: 50.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).secondary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 2.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).secondary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
