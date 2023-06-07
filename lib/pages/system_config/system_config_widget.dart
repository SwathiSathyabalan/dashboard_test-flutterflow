import 'package:jansakti_admin/components/category/category_widget.dart';
import 'package:jansakti_admin/components/facilities/facilities_widget.dart';
import 'package:jansakti_admin/components/newskill/newskill_widget.dart';
import 'package:jansakti_admin/components/subcategory/subcategory_widget.dart';

import '../../backend/schema/structs/job_categ_struct.dart';
import '../../backend/schema/system_config_record.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottombar/bottombar_widget.dart';
import '/components/category_widget.dart';

import '/components/headingbar/headingbar_widget.dart';

import '/components/no_list/no_list_widget.dart';

import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'system_config_model.dart';
export 'system_config_model.dart';

class SystemconfigWidget extends StatefulWidget {
  const SystemconfigWidget({Key? key}) : super(key: key);

  @override
  _SystemconfigWidgetState createState() => _SystemconfigWidgetState();
}

class _SystemconfigWidgetState extends State<SystemconfigWidget> {
  late SystemconfigModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SystemconfigModel());

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

    return StreamBuilder<List<SystemConfigRecord>>(
      stream: querySystemConfigRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: SpinKitHourGlass(
                  color: FlutterFlowTheme.of(context).accent1Old,
                  size: 80,
                ),
              ),
            ),
          );
        }
        List<SystemConfigRecord> systemconfigSystemConfigRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final systemconfigSystemConfigRecord =
            systemconfigSystemConfigRecordList.isNotEmpty
                ? systemconfigSystemConfigRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                top: true,
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
                          colour3: Color(0xFFFFFBF4),
                          colour4: FlutterFlowTheme.of(context).tertiary,
                          colour5: FlutterFlowTheme.of(context).tertiary,
                          colour6: FlutterFlowTheme.of(context).tertiary,
                          colour7: FlutterFlowTheme.of(context).tertiary,
                          color8: Color(0xFFFFD058),
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
                                      text: 'SYSTEM CONFIGURATION',
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30, 0, 20, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                                Alignment(0, 0),
                                                            child: TabBar(
                                                              labelColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              unselectedLabelColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                              indicatorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              tabs: [
                                                                Tab(
                                                                  text:
                                                                      'JOB CATEGORIES',
                                                                ),
                                                                Tab(
                                                                  text:
                                                                      'SKILLS',
                                                                ),
                                                                Tab(
                                                                  text:
                                                                      'FACILITIES',
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'LIST OF CATEGORIES',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '(0)',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await showAlignedDialog(
                                                                                    context: context,
                                                                                    isGlobal: true,
                                                                                    avoidOverflow: false,
                                                                                    targetAnchor: AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                    followerAnchor: AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                    builder: (dialogContext) {
                                                                                      return Material(
                                                                                        color: Colors.transparent,
                                                                                        child: GestureDetector(
                                                                                          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                          child: Container(
                                                                                            height: 250,
                                                                                            width: 500,
                                                                                            child: CategoryWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                text: '+ ADD NEW',
                                                                                options: FFButtonOptions(
                                                                                  width: 150,
                                                                                  height: 50,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  elevation: 2,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    StreamBuilder<List<SystemConfigRecord>>(
                                                                                      stream: querySystemConfigRecord(),
                                                                                      builder: (context, snapshot) {
                                                                                        // Customize what your widget looks like when it's loading.
                                                                                        if (!snapshot.hasData) {
                                                                                          return Center(
                                                                                            child: SizedBox(
                                                                                              width: 80,
                                                                                              height: 80,
                                                                                              child: SpinKitHourGlass(
                                                                                                color: FlutterFlowTheme.of(context).accent1Old,
                                                                                                size: 80,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        List<SystemConfigRecord> listViewSystemConfigRecordList = snapshot.data!;
                                                                                        return ListView.builder(
                                                                                          padding: EdgeInsets.zero,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: listViewSystemConfigRecordList.length,
                                                                                          itemBuilder: (context, listViewIndex) {
                                                                                            final listViewSystemConfigRecord = listViewSystemConfigRecordList[listViewIndex];
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 10),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  setState(() {
                                                                                                    FFAppState().Categoryclick = FFAppState().Categoryclick;
                                                                                                  });
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 100,
                                                                                                  height: 100,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).accent2,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          children: [
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                              child: Image.network(
                                                                                                                'https://picsum.photos/seed/301/600',
                                                                                                                width: 80,
                                                                                                                height: 200,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'GARMENTS',
                                                                                                                    style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    '0 SUB CATEGORIES',
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                                                                                              child: Container(
                                                                                                                width: 60,
                                                                                                                height: 50,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: AlignmentDirectional(0, 0),
                                                                                                                  child: FaIcon(
                                                                                                                    FontAwesomeIcons.pen,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 20,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Container(
                                                                                                              width: 60,
                                                                                                              height: 50,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                borderRadius: BorderRadius.circular(12),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  final systemConfigUpdateData = {
                                                                                                                    'jobs_category': FieldValue.delete(),
                                                                                                                  };
                                                                                                                  await systemconfigSystemConfigRecord!.reference.update(systemConfigUpdateData);
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.delete_outline_sharp,
                                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                                  size: 24,
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
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            VerticalDivider(
                                                                              thickness: 1,
                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                            ),
                                                                            if (FFAppState().Categoryclick != null &&
                                                                                FFAppState().Categoryclick != '')
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            'GARMENTS',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Stack(
                                                                                              children: [
                                                                                                if (FFAppState().categoryimage == null || FFAppState().categoryimage == '')
                                                                                                  Container(
                                                                                                    width: 180,
                                                                                                    height: 170,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(12),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Icon(
                                                                                                      Icons.category_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).accent2,
                                                                                                      size: 44,
                                                                                                    ),
                                                                                                  ),
                                                                                                if (FFAppState().categoryimage != null && FFAppState().categoryimage != '')
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                    child: Image.network(
                                                                                                      FFAppState().categoryimage,
                                                                                                      width: 180,
                                                                                                      height: 170,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                            Stack(
                                                                                              children: [
                                                                                                if (FFAppState().categoryimage != null && FFAppState().categoryimage != '')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                          child: Container(
                                                                                                            width: 200,
                                                                                                            height: 50,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'EDIT IMAGE',
                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 200,
                                                                                                          height: 50,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'REMOVE IMAGE',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                if (FFAppState().categoryimage == null || FFAppState().categoryimage == '')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                                                context: context,
                                                                                                                allowPhoto: true,
                                                                                                              );
                                                                                                              if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                                setState(() => _model.isDataUploading = true);
                                                                                                                var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                                                var downloadUrls = <String>[];
                                                                                                                try {
                                                                                                                  selectedUploadedFiles = selectedMedia
                                                                                                                      .map((m) => FFUploadedFile(
                                                                                                                            name: m.storagePath.split('/').last,
                                                                                                                            bytes: m.bytes,
                                                                                                                            height: m.dimensions?.height,
                                                                                                                            width: m.dimensions?.width,
                                                                                                                            blurHash: m.blurHash,
                                                                                                                          ))
                                                                                                                      .toList();

                                                                                                                  downloadUrls = (await Future.wait(
                                                                                                                    selectedMedia.map(
                                                                                                                      (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                                                    ),
                                                                                                                  ))
                                                                                                                      .where((u) => u != null)
                                                                                                                      .map((u) => u!)
                                                                                                                      .toList();
                                                                                                                } finally {
                                                                                                                  _model.isDataUploading = false;
                                                                                                                }
                                                                                                                if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                                  setState(() {
                                                                                                                    _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                                                                                    _model.uploadedFileUrl = downloadUrls.first;
                                                                                                                  });
                                                                                                                } else {
                                                                                                                  setState(() {});
                                                                                                                  return;
                                                                                                                }
                                                                                                              }

                                                                                                              setState(() {
                                                                                                                FFAppState().categoryimage = _model.uploadedFileUrl;
                                                                                                              });

                                                                                                            },
                                                                                                            child: Container(
                                                                                                              width: 200,
                                                                                                              height: 50,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'UPLOAD IMAGE',
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
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
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'SUB CATEGORIES',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                              child: Text(
                                                                                                '(0)',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                            ),
                                                                                            Builder(
                                                                                              builder: (context) => Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await showAlignedDialog(
                                                                                                      context: context,
                                                                                                      isGlobal: true,
                                                                                                      avoidOverflow: false,
                                                                                                      targetAnchor: AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                                      followerAnchor: AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                                      builder: (dialogContext) {
                                                                                                        return Material(
                                                                                                          color: Colors.transparent,
                                                                                                          child: GestureDetector(
                                                                                                            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                            child: Container(
                                                                                                              height: 250,
                                                                                                              width: 500,
                                                                                                              child: SubcategoryWidget(),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  text: '+ ADD NEW',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 150,
                                                                                                    height: 50,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 18,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                    elevation: 2,
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      width: 1,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Divider(
                                                                                        thickness: 1,
                                                                                        color: FlutterFlowTheme.of(context).accent3,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                StreamBuilder<List<SystemConfigRecord>>(
                                                                                                  stream: querySystemConfigRecord(
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 80,
                                                                                                          height: 80,
                                                                                                          child: SpinKitHourGlass(
                                                                                                            color: FlutterFlowTheme.of(context).accent1Old,
                                                                                                            size: 80,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<SystemConfigRecord> listViewSystemConfigRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final listViewSystemConfigRecord = listViewSystemConfigRecordList.isNotEmpty ? listViewSystemConfigRecordList.first : null;
                                                                                                    return ListView(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      shrinkWrap: true,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 10),
                                                                                                          child: Container(
                                                                                                            width: 100,
                                                                                                            height: 70,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(12),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        'TAILOR',
                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                                                                                                        child: Container(
                                                                                                                          width: 60,
                                                                                                                          height: 50,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                                                            border: Border.all(
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          child: Align(
                                                                                                                            alignment: AlignmentDirectional(0, 0),
                                                                                                                            child: FaIcon(
                                                                                                                              FontAwesomeIcons.pen,
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              size: 20,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Container(
                                                                                                                        width: 60,
                                                                                                                        height: 50,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(12),
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {},
                                                                                                                          child: Icon(
                                                                                                                            Icons.delete_outline_sharp,
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                            size: 24,
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
                                                                                                    );
                                                                                                  },
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
                                                                            if (FFAppState().Categoryclick == null ||
                                                                                FFAppState().Categoryclick == '')
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [],
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'LIST OF SKILLS',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '(0)',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await showAlignedDialog(
                                                                                    context: context,
                                                                                    isGlobal: true,
                                                                                    avoidOverflow: false,
                                                                                    targetAnchor: AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                    followerAnchor: AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                    builder: (dialogContext) {
                                                                                      return Material(
                                                                                        color: Colors.transparent,
                                                                                        child: GestureDetector(
                                                                                          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                          child: Container(
                                                                                            height: 250,
                                                                                            width: 500,
                                                                                            child: NewskillWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                text: '+ ADD SKILL',
                                                                                options: FFButtonOptions(
                                                                                  width: 150,
                                                                                  height: 50,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  elevation: 2,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  StreamBuilder<List<SystemConfigRecord>>(
                                                                                    stream: querySystemConfigRecord(),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 80,
                                                                                            height: 80,
                                                                                            child: SpinKitHourGlass(
                                                                                              color: FlutterFlowTheme.of(context).accent1Old,
                                                                                              size: 80,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      List<SystemConfigRecord> listViewSystemConfigRecordList = snapshot.data!;
                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: listViewSystemConfigRecordList.length,
                                                                                        itemBuilder: (context, listViewIndex) {
                                                                                          final listViewSystemConfigRecord = listViewSystemConfigRecordList[listViewIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 10),
                                                                                            child: Container(
                                                                                              width: 100,
                                                                                              height: 80,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(12),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 60,
                                                                                                          height: 100,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(0, -0.05),
                                                                                                            child: Icon(
                                                                                                              Icons.handyman_outlined,
                                                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                                                              size: 34,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'GARMENTS',
                                                                                                                style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                                                                                          child: Container(
                                                                                                            width: 60,
                                                                                                            height: 50,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(12),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0, 0),
                                                                                                              child: FaIcon(
                                                                                                                FontAwesomeIcons.pen,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 20,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 60,
                                                                                                          height: 50,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(12),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Icon(
                                                                                                            Icons.delete_outline_sharp,
                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                            size: 24,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
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
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'LIST OF FACILITIES',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '(0)',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await showAlignedDialog(
                                                                                    context: context,
                                                                                    isGlobal: true,
                                                                                    avoidOverflow: false,
                                                                                    targetAnchor: AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                    followerAnchor: AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                    builder: (dialogContext) {
                                                                                      return Material(
                                                                                        color: Colors.transparent,
                                                                                        child: GestureDetector(
                                                                                          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                          child: Container(
                                                                                            height: 250,
                                                                                            width: 500,
                                                                                            child: FacilitiesWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                text: '+ ADD FACILITIES',
                                                                                options: FFButtonOptions(
                                                                                  width: 180,
                                                                                  height: 50,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  elevation: 2,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  StreamBuilder<List<SystemConfigRecord>>(
                                                                                    stream: querySystemConfigRecord(),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 80,
                                                                                            height: 80,
                                                                                            child: SpinKitHourGlass(
                                                                                              color: FlutterFlowTheme.of(context).accent1Old,
                                                                                              size: 80,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      List<SystemConfigRecord> listViewSystemConfigRecordList = snapshot.data!;
                                                                                      if (listViewSystemConfigRecordList.isEmpty) {
                                                                                        return NoListWidget(
                                                                                          text: 'categories',
                                                                                        );
                                                                                      }
                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: listViewSystemConfigRecordList.length,
                                                                                        itemBuilder: (context, listViewIndex) {
                                                                                          final listViewSystemConfigRecord = listViewSystemConfigRecordList[listViewIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 10),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                setState(() {
                                                                                                  FFAppState().facilityclick = FFAppState().facilityclick;
                                                                                                });
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 100,
                                                                                                height: 80,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).accent2,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                            child: Image.network(
                                                                                                              'https://picsum.photos/seed/301/600',
                                                                                                              width: 80,
                                                                                                              height: 200,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'FOOD',
                                                                                                                  style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 60,
                                                                                                            height: 50,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(12),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Icon(
                                                                                                              Icons.delete_outline_sharp,
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              size: 24,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
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
                                                                            VerticalDivider(
                                                                              thickness: 1,
                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                            ),
                                                                            if (FFAppState().facilityclick != null &&
                                                                                FFAppState().facilityclick != '')
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            'GARMENTS',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                              child: Image.network(
                                                                                                'https://picsum.photos/seed/42/600',
                                                                                                width: 180,
                                                                                                height: 170,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                    child: Container(
                                                                                                      width: 200,
                                                                                                      height: 50,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'EDIT IMAGE',
                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 200,
                                                                                                    height: 50,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'REMOVE IMAGE',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).error,
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
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'ENTER FACILITIES NAME',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 500,
                                                                                            height: 50,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).accent3,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'ACCOMODATION',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
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
                                                                            if (FFAppState().facilityclick == null ||
                                                                                FFAppState().facilityclick == '')
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [],
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
