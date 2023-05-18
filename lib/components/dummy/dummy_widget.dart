import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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
import 'dummy_model.dart';
export 'dummy_model.dart';

class DummyWidget extends StatefulWidget {
  const DummyWidget({
    Key? key,
    this.area,
  }) : super(key: key);

  final String? area;

  @override
  _DummyWidgetState createState() => _DummyWidgetState();
}

class _DummyWidgetState extends State<DummyWidget> {
  late DummyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DummyModel());

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

    return StreamBuilder<OrganisationsRecord>(
      stream: OrganisationsRecord.getDocument(FFAppState().editaddress!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).accent1Old,
                size: 80.0,
              ),
            ),
          );
        }
        final containerOrganisationsRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 492.9,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).tertiary,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 37.5,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  child: Text(
                    'EDIT ADDRESS DETAILS',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
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
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                              child: Text(
                                'PINCODE',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
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
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 44.4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayIcon,
                              ),
                            ),
                            child: TextFormField(
                              controller: _model.pincodefieldController ??=
                                  TextEditingController(
                                text: containerOrganisationsRecord.pinCode,
                              ),
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.pincodefieldController',
                                Duration(milliseconds: 2000),
                                () async {
                                  var _shouldSetState = false;
                                  _model.updatePage(() {
                                    FFAppState().disabling = '0';
                                  });
                                  _model.updatePage(() {
                                    FFAppState().arealist = [];
                                    FFAppState().district = 'District';
                                    FFAppState().state = 'State';
                                  });
                                  _model.updatePage(() {
                                    FFAppState().pincode =
                                        _model.pincodefieldController.text;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().OrganisationArea = '0';
                                  });
                                  _model.apiResultcci =
                                      await LocationAPICall.call(
                                    pinCode: _model.pincodefieldController.text,
                                  );
                                  _shouldSetState = true;
                                  if ((LocationAPICall.namelist(
                                            (_model.apiResultcci?.jsonBody ??
                                                ''),
                                          ).length !=
                                          null) &&
                                      (LocationAPICall.district(
                                                (_model.apiResultcci
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString() !=
                                              null &&
                                          LocationAPICall.district(
                                                (_model.apiResultcci
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString() !=
                                              '') &&
                                      (LocationAPICall.state(
                                                (_model.apiResultcci
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString() !=
                                              null &&
                                          LocationAPICall.state(
                                                (_model.apiResultcci
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString() !=
                                              '')) {
                                    _model.updatePage(() {
                                      FFAppState()
                                          .arealist = (LocationAPICall.namelist(
                                        (_model.apiResultcci?.jsonBody ?? ''),
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()!
                                          .where((e) =>
                                              (e != 'null') && (e != 'Null'))
                                          .toList();
                                      FFAppState().district =
                                          LocationAPICall.district(
                                        (_model.apiResultcci?.jsonBody ?? ''),
                                      ).toString();
                                      FFAppState().state =
                                          LocationAPICall.state(
                                        (_model.apiResultcci?.jsonBody ?? ''),
                                      ).toString();
                                    });
                                    _model.updatePage(() {
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
                                      fontSize: 14.0,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 32.0, 20.0, 12.0),
                                suffixIcon: _model
                                        .pincodefieldController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.pincodefieldController
                                              ?.clear();
                                          var _shouldSetState = false;
                                          _model.updatePage(() {
                                            FFAppState().disabling = '0';
                                          });
                                          _model.updatePage(() {
                                            FFAppState().arealist = [];
                                            FFAppState().district = 'District';
                                            FFAppState().state = 'State';
                                          });
                                          _model.updatePage(() {
                                            FFAppState().pincode = _model
                                                .pincodefieldController.text;
                                          });
                                          FFAppState().update(() {
                                            FFAppState().OrganisationArea = '0';
                                          });
                                          _model.apiResultcci =
                                              await LocationAPICall.call(
                                            pinCode: _model
                                                .pincodefieldController.text,
                                          );
                                          _shouldSetState = true;
                                          if ((LocationAPICall.namelist(
                                                    (_model.apiResultcci
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).length !=
                                                  null) &&
                                              (LocationAPICall.district(
                                                        (_model.apiResultcci
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString() !=
                                                      null &&
                                                  LocationAPICall.district(
                                                        (_model.apiResultcci
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString() !=
                                                      '') &&
                                              (LocationAPICall.state(
                                                        (_model.apiResultcci
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString() !=
                                                      null &&
                                                  LocationAPICall.state(
                                                        (_model.apiResultcci
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString() !=
                                                      '')) {
                                            _model.updatePage(() {
                                              FFAppState().arealist =
                                                  (LocationAPICall.namelist(
                                                (_model.apiResultcci
                                                        ?.jsonBody ??
                                                    ''),
                                              ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()!
                                                      .where((e) =>
                                                          (e != 'null') &&
                                                          (e != 'Null'))
                                                      .toList();
                                              FFAppState().district =
                                                  LocationAPICall.district(
                                                (_model.apiResultcci
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString();
                                              FFAppState().state =
                                                  LocationAPICall.state(
                                                (_model.apiResultcci
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString();
                                            });
                                            _model.updatePage(() {
                                              FFAppState().disabling = '1';
                                            });
                                          } else {
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model.pincodefieldControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            child: Visibility(
                              visible: LocationAPICall.status(
                                    (_model.apiResultcci?.jsonBody ?? ''),
                                  ).toString() ==
                                  'Error',
                              child: Text(
                                'Please enter a valid pincode',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w200,
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
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            child: Text(
                              'AREA',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 44.4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.areadropdownValueController ??=
                                  FormFieldController<String>(
                                _model.areadropdownValue ??= widget.area,
                              ),
                              options: FFAppState().OrganisationArea == '1'
                                  ? FFAppState().editorgarea
                                  : (LocationAPICall.namelist(
                                      (_model.apiResultcci?.jsonBody ?? ''),
                                    ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!
                                      .where((e) => e != 'null')
                                      .toList()
                                      .toList(),
                              onChanged: (val) => setState(
                                  () => _model.areadropdownValue = val),
                              width: 180.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              fillColor: Colors.white,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).grayIcon,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 12.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            child: Text(
                              'DISTRICT',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 44.4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayIcon,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 10.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFAppState().disabling == '0'
                                      ? 'District'
                                      : containerOrganisationsRecord.district,
                                  'district',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
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
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                            child: Text(
                              'STATE',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 44.4,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFA0A0A0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 0.0, 10.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFAppState().disabling == '0'
                                      ? 'State'
                                      : containerOrganisationsRecord.state,
                                  'district',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
