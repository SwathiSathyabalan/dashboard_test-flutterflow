import '/backend/backend.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/no_list/no_list_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'organisation_dashboard_model.dart';
export 'organisation_dashboard_model.dart';

class OrganisationDashboardWidget extends StatefulWidget {
  const OrganisationDashboardWidget({
    Key? key,
    this.organisationdetails,
    this.orgref,
  }) : super(key: key);

  final OrganisationsRecord? organisationdetails;
  final DocumentReference? orgref;

  @override
  _OrganisationDashboardWidgetState createState() =>
      _OrganisationDashboardWidgetState();
}

class _OrganisationDashboardWidgetState
    extends State<OrganisationDashboardWidget> {
  late OrganisationDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrganisationDashboardModel());

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
                                  text: 'ORGANISATION DETAILS',
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 196.5,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 176.7,
                                              height: 176.7,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -0.95),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 15.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    height: 200.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .green,
                                                      image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: Image.asset(
                                                          'assets/images/logo.jpg',
                                                        ).image,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFBBBBBB),
                                                      ),
                                                    ),
                                                    child: Visibility(
                                                      visible: widget
                                                                  .organisationdetails!
                                                                  .organisationLogo !=
                                                              null &&
                                                          widget.organisationdetails!
                                                                  .organisationLogo !=
                                                              '',
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    1.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      260.0),
                                                          child: Image.network(
                                                            widget
                                                                .organisationdetails!
                                                                .organisationLogo!,
                                                            width: 309.6,
                                                            height: 254.7,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    functions.makeUpperCase(
                                                        widget
                                                            .organisationdetails!
                                                            .organisationName!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 30.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().profilepic = widget
                                                  .organisationdetails!
                                                  .organisationLogo!;
                                            });
                                            FFAppState().update(() {
                                              FFAppState().editaddress = widget
                                                  .organisationdetails!
                                                  .reference;
                                              FFAppState().disabling = '2';
                                              FFAppState().OrganisationArea =
                                                  '1';
                                              FFAppState().addToEditorgarea(
                                                  widget.organisationdetails!
                                                      .area!);
                                              FFAppState().area = '1';
                                              FFAppState().testapi = '1';
                                            });

                                            context.pushNamed(
                                              'EditOrgan',
                                              queryParams: {
                                                'orgdetails': serializeParam(
                                                  widget.organisationdetails,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'orgdetails':
                                                    widget.organisationdetails,
                                              },
                                            );
                                          },
                                          text: 'EDIT DETAILS',
                                          options: FFButtonOptions(
                                            width: 160.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: DefaultTabController(
                                                  length: 2,
                                                  initialIndex: 0,
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment(0.0, 0),
                                                        child: TabBar(
                                                          labelColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          unselectedLabelColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          labelPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        22.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          indicatorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          indicatorWeight: 3.0,
                                                          tabs: [
                                                            Tab(
                                                              text: 'JOBS LIST',
                                                            ),
                                                            Tab(
                                                              text:
                                                                  'GENERAL DETAILS',
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: TabBarView(
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().profilepic = '';
                                                                                    });

                                                                                    context.goNamed(
                                                                                      'AddJob',
                                                                                      queryParams: {
                                                                                        'orgdetails': serializeParam(
                                                                                          widget.organisationdetails,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'orgdetails': widget.organisationdetails,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text: 'ADD NEW JOB',
                                                                                  options: FFButtonOptions(
                                                                                    width: 200.0,
                                                                                    height: 50.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 18.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                    elevation: 2.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                30.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          height: 50.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 338.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                                    shape: BoxShape.rectangle,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 374.1,
                                                                                                        height: 100.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                'JOB TITLE',
                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: 164.7,
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'GENDER',
                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: 221.2,
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'DISTRICT',
                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: 184.0,
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'STATE',
                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: 250.0,
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'VACANCIES',
                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: 250.0,
                                                                                                  height: 100.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'VIEW',
                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  StreamBuilder<List<JobsRecord>>(
                                                                                    stream: queryJobsRecord(
                                                                                      parent: widget.organisationdetails!.reference,
                                                                                    ),
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
                                                                                      List<JobsRecord> listViewJobsRecordList = snapshot.data!;
                                                                                      if (listViewJobsRecordList.isEmpty) {
                                                                                        return Container(
                                                                                          width: double.infinity,
                                                                                          height: 150.0,
                                                                                          child: NoListWidget(
                                                                                            text: 'captains',
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: listViewJobsRecordList.length,
                                                                                        itemBuilder: (context, listViewIndex) {
                                                                                          final listViewJobsRecord = listViewJobsRecordList[listViewIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 2.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 4.0,
                                                                                                    color: Color(0x33000000),
                                                                                                    offset: Offset(0.0, 2.0),
                                                                                                  )
                                                                                                ],
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 338.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                                        shape: BoxShape.rectangle,
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 75.0,
                                                                                                            height: 75.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              image: DecorationImage(
                                                                                                                fit: BoxFit.cover,
                                                                                                                image: Image.asset(
                                                                                                                  'assets/images/captains111.png',
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              shape: BoxShape.circle,
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Visibility(
                                                                                                              visible: listViewJobsRecord.jobImage != null && listViewJobsRecord.jobImage != '',
                                                                                                              child: Container(
                                                                                                                width: 75.0,
                                                                                                                height: 75.0,
                                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  shape: BoxShape.circle,
                                                                                                                ),
                                                                                                                child: Image.network(
                                                                                                                  listViewJobsRecord.jobImage!,
                                                                                                                  fit: BoxFit.fill,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: 374.1,
                                                                                                            height: 100.0,
                                                                                                            decoration: BoxDecoration(),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    functions.firstCharUppercase(listViewJobsRecord.jobTitle!).maybeHandleOverflow(
                                                                                                                          maxChars: 20,
                                                                                                                          replacement: '…',
                                                                                                                        ),
                                                                                                                    maxLines: 1,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 164.7,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            listViewJobsRecord.gender!,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 221.2,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            listViewJobsRecord.district!.maybeHandleOverflow(
                                                                                                              maxChars: 15,
                                                                                                              replacement: '…',
                                                                                                            ),
                                                                                                            maxLines: 1,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 184.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            listViewJobsRecord.state!.maybeHandleOverflow(
                                                                                                              maxChars: 15,
                                                                                                              replacement: '…',
                                                                                                            ),
                                                                                                            maxLines: 1,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 250.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            listViewJobsRecord.numberOfVacancies!.toString(),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  fontSize: 18.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 250.0,
                                                                                                      height: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            FlutterFlowIconButton(
                                                                                                              borderColor: Colors.transparent,
                                                                                                              borderRadius: 30.0,
                                                                                                              borderWidth: 1.0,
                                                                                                              buttonSize: 45.0,
                                                                                                              icon: Icon(
                                                                                                                Icons.arrow_forward_ios_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 25.0,
                                                                                                              ),
                                                                                                              onPressed: () async {
                                                                                                                context.pushNamed(
                                                                                                                  'JobDetails',
                                                                                                                  queryParams: {
                                                                                                                    'jobdetails': serializeParam(
                                                                                                                      listViewJobsRecord,
                                                                                                                      ParamType.Document,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                  extra: <String, dynamic>{
                                                                                                                    'jobdetails': listViewJobsRecord,
                                                                                                                  },
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              height: 50.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'BASIC DETAILS',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 20.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                      child: Container(
                                                                                                        width: 300.0,
                                                                                                        height: 50.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'REGISTRATION ID',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 18.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                      child: Container(
                                                                                                        width: 300.0,
                                                                                                        height: 50.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'NAME',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 18.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                      child: Container(
                                                                                                        width: 300.0,
                                                                                                        height: 50.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'PHONE NO',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 18.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                      child: Container(
                                                                                                        width: 300.0,
                                                                                                        height: 50.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'EMAIL',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 18.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                      child: Container(
                                                                                                        width: 300.0,
                                                                                                        height: 50.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'CREATED ON',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 18.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                widget.organisationdetails!.organisationRegistrationId!.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                functions.firstCharUppercase(widget.organisationdetails!.organisationName!),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                widget.organisationdetails!.phoneNumber!,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                widget.organisationdetails!.email!,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                widget.organisationdetails!.createdOn!.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: MediaQuery.of(context).size.height * 0.5,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                height: 50.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'ADDRESS DETAILS',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 20.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'PINCODE',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'AREA',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'DISTRICT',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'STATE',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.organisationdetails!.pinCode!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.organisationdetails!.area!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.organisationdetails!.district!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.organisationdetails!.state!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
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
                                                            ),
                                                          ],
                                                        ),
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
      ),
    );
  }
}
