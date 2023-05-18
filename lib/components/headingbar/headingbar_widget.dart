import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'headingbar_model.dart';
export 'headingbar_model.dart';

class HeadingbarWidget extends StatefulWidget {
  const HeadingbarWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _HeadingbarWidgetState createState() => _HeadingbarWidgetState();
}

class _HeadingbarWidgetState extends State<HeadingbarWidget> {
  late HeadingbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeadingbarModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.text!,
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
