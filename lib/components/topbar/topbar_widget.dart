import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'topbar_model.dart';
export 'topbar_model.dart';

class TopbarWidget extends StatefulWidget {
  const TopbarWidget({Key? key}) : super(key: key);

  @override
  _TopbarWidgetState createState() => _TopbarWidgetState();
}

class _TopbarWidgetState extends State<TopbarWidget> {
  late TopbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopbarModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello World',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 35.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
      ],
    );
  }
}
