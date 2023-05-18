import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/headingbar/headingbar_widget.dart';
import '/components/job_contract/job_contract_widget.dart';
import '/components/no_list/no_list_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'jobs_dashboard_model.dart';
export 'jobs_dashboard_model.dart';

class JobsDashboardWidget extends StatefulWidget {
  const JobsDashboardWidget({
    Key? key,
    this.jobdetails,
  }) : super(key: key);

  final JobsRecord? jobdetails;

  @override
  _JobsDashboardWidgetState createState() => _JobsDashboardWidgetState();
}

class _JobsDashboardWidgetState extends State<JobsDashboardWidget> {
  late JobsDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobsDashboardModel());

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

    return StreamBuilder<List<JobsRecord>>(
      stream: queryJobsRecord(
        singleRecord: true,
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
        List<JobsRecord> jobsDashboardJobsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final jobsDashboardJobsRecord = jobsDashboardJobsRecordList.isNotEmpty
            ? jobsDashboardJobsRecordList.first
            : null;
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
                          colour2: FlutterFlowTheme.of(context).secondary,
                          colour3: FlutterFlowTheme.of(context).tertiary,
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
                                      text: 'JOB DETAILS',
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: Image.asset(
                                                        'assets/images/job.jpg',
                                                      ).image,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Container(
                                                    width: 120.0,
                                                    height: 120.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      widget.jobdetails!
                                                          .jobImage!,
                                                      fit: BoxFit.cover,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      functions.makeUpperCase(
                                                          widget.jobdetails!
                                                              .jobTitle!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 22.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Container(
                                              width: 250.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: SwitchListTile(
                                                value: _model
                                                        .switchListTileValue ??=
                                                    true,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .switchListTileValue =
                                                      newValue!);

                                                  if (!newValue!) {
                                                    final jobsUpdateData =
                                                        createJobsRecordData(
                                                      jobStatus: 'Closed',
                                                    );
                                                    await widget
                                                        .jobdetails!.reference
                                                        .update(jobsUpdateData);
                                                  }
                                                },
                                                title: Text(
                                                  'Job Status',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                subtitle: Text(
                                                  jobsDashboardJobsRecord!
                                                      .jobStatus!,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                                tileColor: Color(0xFFF5F5F5),
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: DefaultTabController(
                                                      length: 3,
                                                      initialIndex: 0,
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0),
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
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              indicatorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              indicatorWeight:
                                                                  3.0,
                                                              tabs: [
                                                                Tab(
                                                                  text:
                                                                      'ORGANISATION DETAILS',
                                                                ),
                                                                Tab(
                                                                  text:
                                                                      'JOB DESCRIPTION',
                                                                ),
                                                                Tab(
                                                                  text:
                                                                      'APPLIED WORKERS',
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: TabBarView(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      OrganisationsRecord>(
                                                                    stream: OrganisationsRecord.getDocument(widget
                                                                        .jobdetails!
                                                                        .orgRefId!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                80.0,
                                                                            height:
                                                                                80.0,
                                                                            child:
                                                                                SpinKitPulse(
                                                                              color: FlutterFlowTheme.of(context).accent1Old,
                                                                              size: 80.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnOrganisationsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: SingleChildScrollView(
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
                                                                                                                  fontSize: 20.0,
                                                                                                                  fontWeight: FontWeight.normal,
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
                                                                                                                    'ORGANISATION REGISTRATION ID',
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
                                                                                                                    'ORGANISATION NAME',
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
                                                                                                                    'PHONE NUMBER',
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
                                                                                                                      columnOrganisationsRecord.organisationRegistrationId!.toString(),
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
                                                                                                                      functions.firstCharUppercase(columnOrganisationsRecord.organisationName!),
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
                                                                                                                      columnOrganisationsRecord.phoneNumber!,
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
                                                                                                                      columnOrganisationsRecord.email!,
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
                                                                                                                      columnOrganisationsRecord.createdOn!.toString(),
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: MediaQuery.of(context).size.height * 0.32,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                                                                                              'ADDRESS',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    fontSize: 20.0,
                                                                                                                    fontWeight: FontWeight.normal,
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
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'PINCODE',
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
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'AREA',
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
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'DISTRICT',
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
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'STATE',
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
                                                                                                      Expanded(
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
                                                                                                                      columnOrganisationsRecord.pinCode!,
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
                                                                                                                      columnOrganisationsRecord.area!,
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
                                                                                                                      columnOrganisationsRecord.area!,
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
                                                                                                                      columnOrganisationsRecord.state!,
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
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: SingleChildScrollView(
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
                                                                                            Container(
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
                                                                                                      'JOB DESCRIPTION',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            fontSize: 20.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
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
                                                                                                                'TITLE',
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
                                                                                                                'DESCRIPTION',
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
                                                                                                                'CATEGORY',
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
                                                                                                                'SUB-CATEGORY',
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
                                                                                                                'NO OF VACANCIES',
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
                                                                                                                'MODE OF SALARY',
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
                                                                                                                'SALARY',
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
                                                                                                                'DAILY WORKING HOURS',
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
                                                                                                                'FACILITIES',
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
                                                                                                                  functions.firstCharUppercase(widget.jobdetails!.jobTitle!),
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
                                                                                                                  widget.jobdetails!.jobDescription!,
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
                                                                                                                  widget.jobdetails!.jobCategory!,
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
                                                                                                                  widget.jobdetails!.jobSubCateg!,
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
                                                                                                                  widget.jobdetails!.numberOfVacancies!.toString(),
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
                                                                                                                  widget.jobdetails!.modeOfSalary!,
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
                                                                                                                  '${widget.jobdetails!.minSalary}-${widget.jobdetails!.maxSalary}',
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
                                                                                                                  widget.jobdetails!.workingHours!,
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
                                                                                                                if (widget.jobdetails!.food == 'available')
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 30.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 60.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.fastfood_rounded,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                    onPressed: () {
                                                                                                                      print('food pressed ...');
                                                                                                                    },
                                                                                                                  ),
                                                                                                                if (widget.jobdetails!.lodging == 'available')
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                    child: FlutterFlowIconButton(
                                                                                                                      borderColor: Colors.transparent,
                                                                                                                      borderRadius: 30.0,
                                                                                                                      borderWidth: 1.0,
                                                                                                                      buttonSize: 60.0,
                                                                                                                      icon: Icon(
                                                                                                                        Icons.local_hotel_rounded,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                      onPressed: () {
                                                                                                                        print('IconButton pressed ...');
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (widget.jobdetails!.medical == 'available')
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 30.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 60.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.medical_services_outlined,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                    onPressed: () {
                                                                                                                      print('IconButton pressed ...');
                                                                                                                    },
                                                                                                                  ),
                                                                                                                if (widget.jobdetails!.transportation == 'available')
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                    child: FlutterFlowIconButton(
                                                                                                                      borderColor: Colors.transparent,
                                                                                                                      borderRadius: 30.0,
                                                                                                                      borderWidth: 1.0,
                                                                                                                      buttonSize: 60.0,
                                                                                                                      icon: Icon(
                                                                                                                        Icons.train,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                      onPressed: () {
                                                                                                                        print('IconButton pressed ...');
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if ((widget.jobdetails!.transportation == 'unavailable') && (widget.jobdetails!.medical == 'unavailable') && (widget.jobdetails!.lodging == 'unavailable') && (widget.jobdetails!.food == 'unavailable'))
                                                                                                                  Text(
                                                                                                                    'No facilities available',
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
                                                                                        height: MediaQuery.of(context).size.height * 0.32,
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
                                                                                                          'ELIGIBILITY CRITERIA',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                fontSize: 20.0,
                                                                                                                fontWeight: FontWeight.normal,
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
                                                                                                                  'MIN QUALIFICATION',
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
                                                                                                                  'GENDER',
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
                                                                                                                  'AGE',
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
                                                                                                                  'SKILL LEVEL',
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
                                                                                                                    widget.jobdetails!.minQualification!,
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
                                                                                                                    widget.jobdetails!.gender!,
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
                                                                                                                    '${widget.jobdetails!.minAge}-${widget.jobdetails!.maxAge}',
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
                                                                                                          Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Text(
                                                                                                              widget.jobdetails!.primarySkillLevel!,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    fontSize: 18.0,
                                                                                                                    fontWeight: FontWeight.normal,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(0.0, 2.0),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(0.0, 2.0),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: StreamBuilder<List<OrganisationsRecord>>(
                                                                                                  stream: queryOrganisationsRecord(
                                                                                                    singleRecord: true,
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
                                                                                                    List<OrganisationsRecord> columnOrganisationsRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final columnOrganisationsRecord = columnOrganisationsRecordList.isNotEmpty ? columnOrganisationsRecordList.first : null;
                                                                                                    return Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 60.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 570.0,
                                                                                                                    height: 100.0,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          'FULL NAME',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 20.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 150.0,
                                                                                                                    height: 100.0,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          'GENDER',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 20.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 300.0,
                                                                                                                    height: 100.0,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          'LOCATION',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 20.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    'STATUS',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 20.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        StreamBuilder<List<WorkersRecord>>(
                                                                                                          stream: queryWorkersRecord(),
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
                                                                                                            List<WorkersRecord> columnWorkersRecordList = snapshot.data!;
                                                                                                            return Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: List.generate(columnWorkersRecordList.length, (columnIndex) {
                                                                                                                final columnWorkersRecord = columnWorkersRecordList[columnIndex];
                                                                                                                return Builder(
                                                                                                                  builder: (context) {
                                                                                                                    final jobapplied = widget.jobdetails!.applications!.toList();
                                                                                                                    if (jobapplied.isEmpty) {
                                                                                                                      return Container(
                                                                                                                        width: double.infinity,
                                                                                                                        height: 150.0,
                                                                                                                        child: NoListWidget(
                                                                                                                          text: 'workers',
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    }
                                                                                                                    return ListView.builder(
                                                                                                                      padding: EdgeInsets.zero,
                                                                                                                      shrinkWrap: true,
                                                                                                                      scrollDirection: Axis.vertical,
                                                                                                                      itemCount: jobapplied.length,
                                                                                                                      itemBuilder: (context, jobappliedIndex) {
                                                                                                                        final jobappliedItem = jobapplied[jobappliedIndex];
                                                                                                                        return Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                                              child: Container(
                                                                                                                                width: double.infinity,
                                                                                                                                height: 150.0,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  boxShadow: [
                                                                                                                                    BoxShadow(
                                                                                                                                      blurRadius: 4.0,
                                                                                                                                      color: Color(0xFFDBE2E7),
                                                                                                                                      offset: Offset(0.0, 2.0),
                                                                                                                                    )
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                                                  children: [
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Container(
                                                                                                                                          width: 110.0,
                                                                                                                                          height: 110.0,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                            image: DecorationImage(
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                              image: Image.asset(
                                                                                                                                                'assets/images/worker.jpg',
                                                                                                                                              ).image,
                                                                                                                                            ),
                                                                                                                                            shape: BoxShape.circle,
                                                                                                                                            border: Border.all(
                                                                                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          child: Container(
                                                                                                                                            width: 120.0,
                                                                                                                                            height: 120.0,
                                                                                                                                            clipBehavior: Clip.antiAlias,
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              shape: BoxShape.circle,
                                                                                                                                            ),
                                                                                                                                            child: Image.network(
                                                                                                                                              columnWorkersRecord.photo!,
                                                                                                                                              fit: BoxFit.cover,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                          child: Container(
                                                                                                                                            width: 430.0,
                                                                                                                                            height: 100.0,
                                                                                                                                            decoration: BoxDecoration(),
                                                                                                                                            child: Column(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                              children: [
                                                                                                                                                Text(
                                                                                                                                                  jobappliedItem.workerName!,
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
                                                                                                                                    Container(
                                                                                                                                      width: 150.0,
                                                                                                                                      height: 100.0,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Text(
                                                                                                                                            jobappliedItem.gender!,
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
                                                                                                                                      width: 300.0,
                                                                                                                                      height: 100.0,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          Text(
                                                                                                                                            jobappliedItem.area!,
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                                  fontSize: 18.0,
                                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        FlutterFlowIconButton(
                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                          borderRadius: 30.0,
                                                                                                                                          borderWidth: 1.0,
                                                                                                                                          buttonSize: 60.0,
                                                                                                                                          icon: Icon(
                                                                                                                                            Icons.check_outlined,
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            size: 30.0,
                                                                                                                                          ),
                                                                                                                                          onPressed: () async {
                                                                                                                                            final jobsUpdateData = {
                                                                                                                                              'applications': FieldValue.arrayUnion([
                                                                                                                                                getJobApplicationFirestoreData(
                                                                                                                                                  createJobApplicationStruct(
                                                                                                                                                    applicationStatus: 1,
                                                                                                                                                    clearUnsetFields: false,
                                                                                                                                                  ),
                                                                                                                                                  true,
                                                                                                                                                )
                                                                                                                                              ]),
                                                                                                                                            };
                                                                                                                                            await widget.jobdetails!.reference.update(jobsUpdateData);
                                                                                                                                            await showModalBottomSheet(
                                                                                                                                              isScrollControlled: true,
                                                                                                                                              backgroundColor: Colors.transparent,
                                                                                                                                              barrierColor: Color(0x00000000),
                                                                                                                                              enableDrag: false,
                                                                                                                                              context: context,
                                                                                                                                              builder: (bottomSheetContext) {
                                                                                                                                                return GestureDetector(
                                                                                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                                                    child: JobContractWidget(
                                                                                                                                                      workerRef: columnWorkersRecord.userRef,
                                                                                                                                                      orgRef: columnOrganisationsRecord!.reference,
                                                                                                                                                      startDate: widget.jobdetails!.startDate,
                                                                                                                                                      endDate: widget.jobdetails!.endDate,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                );
                                                                                                                                              },
                                                                                                                                            ).then((value) => setState(() {}));
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                        FlutterFlowIconButton(
                                                                                                                                          borderColor: Colors.transparent,
                                                                                                                                          borderRadius: 30.0,
                                                                                                                                          borderWidth: 1.0,
                                                                                                                                          buttonSize: 60.0,
                                                                                                                                          icon: Icon(
                                                                                                                                            Icons.clear_rounded,
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            size: 30.0,
                                                                                                                                          ),
                                                                                                                                          onPressed: () async {
                                                                                                                                            final jobsUpdateData = {
                                                                                                                                              'applications': FieldValue.arrayUnion([
                                                                                                                                                getJobApplicationFirestoreData(
                                                                                                                                                  createJobApplicationStruct(
                                                                                                                                                    applicationStatus: 2,
                                                                                                                                                    clearUnsetFields: false,
                                                                                                                                                  ),
                                                                                                                                                  true,
                                                                                                                                                )
                                                                                                                                              ]),
                                                                                                                                            };
                                                                                                                                            await widget.jobdetails!.reference.update(jobsUpdateData);
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        );
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                );
                                                                                                              }),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
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
      },
    );
  }
}
