import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'used_model.dart';
export 'used_model.dart';

class UsedWidget extends StatefulWidget {
  const UsedWidget({Key? key}) : super(key: key);

  @override
  _UsedWidgetState createState() => _UsedWidgetState();
}

class _UsedWidgetState extends State<UsedWidget> {
  late UsedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsedModel());

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

    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
          child: Text(
            'Contact',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ],
    );
  }
}
