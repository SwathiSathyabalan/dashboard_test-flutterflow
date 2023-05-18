import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'keyskills1_model.dart';
export 'keyskills1_model.dart';

class Keyskills1Widget extends StatefulWidget {
  const Keyskills1Widget({Key? key}) : super(key: key);

  @override
  _Keyskills1WidgetState createState() => _Keyskills1WidgetState();
}

class _Keyskills1WidgetState extends State<Keyskills1Widget> {
  late Keyskills1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Keyskills1Model());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
        child: FlutterFlowCheckboxGroup(
          options: [
            'FOOD',
            'ACCOMODATION',
            'MOBILE RECHARGE',
            'WEEKLY OVERTIME BONUS'
          ],
          onChanged: (val) => setState(() => _model.checkboxGroupValues = val),
          controller: _model.checkboxGroupValueController ??=
              FormFieldController<List<String>>(
            [],
          ),
          activeColor: Color(0xFFF2A213),
          checkColor: Colors.white,
          checkboxBorderColor: Color(0xFF95A1AC),
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
          initialized: _model.checkboxGroupValues != null,
        ),
      ),
    );
  }
}
