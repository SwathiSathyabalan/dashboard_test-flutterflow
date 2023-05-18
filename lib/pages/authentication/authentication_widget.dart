import '../../backend/backend.dart';
import '../../backend/schema/recruiters_record.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'authentication_model.dart';
export 'authentication_model.dart';

class AuthenticationWidget extends StatefulWidget {
  const AuthenticationWidget({
    Key? key,
    this.num,
  }) : super(key: key);

  final String? num;

  @override
  _AuthenticationWidgetState createState() => _AuthenticationWidgetState();
}

class _AuthenticationWidgetState extends State<AuthenticationWidget> {
  late AuthenticationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthenticationModel());

    _model.textController1 ??= TextEditingController(text: '+91');
    _model.mobilenumController ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<RecruitersRecord>>(
      stream: queryRecruitersRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: SpinKitPulse(
                color: FlutterFlowTheme
                    .of(context)
                    .accent1Old,
                size: 80,
              ),
            ),
          );
        }
        List<RecruitersRecord> authenticationCaptainsRecordList = snapshot
            .data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final authenticationCaptainsRecord =
        authenticationCaptainsRecordList.isNotEmpty
            ? authenticationCaptainsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme
                .of(context)
                .tertiary,
            body: SafeArea(
              child: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme
                                          .of(context)
                                          .tertiary,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 600.0,
                                              height: 630.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Form(
                                                      key: _model.formKey,
                                                      autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(50.0, 0.0,
                                                            50.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  15.0),
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                height: 70.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: [
                                                                    Text(
                                                                      'OTP VERIFICATION',
                                                                      style: FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .headlineMedium,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  10.0,
                                                                  15.0),
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                height: 50.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  children: [
                                                                    Text(
                                                                      'Enter Phone Number',
                                                                      style: FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .headlineSmall,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  15.0),
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                height: 60.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                  border:
                                                                  Border.all(
                                                                    color: FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .outlines,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      if (FFAppState()
                                                                          .sendOTP ==
                                                                          null ||
                                                                          FFAppState()
                                                                              .sendOTP ==
                                                                              '')
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                          Container(
                                                                            width: MediaQuery
                                                                                .of(
                                                                                context)
                                                                                .size
                                                                                .width *
                                                                                0.03,
                                                                            height:
                                                                            100.0,
                                                                            decoration:
                                                                            BoxDecoration(),
                                                                            child:
                                                                            TextFormField(
                                                                              controller:
                                                                              _model
                                                                                  .textController1,
                                                                              autofocus:
                                                                              true,
                                                                              readOnly:
                                                                              true,
                                                                              obscureText:
                                                                              false,
                                                                              decoration:
                                                                              InputDecoration(
                                                                                hintText:
                                                                                '[Some hint text...]',
                                                                                hintStyle:
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodySmall,
                                                                                enabledBorder:
                                                                                UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(
                                                                                        0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius
                                                                                      .only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder:
                                                                                UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(
                                                                                        0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius
                                                                                      .only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder:
                                                                                UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(
                                                                                        0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius
                                                                                      .only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(
                                                                                        0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius
                                                                                      .only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              style:
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .headlineSmall,
                                                                              validator: _model
                                                                                  .textController1Validator
                                                                                  .asValidator(
                                                                                  context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (FFAppState()
                                                                          .sendOTP ==
                                                                          null ||
                                                                          FFAppState()
                                                                              .sendOTP ==
                                                                              '')
                                                                        Expanded(
                                                                          child:
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional
                                                                                .fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                            TextFormField(
                                                                              controller:
                                                                              _model
                                                                                  .mobilenumController,
                                                                              onChanged: (
                                                                                  _) =>
                                                                                  EasyDebounce
                                                                                      .debounce(
                                                                                    '_model.mobilenumController',
                                                                                    Duration(
                                                                                        milliseconds: 2000),
                                                                                        () async {
                                                                                      if (_model
                                                                                          .formKey
                                                                                          .currentState ==
                                                                                          null ||
                                                                                          !_model
                                                                                              .formKey
                                                                                              .currentState!
                                                                                              .validate()) {
                                                                                        return;
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                              autofocus:
                                                                              true,
                                                                              obscureText:
                                                                              false,
                                                                              decoration:
                                                                              InputDecoration(
                                                                                hintText:
                                                                                'Enter phone number here',
                                                                                hintStyle:
                                                                                FlutterFlowTheme
                                                                                    .of(
                                                                                    context)
                                                                                    .bodySmall,
                                                                                enabledBorder:
                                                                                UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(
                                                                                        0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius
                                                                                      .only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedBorder:
                                                                                UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(
                                                                                        0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius
                                                                                      .only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                  ),
                                                                                ),
                                                                                errorBorder:
                                                                                UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(
                                                                                        0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius
                                                                                      .only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                  ),
                                                                                ),
                                                                                focusedErrorBorder:
                                                                                UnderlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(
                                                                                        0x00000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: const BorderRadius
                                                                                      .only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                        4.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              style:
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .headlineSmall,
                                                                              keyboardType:
                                                                              TextInputType
                                                                                  .number,
                                                                              validator: _model
                                                                                  .mobilenumControllerValidator
                                                                                  .asValidator(
                                                                                  context),
                                                                              inputFormatters: [
                                                                                FilteringTextInputFormatter
                                                                                    .allow(
                                                                                    RegExp(
                                                                                        '[0-9]'))
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (FFAppState()
                                                                          .sendOTP !=
                                                                          null &&
                                                                          FFAppState()
                                                                              .sendOTP !=
                                                                              '')
                                                                        Text(
                                                                          widget
                                                                              .num!,
                                                                          style: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .headlineSmall,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  15.0),
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                height: 50.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  15.0),
                                                              child: Container(
                                                                width:
                                                                double.infinity,
                                                                height: 50.0,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Visibility(
                                                                  visible: FFAppState()
                                                                      .sendOTP !=
                                                                      null &&
                                                                      FFAppState()
                                                                          .sendOTP !=
                                                                          '',
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Text(
                                                                        'Enter OTP',
                                                                        style: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .headlineSmall,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (FFAppState()
                                                                .sendOTP !=
                                                                null &&
                                                                FFAppState()
                                                                    .sendOTP !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    15.0),
                                                                child: Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 50.0,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .secondaryBackground,
                                                                    border:
                                                                    Border.all(
                                                                      color: FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .outlines,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                          TextFormField(
                                                                            controller:
                                                                            _model
                                                                                .textController3,
                                                                            autofocus:
                                                                            true,
                                                                            obscureText:
                                                                            false,
                                                                            decoration:
                                                                            InputDecoration(
                                                                              hintText:
                                                                              'Enter OTP here',
                                                                              hintStyle:
                                                                              FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .bodySmall,
                                                                              enabledBorder:
                                                                              UnderlineInputBorder(
                                                                                borderSide:
                                                                                BorderSide(
                                                                                  color: Color(
                                                                                      0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius:
                                                                                const BorderRadius
                                                                                    .only(
                                                                                  topLeft: Radius
                                                                                      .circular(
                                                                                      4.0),
                                                                                  topRight: Radius
                                                                                      .circular(
                                                                                      4.0),
                                                                                ),
                                                                              ),
                                                                              focusedBorder:
                                                                              UnderlineInputBorder(
                                                                                borderSide:
                                                                                BorderSide(
                                                                                  color: Color(
                                                                                      0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius:
                                                                                const BorderRadius
                                                                                    .only(
                                                                                  topLeft: Radius
                                                                                      .circular(
                                                                                      4.0),
                                                                                  topRight: Radius
                                                                                      .circular(
                                                                                      4.0),
                                                                                ),
                                                                              ),
                                                                              errorBorder:
                                                                              UnderlineInputBorder(
                                                                                borderSide:
                                                                                BorderSide(
                                                                                  color: Color(
                                                                                      0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius:
                                                                                const BorderRadius
                                                                                    .only(
                                                                                  topLeft: Radius
                                                                                      .circular(
                                                                                      4.0),
                                                                                  topRight: Radius
                                                                                      .circular(
                                                                                      4.0),
                                                                                ),
                                                                              ),
                                                                              focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                                borderSide:
                                                                                BorderSide(
                                                                                  color: Color(
                                                                                      0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius:
                                                                                const BorderRadius
                                                                                    .only(
                                                                                  topLeft: Radius
                                                                                      .circular(
                                                                                      4.0),
                                                                                  topRight: Radius
                                                                                      .circular(
                                                                                      4.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            style: FlutterFlowTheme
                                                                                .of(
                                                                                context)
                                                                                .bodyMedium
                                                                                .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme
                                                                                  .of(
                                                                                  context)
                                                                                  .secondaryText,
                                                                              fontWeight: FontWeight
                                                                                  .normal,
                                                                            ),
                                                                            keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                            validator: _model
                                                                                .textController3Validator
                                                                                .asValidator(
                                                                                context),
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter
                                                                                  .allow(
                                                                                  RegExp(
                                                                                      '[0-9]'))
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  50.0,
                                                                  0.0,
                                                                  0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      if (FFAppState()
                                                                          .AddCaptain !=
                                                                          null &&
                                                                          FFAppState()
                                                                              .AddCaptain !=
                                                                              '') {
                                                                        context
                                                                            .pushNamed(
                                                                            'CaptainsDashboardCopy');

                                                                        setState(
                                                                                () {
                                                                              FFAppState()
                                                                                  .AddCaptain =
                                                                              '';
                                                                            });
                                                                        return;
                                                                      } else {
                                                                        if (FFAppState()
                                                                            .AddScout !=
                                                                            null &&
                                                                            FFAppState()
                                                                                .AddScout !=
                                                                                '') {
                                                                          context
                                                                              .pushNamed(
                                                                              'ScoutsDashboardCopy');

                                                                          setState(
                                                                                  () {
                                                                                FFAppState()
                                                                                    .AddScout =
                                                                                '';
                                                                              });
                                                                          return;
                                                                        } else {
                                                                          context
                                                                              .pushNamed(
                                                                              'WorkersDashboardCopy');

                                                                          setState(
                                                                                  () {
                                                                                FFAppState()
                                                                                    .AddWorker =
                                                                                '';
                                                                              });
                                                                          setState(
                                                                                  () {
                                                                                FFAppState()
                                                                                    .phonenumbercaptainscout =
                                                                                '';
                                                                              });
                                                                          return;
                                                                        }
                                                                      }
                                                                    },
                                                                    text: 'CANCEL',
                                                                    options:
                                                                    FFButtonOptions(
                                                                      width: 150.0,
                                                                      height: 40.0,
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .secondary,
                                                                      textStyle: FlutterFlowTheme
                                                                          .of(
                                                                          context)
                                                                          .titleMedium
                                                                          .override(
                                                                        fontFamily:
                                                                        'Poppins',
                                                                        color: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                        18.0,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                      ),
                                                                      elevation:
                                                                      3.0,
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .secondary,
                                                                        width: 1.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (FFAppState()
                                                                      .sendOTP ==
                                                                      null ||
                                                                      FFAppState()
                                                                          .sendOTP ==
                                                                          '')
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                        false;
                                                                        _model
                                                                            .captainscoutcheck =
                                                                        await actions
                                                                            .checkExists(
                                                                          '${_model
                                                                              .textController1
                                                                              .text}${_model
                                                                              .mobilenumController
                                                                              .text}',
                                                                          'Recruiters',
                                                                        );
                                                                        _shouldSetState =
                                                                        true;
                                                                        if (_model
                                                                            .captainscoutcheck!) {
                                                                          await showDialog(
                                                                            context:
                                                                            context,
                                                                            builder:
                                                                                (
                                                                                alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title:
                                                                                Text(
                                                                                    'Alert!'),
                                                                                content:
                                                                                Text(
                                                                                    'Phone number is already existing'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () =>
                                                                                        Navigator
                                                                                            .pop(
                                                                                            alertDialogContext),
                                                                                    child: Text(
                                                                                        'Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(
                                                                                    () {});
                                                                          return;
                                                                        } else {
                                                                          _model
                                                                              .workercheck =
                                                                          await actions
                                                                              .checkExists(
                                                                            '${_model
                                                                                .textController1
                                                                                .text}${_model
                                                                                .mobilenumController
                                                                                .text}',
                                                                            'Workers',
                                                                          );
                                                                          _shouldSetState =
                                                                          true;
                                                                          if (_model
                                                                              .workercheck!) {
                                                                            await showDialog(
                                                                              context:
                                                                              context,
                                                                              builder:
                                                                                  (
                                                                                  alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text(
                                                                                      'Phone number is already existing'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () =>
                                                                                          Navigator
                                                                                              .pop(
                                                                                              alertDialogContext),
                                                                                      child: Text(
                                                                                          'Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            if (_shouldSetState)
                                                                              setState(
                                                                                      () {});
                                                                            return;
                                                                          } else {
                                                                            final phoneNumberVal =
                                                                                '${_model
                                                                                .textController1
                                                                                .text}${_model
                                                                                .mobilenumController
                                                                                .text}';
                                                                            if (phoneNumberVal ==
                                                                                null ||
                                                                                phoneNumberVal
                                                                                    .isEmpty ||
                                                                                !phoneNumberVal
                                                                                    .startsWith(
                                                                                    '+')) {
                                                                              ScaffoldMessenger
                                                                                  .of(
                                                                                  context)
                                                                                  .showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                      'Phone Number is required and has to start with +.'),
                                                                                ),
                                                                              );
                                                                              return;
                                                                            }
                                                                            await authManager
                                                                                .beginPhoneAuth(
                                                                              context:
                                                                              context,
                                                                              phoneNumber:
                                                                              phoneNumberVal,
                                                                              onCodeSent:
                                                                                  () async {
                                                                                context
                                                                                    .goNamedAuth(
                                                                                  'Authentication',
                                                                                  mounted,
                                                                                  queryParams: {
                                                                                    'num': serializeParam(
                                                                                      '${_model
                                                                                          .textController1
                                                                                          .text}${_model
                                                                                          .mobilenumController
                                                                                          .text}',
                                                                                      ParamType
                                                                                          .String,
                                                                                    ),
                                                                                  }
                                                                                      .withoutNulls,
                                                                                  ignoreRedirect: true,
                                                                                );
                                                                              },
                                                                            );

                                                                            setState(
                                                                                    () {
                                                                                  FFAppState()
                                                                                      .sendOTP =
                                                                                  'sendOTP';
                                                                                });
                                                                            setState(
                                                                                    () {
                                                                                  FFAppState()
                                                                                      .phonenumber =
                                                                                  '${_model
                                                                                      .textController1
                                                                                      .text}${_model
                                                                                      .mobilenumController
                                                                                      .text}';
                                                                                });
                                                                            if (_shouldSetState)
                                                                              setState(
                                                                                      () {});
                                                                            return;
                                                                          }
                                                                        }

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                                  () {});
                                                                      },
                                                                      text:
                                                                      'SEND OTP',
                                                                      options:
                                                                      FFButtonOptions(
                                                                        width:
                                                                        150.0,
                                                                        height:
                                                                        40.0,
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding:
                                                                        EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .secondary,
                                                                        textStyle: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .titleMedium
                                                                            .override(
                                                                          fontFamily:
                                                                          'Poppins',
                                                                          color:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .primaryText,
                                                                          fontSize:
                                                                          18.0,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                        ),
                                                                        elevation:
                                                                        3.0,
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondary,
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .sendOTP !=
                                                                      null &&
                                                                      FFAppState()
                                                                          .sendOTP !=
                                                                          '')
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        GoRouter
                                                                            .of(
                                                                            context)
                                                                            .prepareAuthEvent();
                                                                        final smsCodeVal =
                                                                            _model
                                                                                .textController3
                                                                                .text;
                                                                        if (smsCodeVal ==
                                                                            null ||
                                                                            smsCodeVal
                                                                                .isEmpty) {
                                                                          ScaffoldMessenger
                                                                              .of(
                                                                              context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content:
                                                                              Text(
                                                                                  'Enter SMS verification code.'),
                                                                            ),
                                                                          );
                                                                          return;
                                                                        }
                                                                        final phoneVerifiedUser =
                                                                        await authManager
                                                                            .verifySmsCode(
                                                                          context:
                                                                          context,
                                                                          smsCode:
                                                                          smsCodeVal,
                                                                        );
                                                                        if (phoneVerifiedUser ==
                                                                            null) {
                                                                          return;
                                                                        }

                                                                        FFAppState()
                                                                            .update(
                                                                                () {
                                                                              FFAppState()
                                                                                  .eligibilitycheck =
                                                                              '';
                                                                              FFAppState()
                                                                                  .SAVEAGE =
                                                                              0;
                                                                              FFAppState()
                                                                                  .district =
                                                                              'District';
                                                                              FFAppState()
                                                                                  .state =
                                                                              'State';
                                                                            });
                                                                        setState(
                                                                                () {
                                                                              FFAppState()
                                                                                  .sendOTP =
                                                                              '';
                                                                            });

                                                                        context
                                                                            .goNamedAuth(
                                                                          'AddProfile',
                                                                          mounted,
                                                                          queryParams:
                                                                          {
                                                                            'phonenum':
                                                                            serializeParam(
                                                                              widget
                                                                                  .num,
                                                                              ParamType
                                                                                  .String,
                                                                            ),
                                                                          }
                                                                              .withoutNulls,
                                                                        );
                                                                      },
                                                                      text:
                                                                      'SUBMIT',
                                                                      options:
                                                                      FFButtonOptions(
                                                                        width:
                                                                        150.0,
                                                                        height:
                                                                        40.0,
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding:
                                                                        EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .secondary,
                                                                        textStyle: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .titleMedium
                                                                            .override(
                                                                          fontFamily:
                                                                          'Poppins',
                                                                          color:
                                                                          FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .primaryText,
                                                                          fontSize:
                                                                          18.0,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                        ),
                                                                        elevation:
                                                                        3.0,
                                                                        borderSide:
                                                                        BorderSide(
                                                                          color: FlutterFlowTheme
                                                                              .of(
                                                                              context)
                                                                              .secondary,
                                                                          width:
                                                                          1.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
            ),
          ),
        );
      },);
  }
}
