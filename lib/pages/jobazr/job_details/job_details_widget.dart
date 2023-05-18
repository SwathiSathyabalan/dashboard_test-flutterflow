import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottombar/bottombar_widget.dart';
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
import 'job_details_model.dart';
export 'job_details_model.dart';

class JobDetailsWidget extends StatefulWidget {
  const JobDetailsWidget({
    Key? key,
    this.jobdetails,
  }) : super(key: key);

  final JobsRecord? jobdetails;

  @override
  _JobDetailsWidgetState createState() => _JobDetailsWidgetState();
}

class _JobDetailsWidgetState extends State<JobDetailsWidget> {
  late JobDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobDetailsModel());

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
        queryBuilder: (jobsRecord) =>
            jobsRecord.where('job_id', isEqualTo: widget.jobdetails!.jobId),
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
        List<JobsRecord> jobDetailsJobsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final jobDetailsJobsRecord = jobDetailsJobsRecordList.isNotEmpty
            ? jobDetailsJobsRecordList.first
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
                                    height: 180.0,
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
                                                        15.0, 0.0, 0.0, 0.0),
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                  fontSize:
                                                                      22.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      functions.firstCharUppercase(
                                                          widget.jobdetails!
                                                              .organisationName!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (jobDetailsJobsRecord!.endDate! >=
                                              getCurrentTimestamp)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                width: 260.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: SwitchListTile(
                                                        value: _model
                                                                .switchListTileValue ??=
                                                            () {
                                                          if (widget.jobdetails!
                                                                  .jobStatus ==
                                                              '1') {
                                                            return true;
                                                          } else if (widget
                                                                  .jobdetails!
                                                                  .jobStatus ==
                                                              '2') {
                                                            return false;
                                                          } else {
                                                            return (widget
                                                                    .jobdetails!
                                                                    .jobStatus ==
                                                                'kkk');
                                                          }
                                                        }(),
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .switchListTileValue =
                                                              newValue!);
                                                          if (newValue!) {
                                                            final jobsUpdateData =
                                                                createJobsRecordData(
                                                              jobStatus: '1',
                                                            );
                                                            await widget
                                                                .jobdetails!
                                                                .reference
                                                                .update(
                                                                    jobsUpdateData);
                                                          } else {
                                                            final jobsUpdateData =
                                                                createJobsRecordData(
                                                              jobStatus: '2',
                                                            );
                                                            await widget
                                                                .jobdetails!
                                                                .reference
                                                                .update(
                                                                    jobsUpdateData);
                                                          }
                                                        },
                                                        title: Text(
                                                          'Job Status',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall,
                                                        ),
                                                        tileColor:
                                                            Color(0xFFF5F5F5),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        dense: false,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                      ),
                                                    ),
                                                    Text(
                                                      jobDetailsJobsRecord!
                                                                  .jobStatus ==
                                                              '1'
                                                          ? 'Active'
                                                          : 'Closed',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
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
                                                    child: StreamBuilder<
                                                        List<JobsRecord>>(
                                                      stream: queryJobsRecord(
                                                        queryBuilder: (jobsRecord) =>
                                                            jobsRecord.where(
                                                                'job_id',
                                                                isEqualTo: widget
                                                                    .jobdetails!
                                                                    .jobId),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 80.0,
                                                              height: 80.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1Old,
                                                                size: 80.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<JobsRecord>
                                                            tabBarJobsRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final tabBarJobsRecord =
                                                            tabBarJobsRecordList
                                                                    .isNotEmpty
                                                                ? tabBarJobsRecordList
                                                                    .first
                                                                : null;
                                                        return DefaultTabController(
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
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                                  labelStyle: FlutterFlowTheme.of(
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
                                                                          'APPLIED WORKERS',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'JOB DESCRIPTION',
                                                                    ),
                                                                    Tab(
                                                                      text:
                                                                          'ORGANISATION DETAILS',
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TabBarView(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
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
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 0.264,
                                                                                                                        height: 100.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  'APPLIED WORKERS',
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Poppins',
                                                                                                                                        fontSize: 20.0,
                                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Text(
                                                                                                                                        '${functions.acceptedForJobs(tabBarJobsRecord, 0).toString()}',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: MediaQuery.of(context).size.width * 0.27,
                                                                                                                        height: 100.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                            children: [
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Text(
                                                                                                                                    'ACCEPTED WORKERS',
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Poppins',
                                                                                                                                          fontSize: 20.0,
                                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                    child: Text(
                                                                                                                                      '${functions.acceptedForJobs(tabBarJobsRecord, 1).toString()}',
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Container(
                                                                                                                          width: MediaQuery.of(context).size.width * 0.25,
                                                                                                                          height: 100.0,
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Text(
                                                                                                                                      'REJECTED WORKERS',
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                            fontSize: 20.0,
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        '${functions.acceptedForJobs(tabBarJobsRecord, 2).toString()}',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Container(
                                                                                                              width: 100.0,
                                                                                                              height: MediaQuery.of(context).size.height * 0.6,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFFEFE2CB),
                                                                                                              ),
                                                                                                              child: Builder(
                                                                                                                builder: (context) {
                                                                                                                  final appliedworkers = tabBarJobsRecord!.applications!.toList().where((e) => e.applicationStatus == 0).toList();
                                                                                                                  if (appliedworkers.isEmpty) {
                                                                                                                    return NoListWidget(
                                                                                                                      text: 'workers',
                                                                                                                    );
                                                                                                                  }
                                                                                                                  return SingleChildScrollView(
                                                                                                                    primary: false,
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: List.generate(appliedworkers.length, (appliedworkersIndex) {
                                                                                                                        final appliedworkersItem = appliedworkers[appliedworkersIndex];
                                                                                                                        return StreamBuilder<WorkersRecord>(
                                                                                                                          stream: WorkersRecord.getDocument(appliedworkersItem.workerId!),
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
                                                                                                                            final columnWorkersRecord = snapshot.data!;
                                                                                                                            return Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final appliedjobs = columnWorkersRecord.jobApplied!.toList().where((e) => e.applicationStatus == 0).toList();
                                                                                                                                return SingleChildScrollView(
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: List.generate(appliedjobs.length, (appliedjobsIndex) {
                                                                                                                                      final appliedjobsItem = appliedjobs[appliedjobsIndex];
                                                                                                                                      return Visibility(
                                                                                                                                        visible: appliedjobsItem.jobId == widget.jobdetails!.reference,
                                                                                                                                        child: Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                                          child: Container(
                                                                                                                                            width: MediaQuery.of(context).size.width * 0.31,
                                                                                                                                            height: 89.9,
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                                                                                              border: Border.all(
                                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            child: Column(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              children: [
                                                                                                                                                Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                  children: [
                                                                                                                                                    Container(
                                                                                                                                                      width: 294.3,
                                                                                                                                                      height: 84.9,
                                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                      ),
                                                                                                                                                      child: Column(
                                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                        children: [
                                                                                                                                                          Column(
                                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                            children: [
                                                                                                                                                              Padding(
                                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                                                child: Row(
                                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                                  children: [
                                                                                                                                                                    Text(
                                                                                                                                                                      functions.firstCharUppercase(appliedworkersItem.workerName!),
                                                                                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                                            fontFamily: 'Poppins',
                                                                                                                                                                            color: columnWorkersRecord.employmentStatus == '0' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).red,
                                                                                                                                                                          ),
                                                                                                                                                                    ),
                                                                                                                                                                  ],
                                                                                                                                                                ),
                                                                                                                                                              ),
                                                                                                                                                              Row(
                                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                                children: [
                                                                                                                                                                  Padding(
                                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                                    child: InkWell(
                                                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                                                      onDoubleTap: () async {
                                                                                                                                                                        if (columnWorkersRecord.employmentStatus == '0') {
                                                                                                                                                                          context.pushNamed(
                                                                                                                                                                            'Workersprofile',
                                                                                                                                                                            queryParams: {
                                                                                                                                                                              'workerdetails': serializeParam(
                                                                                                                                                                                columnWorkersRecord,
                                                                                                                                                                                ParamType.Document,
                                                                                                                                                                              ),
                                                                                                                                                                              'workers': serializeParam(
                                                                                                                                                                                columnWorkersRecord.reference,
                                                                                                                                                                                ParamType.DocumentReference,
                                                                                                                                                                              ),
                                                                                                                                                                            }.withoutNulls,
                                                                                                                                                                            extra: <String, dynamic>{
                                                                                                                                                                              'workerdetails': columnWorkersRecord,
                                                                                                                                                                            },
                                                                                                                                                                          );
                                                                                                                                                                        } else {
                                                                                                                                                                          await showDialog(
                                                                                                                                                                            context: context,
                                                                                                                                                                            builder: (alertDialogContext) {
                                                                                                                                                                              return AlertDialog(
                                                                                                                                                                                title: Text('Alert'),
                                                                                                                                                                                content: Text('The person is already employed'),
                                                                                                                                                                                actions: [
                                                                                                                                                                                  TextButton(
                                                                                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                                                                    child: Text('Ok'),
                                                                                                                                                                                  ),
                                                                                                                                                                                ],
                                                                                                                                                                              );
                                                                                                                                                                            },
                                                                                                                                                                          );
                                                                                                                                                                        }
                                                                                                                                                                      },
                                                                                                                                                                      child: FFButtonWidget(
                                                                                                                                                                        onPressed: () async {
                                                                                                                                                                          if (columnWorkersRecord.employmentStatus == '0') {
                                                                                                                                                                            context.pushNamed(
                                                                                                                                                                              'Workersprofile',
                                                                                                                                                                              queryParams: {
                                                                                                                                                                                'workerdetails': serializeParam(
                                                                                                                                                                                  columnWorkersRecord,
                                                                                                                                                                                  ParamType.Document,
                                                                                                                                                                                ),
                                                                                                                                                                                'workers': serializeParam(
                                                                                                                                                                                  columnWorkersRecord.reference,
                                                                                                                                                                                  ParamType.DocumentReference,
                                                                                                                                                                                ),
                                                                                                                                                                              }.withoutNulls,
                                                                                                                                                                              extra: <String, dynamic>{
                                                                                                                                                                                'workerdetails': columnWorkersRecord,
                                                                                                                                                                              },
                                                                                                                                                                            );
                                                                                                                                                                          } else {
                                                                                                                                                                            await showDialog(
                                                                                                                                                                              context: context,
                                                                                                                                                                              builder: (alertDialogContext) {
                                                                                                                                                                                return AlertDialog(
                                                                                                                                                                                  title: Text('Alert'),
                                                                                                                                                                                  content: Text('The person is already employed'),
                                                                                                                                                                                  actions: [
                                                                                                                                                                                    TextButton(
                                                                                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                                                                      child: Text('Ok'),
                                                                                                                                                                                    ),
                                                                                                                                                                                  ],
                                                                                                                                                                                );
                                                                                                                                                                              },
                                                                                                                                                                            );
                                                                                                                                                                          }
                                                                                                                                                                        },
                                                                                                                                                                        text: 'View Profile',
                                                                                                                                                                        options: FFButtonOptions(
                                                                                                                                                                          width: 130.0,
                                                                                                                                                                          height: 30.0,
                                                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                                          color: columnWorkersRecord.employmentStatus == '0' ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                                              ),
                                                                                                                                                                          elevation: 2.0,
                                                                                                                                                                          borderSide: BorderSide(
                                                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                                            width: 1.0,
                                                                                                                                                                          ),
                                                                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                                        ),
                                                                                                                                                                      ),
                                                                                                                                                                    ),
                                                                                                                                                                  ),
                                                                                                                                                                ],
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
                                                                                                                                                          Container(
                                                                                                                                                            width: 136.6,
                                                                                                                                                            height: 78.4,
                                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                            ),
                                                                                                                                                            child: Column(
                                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                                              children: [
                                                                                                                                                                Padding(
                                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                                                                                                  child: Row(
                                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                                    children: [
                                                                                                                                                                      Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                                                        child: FlutterFlowIconButton(
                                                                                                                                                                          borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                                          borderRadius: 30.0,
                                                                                                                                                                          borderWidth: 1.0,
                                                                                                                                                                          buttonSize: 40.0,
                                                                                                                                                                          fillColor: columnWorkersRecord.employmentStatus == '0' ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).red,
                                                                                                                                                                          icon: Icon(
                                                                                                                                                                            Icons.check_outlined,
                                                                                                                                                                            color: Color(0xFF23F213),
                                                                                                                                                                            size: 24.0,
                                                                                                                                                                          ),
                                                                                                                                                                          onPressed: () async {
                                                                                                                                                                            if (jobDetailsJobsRecord!.filled! < jobDetailsJobsRecord!.numberOfVacancies!) {
                                                                                                                                                                              if (columnWorkersRecord.employmentStatus == '0') {
                                                                                                                                                                                final workersUpdateData1 = {
                                                                                                                                                                                  ...createWorkersRecordData(
                                                                                                                                                                                    employmentStatus: '1',
                                                                                                                                                                                  ),
                                                                                                                                                                                  'job_applied': FieldValue.arrayUnion([
                                                                                                                                                                                    getWorkerJobApplicationFirestoreData(
                                                                                                                                                                                      createWorkerJobApplicationStruct(
                                                                                                                                                                                        jobId: appliedjobsItem.jobId,
                                                                                                                                                                                        appliedOn: appliedjobsItem.appliedOn,
                                                                                                                                                                                        applicationStatus: 1,
                                                                                                                                                                                        clearUnsetFields: false,
                                                                                                                                                                                      ),
                                                                                                                                                                                      true,
                                                                                                                                                                                    )
                                                                                                                                                                                  ]),
                                                                                                                                                                                };
                                                                                                                                                                                await columnWorkersRecord.reference.update(workersUpdateData1);

                                                                                                                                                                                final jobsUpdateData1 = {
                                                                                                                                                                                  'applications': FieldValue.arrayUnion([
                                                                                                                                                                                    getJobApplicationFirestoreData(
                                                                                                                                                                                      createJobApplicationStruct(
                                                                                                                                                                                        applicationStatus: 1,
                                                                                                                                                                                        workerId: appliedworkersItem.workerId,
                                                                                                                                                                                        appliedOn: appliedworkersItem.appliedOn,
                                                                                                                                                                                        workerName: appliedworkersItem.workerName,
                                                                                                                                                                                        gender: appliedworkersItem.gender,
                                                                                                                                                                                        area: appliedworkersItem.area,
                                                                                                                                                                                        clearUnsetFields: true,
                                                                                                                                                                                      ),
                                                                                                                                                                                      true,
                                                                                                                                                                                    )
                                                                                                                                                                                  ]),
                                                                                                                                                                                  'filled': FieldValue.increment(1),
                                                                                                                                                                                };
                                                                                                                                                                                await widget.jobdetails!.reference.update(jobsUpdateData1);

                                                                                                                                                                                final workersUpdateData2 = {
                                                                                                                                                                                  'job_applied': FieldValue.arrayRemove([
                                                                                                                                                                                    getWorkerJobApplicationFirestoreData(
                                                                                                                                                                                      createWorkerJobApplicationStruct(
                                                                                                                                                                                        jobId: appliedjobsItem.jobId,
                                                                                                                                                                                        appliedOn: appliedjobsItem.appliedOn,
                                                                                                                                                                                        applicationStatus: appliedjobsItem.applicationStatus,
                                                                                                                                                                                        clearUnsetFields: false,
                                                                                                                                                                                      ),
                                                                                                                                                                                      true,
                                                                                                                                                                                    )
                                                                                                                                                                                  ]),
                                                                                                                                                                                };
                                                                                                                                                                                await columnWorkersRecord.reference.update(workersUpdateData2);

                                                                                                                                                                                final jobsUpdateData2 = {
                                                                                                                                                                                  'applications': FieldValue.arrayRemove([
                                                                                                                                                                                    getJobApplicationFirestoreData(
                                                                                                                                                                                      createJobApplicationStruct(
                                                                                                                                                                                        workerId: appliedworkersItem.workerId,
                                                                                                                                                                                        appliedOn: appliedworkersItem.appliedOn,
                                                                                                                                                                                        applicationStatus: appliedworkersItem.applicationStatus,
                                                                                                                                                                                        workerName: appliedworkersItem.workerName,
                                                                                                                                                                                        gender: appliedworkersItem.gender,
                                                                                                                                                                                        area: appliedworkersItem.area,
                                                                                                                                                                                        clearUnsetFields: false,
                                                                                                                                                                                      ),
                                                                                                                                                                                      true,
                                                                                                                                                                                    )
                                                                                                                                                                                  ]),
                                                                                                                                                                                };
                                                                                                                                                                                await widget.jobdetails!.reference.update(jobsUpdateData2);
                                                                                                                                                                              } else {
                                                                                                                                                                                await showDialog(
                                                                                                                                                                                  context: context,
                                                                                                                                                                                  builder: (alertDialogContext) {
                                                                                                                                                                                    return AlertDialog(
                                                                                                                                                                                      title: Text('Alert'),
                                                                                                                                                                                      content: Text('The person is already employed'),
                                                                                                                                                                                      actions: [
                                                                                                                                                                                        TextButton(
                                                                                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                                                                          child: Text('Ok'),
                                                                                                                                                                                        ),
                                                                                                                                                                                      ],
                                                                                                                                                                                    );
                                                                                                                                                                                  },
                                                                                                                                                                                );
                                                                                                                                                                              }
                                                                                                                                                                            } else {
                                                                                                                                                                              await showDialog(
                                                                                                                                                                                context: context,
                                                                                                                                                                                builder: (alertDialogContext) {
                                                                                                                                                                                  return AlertDialog(
                                                                                                                                                                                    title: Text('Alert'),
                                                                                                                                                                                    content: Text('The vacancies threshold reached'),
                                                                                                                                                                                    actions: [
                                                                                                                                                                                      TextButton(
                                                                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                                                                        child: Text('Ok'),
                                                                                                                                                                                      ),
                                                                                                                                                                                    ],
                                                                                                                                                                                  );
                                                                                                                                                                                },
                                                                                                                                                                              );
                                                                                                                                                                            }
                                                                                                                                                                          },
                                                                                                                                                                        ),
                                                                                                                                                                      ),
                                                                                                                                                                      Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                                                                                                                                                                        child: FlutterFlowIconButton(
                                                                                                                                                                          borderColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                                          borderRadius: 30.0,
                                                                                                                                                                          borderWidth: 1.0,
                                                                                                                                                                          buttonSize: 40.0,
                                                                                                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                                          disabledColor: FlutterFlowTheme.of(context).red,
                                                                                                                                                                          icon: Icon(
                                                                                                                                                                            Icons.clear_rounded,
                                                                                                                                                                            color: Color(0xFFD32828),
                                                                                                                                                                            size: 24.0,
                                                                                                                                                                          ),
                                                                                                                                                                          onPressed: columnWorkersRecord.employmentStatus == '1'
                                                                                                                                                                              ? null
                                                                                                                                                                              : () async {
                                                                                                                                                                                  final workersUpdateData1 = {
                                                                                                                                                                                    'job_applied': FieldValue.arrayUnion([
                                                                                                                                                                                      getWorkerJobApplicationFirestoreData(
                                                                                                                                                                                        createWorkerJobApplicationStruct(
                                                                                                                                                                                          jobId: appliedjobsItem.jobId,
                                                                                                                                                                                          appliedOn: appliedjobsItem.appliedOn,
                                                                                                                                                                                          applicationStatus: 2,
                                                                                                                                                                                          clearUnsetFields: false,
                                                                                                                                                                                        ),
                                                                                                                                                                                        true,
                                                                                                                                                                                      )
                                                                                                                                                                                    ]),
                                                                                                                                                                                  };
                                                                                                                                                                                  await columnWorkersRecord.reference.update(workersUpdateData1);

                                                                                                                                                                                  final jobsUpdateData1 = {
                                                                                                                                                                                    'applications': FieldValue.arrayUnion([
                                                                                                                                                                                      getJobApplicationFirestoreData(
                                                                                                                                                                                        createJobApplicationStruct(
                                                                                                                                                                                          applicationStatus: 2,
                                                                                                                                                                                          workerId: appliedworkersItem.workerId,
                                                                                                                                                                                          workerName: appliedworkersItem.workerName,
                                                                                                                                                                                          gender: appliedworkersItem.gender,
                                                                                                                                                                                          area: appliedworkersItem.area,
                                                                                                                                                                                          appliedOn: appliedworkersItem.appliedOn,
                                                                                                                                                                                          clearUnsetFields: false,
                                                                                                                                                                                        ),
                                                                                                                                                                                        true,
                                                                                                                                                                                      )
                                                                                                                                                                                    ]),
                                                                                                                                                                                  };
                                                                                                                                                                                  await widget.jobdetails!.reference.update(jobsUpdateData1);

                                                                                                                                                                                  final jobsUpdateData2 = {
                                                                                                                                                                                    'applications': FieldValue.arrayRemove([
                                                                                                                                                                                      getJobApplicationFirestoreData(
                                                                                                                                                                                        createJobApplicationStruct(
                                                                                                                                                                                          workerId: appliedworkersItem.workerId,
                                                                                                                                                                                          appliedOn: appliedworkersItem.appliedOn,
                                                                                                                                                                                          applicationStatus: appliedworkersItem.applicationStatus,
                                                                                                                                                                                          workerName: appliedworkersItem.workerName,
                                                                                                                                                                                          gender: appliedworkersItem.gender,
                                                                                                                                                                                          area: appliedworkersItem.area,
                                                                                                                                                                                          clearUnsetFields: false,
                                                                                                                                                                                        ),
                                                                                                                                                                                        true,
                                                                                                                                                                                      )
                                                                                                                                                                                    ]),
                                                                                                                                                                                  };
                                                                                                                                                                                  await widget.jobdetails!.reference.update(jobsUpdateData2);

                                                                                                                                                                                  final workersUpdateData2 = {
                                                                                                                                                                                    'job_applied': FieldValue.arrayRemove([
                                                                                                                                                                                      getWorkerJobApplicationFirestoreData(
                                                                                                                                                                                        createWorkerJobApplicationStruct(
                                                                                                                                                                                          jobId: appliedjobsItem.jobId,
                                                                                                                                                                                          applicationStatus: appliedjobsItem.applicationStatus,
                                                                                                                                                                                          appliedOn: appliedjobsItem.appliedOn,
                                                                                                                                                                                          clearUnsetFields: false,
                                                                                                                                                                                        ),
                                                                                                                                                                                        true,
                                                                                                                                                                                      )
                                                                                                                                                                                    ]),
                                                                                                                                                                                  };
                                                                                                                                                                                  await columnWorkersRecord.reference.update(workersUpdateData2);
                                                                                                                                                                                },
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
                                                                                                                                              ],
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    }),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            );
                                                                                                                          },
                                                                                                                        );
                                                                                                                      }),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            height: 100.0,
                                                                                                            child: VerticalDivider(
                                                                                                              thickness: 1.0,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Container(
                                                                                                              width: 100.0,
                                                                                                              height: MediaQuery.of(context).size.height * 0.6,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFFD3EFDD),
                                                                                                              ),
                                                                                                              child: Builder(
                                                                                                                builder: (context) {
                                                                                                                  final acceptedworkers = tabBarJobsRecord!.applications!.toList().where((e) => e.applicationStatus == 1).toList();
                                                                                                                  if (acceptedworkers.isEmpty) {
                                                                                                                    return NoListWidget(
                                                                                                                      text: 'workers',
                                                                                                                    );
                                                                                                                  }
                                                                                                                  return SingleChildScrollView(
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                      children: List.generate(acceptedworkers.length, (acceptedworkersIndex) {
                                                                                                                        final acceptedworkersItem = acceptedworkers[acceptedworkersIndex];
                                                                                                                        return StreamBuilder<WorkersRecord>(
                                                                                                                          stream: WorkersRecord.getDocument(acceptedworkersItem.workerId!),
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
                                                                                                                            final columnWorkersRecord = snapshot.data!;
                                                                                                                            return Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final appliedjobitem = columnWorkersRecord.jobApplied!.toList().where((e) => e.applicationStatus == 1).toList();
                                                                                                                                return Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: List.generate(appliedjobitem.length, (appliedjobitemIndex) {
                                                                                                                                    final appliedjobitemItem = appliedjobitem[appliedjobitemIndex];
                                                                                                                                    return Visibility(
                                                                                                                                      visible: appliedjobitemItem.jobId == tabBarJobsRecord!.reference,
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                                        child: Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.31,
                                                                                                                                          height: 89.6,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                                                          ),
                                                                                                                                          child: Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Container(
                                                                                                                                                width: MediaQuery.of(context).size.width * 0.229,
                                                                                                                                                height: 92.6,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                  border: Border.all(
                                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: Column(
                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                    children: [
                                                                                                                                                      Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                                        child: Row(
                                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                          children: [
                                                                                                                                                            Text(
                                                                                                                                                              functions.firstCharUppercase(acceptedworkersItem.workerName!),
                                                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                                                                            ),
                                                                                                                                                          ],
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                      Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                                        child: Row(
                                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                                          children: [
                                                                                                                                                            FFButtonWidget(
                                                                                                                                                              onPressed: () async {
                                                                                                                                                                context.pushNamed(
                                                                                                                                                                  'Workersprofile',
                                                                                                                                                                  queryParams: {
                                                                                                                                                                    'workerdetails': serializeParam(
                                                                                                                                                                      columnWorkersRecord,
                                                                                                                                                                      ParamType.Document,
                                                                                                                                                                    ),
                                                                                                                                                                    'workers': serializeParam(
                                                                                                                                                                      columnWorkersRecord.reference,
                                                                                                                                                                      ParamType.DocumentReference,
                                                                                                                                                                    ),
                                                                                                                                                                  }.withoutNulls,
                                                                                                                                                                  extra: <String, dynamic>{
                                                                                                                                                                    'workerdetails': columnWorkersRecord,
                                                                                                                                                                  },
                                                                                                                                                                );
                                                                                                                                                              },
                                                                                                                                                              text: 'View profile',
                                                                                                                                                              options: FFButtonOptions(
                                                                                                                                                                width: 130.0,
                                                                                                                                                                height: 30.0,
                                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
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
                                                                                                                                                    ],
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            );
                                                                                                                          },
                                                                                                                        );
                                                                                                                      }),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            height: 100.0,
                                                                                                            child: VerticalDivider(
                                                                                                              thickness: 1.0,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Container(
                                                                                                              width: 100.0,
                                                                                                              height: MediaQuery.of(context).size.height * 0.6,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFFE2DFDF),
                                                                                                              ),
                                                                                                              child: Builder(
                                                                                                                builder: (context) {
                                                                                                                  final rejectedworkers = tabBarJobsRecord!.applications!.toList().where((e) => e.applicationStatus == 2).toList();
                                                                                                                  if (rejectedworkers.isEmpty) {
                                                                                                                    return NoListWidget(
                                                                                                                      text: 'workers',
                                                                                                                    );
                                                                                                                  }
                                                                                                                  return SingleChildScrollView(
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                      children: List.generate(rejectedworkers.length, (rejectedworkersIndex) {
                                                                                                                        final rejectedworkersItem = rejectedworkers[rejectedworkersIndex];
                                                                                                                        return StreamBuilder<WorkersRecord>(
                                                                                                                          stream: WorkersRecord.getDocument(rejectedworkersItem.workerId!),
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
                                                                                                                            final columnWorkersRecord = snapshot.data!;
                                                                                                                            return Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final appliedjobitems = columnWorkersRecord.jobApplied!.toList().where((e) => e.applicationStatus == 2).toList();
                                                                                                                                return Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: List.generate(appliedjobitems.length, (appliedjobitemsIndex) {
                                                                                                                                    final appliedjobitemsItem = appliedjobitems[appliedjobitemsIndex];
                                                                                                                                    return Visibility(
                                                                                                                                      visible: appliedjobitemsItem.jobId == widget.jobdetails!.reference,
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                                        child: Container(
                                                                                                                                          width: MediaQuery.of(context).size.width * 0.31,
                                                                                                                                          height: 89.6,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                                                          ),
                                                                                                                                          child: Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              Container(
                                                                                                                                                width: MediaQuery.of(context).size.width * 0.229,
                                                                                                                                                height: 92.6,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                                                                                  border: Border.all(
                                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                                  child: Column(
                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                    children: [
                                                                                                                                                      Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                                        child: Row(
                                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                          children: [
                                                                                                                                                            Padding(
                                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                                              child: Text(
                                                                                                                                                                functions.firstCharUppercase(rejectedworkersItem.workerName!),
                                                                                                                                                                style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                                                                              ),
                                                                                                                                                            ),
                                                                                                                                                          ],
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                      Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                                        child: Row(
                                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                                          children: [
                                                                                                                                                            FFButtonWidget(
                                                                                                                                                              onPressed: () async {
                                                                                                                                                                context.pushNamed(
                                                                                                                                                                  'Workersprofile',
                                                                                                                                                                  queryParams: {
                                                                                                                                                                    'workerdetails': serializeParam(
                                                                                                                                                                      columnWorkersRecord,
                                                                                                                                                                      ParamType.Document,
                                                                                                                                                                    ),
                                                                                                                                                                    'workers': serializeParam(
                                                                                                                                                                      columnWorkersRecord.reference,
                                                                                                                                                                      ParamType.DocumentReference,
                                                                                                                                                                    ),
                                                                                                                                                                  }.withoutNulls,
                                                                                                                                                                  extra: <String, dynamic>{
                                                                                                                                                                    'workerdetails': columnWorkersRecord,
                                                                                                                                                                  },
                                                                                                                                                                );
                                                                                                                                                              },
                                                                                                                                                              text: 'View profile',
                                                                                                                                                              options: FFButtonOptions(
                                                                                                                                                                width: 130.0,
                                                                                                                                                                height: 30.0,
                                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                                      fontFamily: 'Poppins',
                                                                                                                                                                      color: FlutterFlowTheme.of(context).primary,
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
                                                                                                                                                    ],
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  }),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            );
                                                                                                                          },
                                                                                                                        );
                                                                                                                      }),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
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
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
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
                                                                                                                fontWeight: FontWeight.w500,
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
                                                                                                                    'SALARY (₹)',
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
                                                                                                                    'AVAILABILITY',
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
                                                                                                              height: 240.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                                    Container(
                                                                                                                      width: MediaQuery.of(context).size.width * 0.65,
                                                                                                                      height: 100.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          widget.jobdetails!.jobDescription!.maybeHandleOverflow(
                                                                                                                            maxChars: 5000,
                                                                                                                            replacement: '…',
                                                                                                                          ),
                                                                                                                          textAlign: TextAlign.justify,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 18.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                                lineHeight: 3.0,
                                                                                                                              ),
                                                                                                                        ),
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
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        widget.jobdetails!.numberOfVacancies?.toString(),
                                                                                                                        'Not Available',
                                                                                                                      ),
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
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      '${functions.indiannumbersystem(widget.jobdetails!.minSalary)} - ${functions.indiannumbersystem(widget.jobdetails!.maxSalary)}',
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
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      '${dateTimeFormat('yMd', widget.jobdetails!.startDate)} - ${dateTimeFormat('yMd', widget.jobdetails!.endDate)}',
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
                                                                                                              height: 240.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
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
                                                                                                                      Text(
                                                                                                                        'Food',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          tabBarJobsRecord!.food == 'available' ? 'available' : 'unavailable',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 18.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      FlutterFlowIconButton(
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
                                                                                                                      Text(
                                                                                                                        'Stay',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          tabBarJobsRecord!.lodging == 'available' ? 'available' : 'unavailable',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 18.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
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
                                                                                                                      Text(
                                                                                                                        'Medical',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          tabBarJobsRecord!.medical == 'available' ? 'available' : 'unavailable',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 18.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      FlutterFlowIconButton(
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
                                                                                                                      Text(
                                                                                                                        'Transportation',
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Poppins',
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          tabBarJobsRecord!.transportation == 'available' ? 'available' : 'unavailable',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 18.0,
                                                                                                                                fontWeight: FontWeight.normal,
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
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                          final columnOrganisationsRecord =
                                                                              snapshot.data!;
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Row(
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
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
