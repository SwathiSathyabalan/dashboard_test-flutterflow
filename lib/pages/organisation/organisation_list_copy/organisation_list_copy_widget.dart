import '/backend/backend.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'organisation_list_copy_model.dart';
export 'organisation_list_copy_model.dart';

class OrganisationListCopyWidget extends StatefulWidget {
  const OrganisationListCopyWidget({Key? key}) : super(key: key);

  @override
  _OrganisationListCopyWidgetState createState() =>
      _OrganisationListCopyWidgetState();
}

class _OrganisationListCopyWidgetState
    extends State<OrganisationListCopyWidget> {
  late OrganisationListCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrganisationListCopyModel());

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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.webNavModel,
                    updateCallback: () => setState(() {}),
                    child: WebNavWidget(
                      colour1: FlutterFlowTheme.of(context).tertiary,
                      colour2: FlutterFlowTheme.of(context).tertiary,
                      colour3: FlutterFlowTheme.of(context).secondary,
                      colour4: FlutterFlowTheme.of(context).tertiary,
                      colour5: FlutterFlowTheme.of(context).tertiary,
                      colour6: FlutterFlowTheme.of(context).tertiary,
                      colour7: FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.headingbarModel,
                                updateCallback: () => setState(() {}),
                                child: HeadingbarWidget(
                                  text: 'LIST OF ORGANISATIONS',
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 20.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() {
                                                      FFAppState()
                                                              .randomnumbergenerator =
                                                          functions.rand();
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState().disabling =
                                                          '2';
                                                      FFAppState()
                                                              .OrganisationArea =
                                                          '1';
                                                      FFAppState().profilepic =
                                                          '';
                                                    });

                                                    context
                                                        .pushNamed('AddOrgan');
                                                  },
                                                  text: 'ADD NEW ORGANISATION',
                                                  options: FFButtonOptions(
                                                    width: 280.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: FutureBuilder<
                                                      List<
                                                          OrganisationsRecord>>(
                                                    future:
                                                        queryOrganisationsRecordOnce(),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 80.0,
                                                            height: 80.0,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1Old,
                                                              size: 80.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<OrganisationsRecord>
                                                          wrapOrganisationsRecordList =
                                                          snapshot.data!;
                                                      return Wrap(
                                                        spacing: 70.0,
                                                        runSpacing: 50.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment
                                                                .spaceEvenly,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: List.generate(
                                                            wrapOrganisationsRecordList
                                                                .length,
                                                            (wrapIndex) {
                                                          final wrapOrganisationsRecord =
                                                              wrapOrganisationsRecordList[
                                                                  wrapIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'OrganisationDashboard',
                                                                queryParams: {
                                                                  'organisationdetails':
                                                                      serializeParam(
                                                                    wrapOrganisationsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'orgref':
                                                                      serializeParam(
                                                                    wrapOrganisationsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'organisationdetails':
                                                                      wrapOrganisationsRecord,
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 618.0,
                                                              height: 250.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .faded,
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            2.0),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .outlines,
                                                                  width: 3.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -0.95),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).green,
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            image:
                                                                                Image.asset(
                                                                              'assets/images/logo.jpg',
                                                                            ).image,
                                                                          ),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFBBBBBB),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Visibility(
                                                                          visible:
                                                                              wrapOrganisationsRecord.organisationLogo != null && wrapOrganisationsRecord.organisationLogo != '',
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                1.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(260.0),
                                                                              child: Image.network(
                                                                                wrapOrganisationsRecord.organisationLogo!,
                                                                                width: 310.0,
                                                                                height: 255.0,
                                                                                fit: BoxFit.fill,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            1000.0,
                                                                        height:
                                                                            220.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    functions.firstCharUppercase(wrapOrganisationsRecord.organisationName!),
                                                                                    style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.phone_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 26.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    wrapOrganisationsRecord.phoneNumber!,
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.idCard,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    wrapOrganisationsRecord.organisationRegistrationId!.toString(),
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 18.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.mail_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    wrapOrganisationsRecord.email!,
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 18.0,
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
                                                          );
                                                        }),
                                                      );
                                                    },
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
                              ),
                              wrapWithModel(
                                model: _model.bottombarModel,
                                updateCallback: () => setState(() {}),
                                child: BottombarWidget(),
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
      ),
    );
  }
}
