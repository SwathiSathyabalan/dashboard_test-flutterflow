import '/components/address/address_widget.dart';
import '/components/bank_details/bank_details_widget.dart';
import '/components/kyc/kyc_widget.dart';
import '/components/personal_details/personal_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_profile_model.dart';
export 'new_profile_model.dart';

class NewProfileWidget extends StatefulWidget {
  const NewProfileWidget({Key? key}) : super(key: key);

  @override
  _NewProfileWidgetState createState() => _NewProfileWidgetState();
}

class _NewProfileWidgetState extends State<NewProfileWidget> {
  late NewProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewProfileModel());

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
      height: 700.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.personalDetailsModel,
                        updateCallback: () => setState(() {}),
                        child: PersonalDetailsWidget(),
                      ),
                      wrapWithModel(
                        model: _model.addressModel,
                        updateCallback: () => setState(() {}),
                        child: AddressWidget(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.kycModel,
                        updateCallback: () => setState(() {}),
                        child: KycWidget(),
                      ),
                      wrapWithModel(
                        model: _model.bankDetailsModel,
                        updateCallback: () => setState(() {}),
                        child: BankDetailsWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
