import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'novacancies_model.dart';
export 'novacancies_model.dart';

class NovacanciesWidget extends StatefulWidget {
  const NovacanciesWidget({Key? key}) : super(key: key);

  @override
  _NovacanciesWidgetState createState() => _NovacanciesWidgetState();
}

class _NovacanciesWidgetState extends State<NovacanciesWidget> {
  late NovacanciesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NovacanciesModel());

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
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'No vacancies found in the list',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 26.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
