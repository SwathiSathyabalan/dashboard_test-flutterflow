import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addressfieldsadd_model.dart';
export 'addressfieldsadd_model.dart';

class AddressfieldsaddWidget extends StatefulWidget {
  const AddressfieldsaddWidget({Key? key}) : super(key: key);

  @override
  _AddressfieldsaddWidgetState createState() => _AddressfieldsaddWidgetState();
}

class _AddressfieldsaddWidgetState extends State<AddressfieldsaddWidget> {
  late AddressfieldsaddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressfieldsaddModel());

    _model.pincodefieldController ??= TextEditingController();
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
      width: 700.0,
      height: 540.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 37.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Text(
                  'ENTER ADDRESS DETAILS',
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Pincode',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        controller: _model.pincodefieldController,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.pincodefieldController',
                          Duration(milliseconds: 2000),
                          () async {
                            var _shouldSetState = false;
                            FFAppState().update(() {
                              FFAppState().disabling = '0';
                            });
                            FFAppState().update(() {
                              FFAppState().arealist = [];
                              FFAppState().district = 'District';
                              FFAppState().state = 'State';
                            });
                            FFAppState().update(() {
                              FFAppState().pincode =
                                  _model.pincodefieldController.text;
                            });
                            _model.apiResultcci = await LocationAPICall.call(
                              pinCode: _model.pincodefieldController.text,
                            );
                            _shouldSetState = true;
                            FFAppState().update(() {
                              FFAppState().testapi = LocationAPICall.status(
                                        (_model.apiResultcci?.jsonBody ?? ''),
                                      ).toString() ==
                                      'Error'
                                  ? '0'
                                  : '1';
                            });
                            if ((LocationAPICall.namelist(
                                      (_model.apiResultcci?.jsonBody ?? ''),
                                    ).length !=
                                    null) &&
                                (LocationAPICall.district(
                                          (_model.apiResultcci?.jsonBody ?? ''),
                                        ).toString() !=
                                        null &&
                                    LocationAPICall.district(
                                          (_model.apiResultcci?.jsonBody ?? ''),
                                        ).toString() !=
                                        '') &&
                                (LocationAPICall.state(
                                          (_model.apiResultcci?.jsonBody ?? ''),
                                        ).toString() !=
                                        null &&
                                    LocationAPICall.state(
                                          (_model.apiResultcci?.jsonBody ?? ''),
                                        ).toString() !=
                                        '')) {
                              FFAppState().update(() {
                                FFAppState()
                                    .arealist = (LocationAPICall.namelist(
                                  (_model.apiResultcci?.jsonBody ?? ''),
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()!
                                    .where(
                                        (e) => (e != 'null') && (e != 'Null'))
                                    .toList();
                                FFAppState().district =
                                    LocationAPICall.district(
                                  (_model.apiResultcci?.jsonBody ?? ''),
                                ).toString();
                                FFAppState().state = LocationAPICall.state(
                                  (_model.apiResultcci?.jsonBody ?? ''),
                                ).toString();
                              });
                              FFAppState().update(() {
                                FFAppState().disabling = '1';
                              });
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter the pincode',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).textColor50,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).outlines,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              14.0, 36.0, 20.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium,
                        maxLines: null,
                        keyboardType: TextInputType.number,
                        validator: _model.pincodefieldControllerValidator
                            .asValidator(context),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible: FFAppState().testapi == '0',
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  7.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Please enter a valid pincode',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).red,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Area',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.areadropdownValueController ??=
                              FormFieldController<String>(null),
                          options: FFAppState().arealist.toList(),
                          onChanged: (val) =>
                              setState(() => _model.areadropdownValue = val),
                          width: double.infinity,
                          height: 60.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          hintText: 'Select your area',
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).outlines,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          disabled: (FFAppState().disabling == '0') ||
                              (LocationAPICall.status(
                                    (_model.apiResultcci?.jsonBody ?? ''),
                                  ).toString() ==
                                  'Error'),
                          isSearchable: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'District',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).outlines,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 14.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState().disabling == '1'
                                    ? FFAppState().district
                                    : 'District',
                                'district',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'State',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).outlines,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 14.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState().disabling == '1'
                                    ? FFAppState().state
                                    : 'State',
                                'district',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
