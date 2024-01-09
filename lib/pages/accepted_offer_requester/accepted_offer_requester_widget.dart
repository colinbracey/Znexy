import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'accepted_offer_requester_model.dart';
export 'accepted_offer_requester_model.dart';

class AcceptedOfferRequesterWidget extends StatefulWidget {
  const AcceptedOfferRequesterWidget({
    super.key,
    required this.thisOffertDocRef,
  });

  final DocumentReference? thisOffertDocRef;

  @override
  _AcceptedOfferRequesterWidgetState createState() =>
      _AcceptedOfferRequesterWidgetState();
}

class _AcceptedOfferRequesterWidgetState
    extends State<AcceptedOfferRequesterWidget> with TickerProviderStateMixin {
  late AcceptedOfferRequesterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.5, 1.5),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 1000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 900.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.5, 1.5),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 2000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 900.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.5, 1.5),
        ),
      ],
    ),
    'containerOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 2000.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 3000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation11': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 900.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.5, 1.5),
        ),
      ],
    ),
    'containerOnPageLoadAnimation12': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 3000.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation13': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeIn,
          delay: 4000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation14': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 4000.ms,
          duration: 900.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.5, 1.5),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceptedOfferRequesterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<OfferRecord>(
      stream: OfferRecord.getDocument(widget.thisOffertDocRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFF609F0),
                  ),
                ),
              ),
            ),
          );
        }
        final acceptedOfferRequesterOfferRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: const Color(0xFF142328),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Accepted Offer',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(
                    acceptedOfferRequesterOfferRecord.userId!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFF609F0),
                          ),
                        ),
                      ),
                    );
                  }
                  final columnUsersRecord = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<TrackOrderRecord>>(
                        stream: queryTrackOrderRecord(
                          queryBuilder: (trackOrderRecord) =>
                              trackOrderRecord.where(
                            'OfferId',
                            isEqualTo: widget.thisOffertDocRef,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFF609F0),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<TrackOrderRecord> columnTrackOrderRecordList =
                              snapshot.data!;
                          final columnTrackOrderRecord =
                              columnTrackOrderRecordList.isNotEmpty
                                  ? columnTrackOrderRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 250.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: custom_widgets.GMapWidget2(
                                    width: double.infinity,
                                    height: double.infinity,
                                    trackOrderRef:
                                        columnTrackOrderRecord!.reference,
                                    trackOrderDoc: columnTrackOrderRecord,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 12.0, 12.0),
                                child: StreamBuilder<RequestRecord>(
                                  stream: RequestRecord.getDocument(
                                      acceptedOfferRequesterOfferRecord
                                          .requestId!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Color(0xFFF609F0),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final rowRequestRecord = snapshot.data!;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            rowRequestRecord.shortDescription,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  fontSize: 20.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                acceptedOfferRequesterOfferRecord
                                                    .value,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: '\$',
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF585858),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  if (columnTrackOrderRecord
                                                          .accepted ??
                                                      true)
                                                    Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFF00AA07),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation1']!),
                                                  if (columnTrackOrderRecord
                                                          .accepted ??
                                                      true)
                                                    Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0x3200AA07),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation2']!),
                                                ],
                                              ),
                                              ClipRRect(
                                                child: Container(
                                                  width: 2.0,
                                                  height: 30.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFBDBDBD),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      if (columnTrackOrderRecord
                                                              .accepted ??
                                                          true)
                                                        Container(
                                                          width: 2.0,
                                                          height: 30.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFF00AA07),
                                                          ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation3']!),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .checkCircle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Request Accepted',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (columnTrackOrderRecord
                                                            .acceptedDate !=
                                                        null)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  columnTrackOrderRecord
                                                                      .acceptedDate),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: const Color(
                                                                      0xFF585858),
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFF585858),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                if (columnTrackOrderRecord
                                                        .headingYourWay ??
                                                    true)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF00AA07),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation4']!),
                                                if (columnTrackOrderRecord
                                                        .headingYourWay ??
                                                    true)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0x3200AA07),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation5']!),
                                              ],
                                            ),
                                            ClipRRect(
                                              child: Container(
                                                width: 2.0,
                                                height: 30.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFBDBDBD),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (columnTrackOrderRecord
                                                            .headingYourWay ??
                                                        true)
                                                      Container(
                                                        width: 2.0,
                                                        height: 30.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFF00AA07),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation6']!),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons.car,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${columnUsersRecord.displayName} is heading to you',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (columnTrackOrderRecord
                                                            .headingYourWayDate !=
                                                        null)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  columnTrackOrderRecord
                                                                      .headingYourWayDate),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: const Color(
                                                                      0xFF585858),
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFF585858),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                if (columnTrackOrderRecord
                                                        .arrived ??
                                                    true)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF00AA07),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation7']!),
                                                if (columnTrackOrderRecord
                                                        .arrived ??
                                                    true)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0x3200AA07),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation8']!),
                                              ],
                                            ),
                                            ClipRRect(
                                              child: Container(
                                                width: 2.0,
                                                height: 30.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFBDBDBD),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (columnTrackOrderRecord
                                                            .arrived ??
                                                        true)
                                                      Container(
                                                        width: 2.0,
                                                        height: 30.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFF00AA07),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation9']!),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .flagCheckered,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Arrived',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (columnTrackOrderRecord
                                                            .arrivedDate !=
                                                        null)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  columnTrackOrderRecord
                                                                      .arrivedDate),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: const Color(
                                                                      0xFF585858),
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFF585858),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                if (columnTrackOrderRecord
                                                        .workUnderWay ??
                                                    true)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF00AA07),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation10']!),
                                                if (columnTrackOrderRecord
                                                        .workUnderWay ??
                                                    true)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0x3200AA07),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation11']!),
                                              ],
                                            ),
                                            ClipRRect(
                                              child: Container(
                                                width: 2.0,
                                                height: 30.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFBDBDBD),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (columnTrackOrderRecord
                                                            .workUnderWay ??
                                                        true)
                                                      Container(
                                                        width: 2.0,
                                                        height: 30.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFF00AA07),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation12']!),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .playCircle,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Work Started',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (columnTrackOrderRecord
                                                            .workUnderWayDate !=
                                                        null)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  columnTrackOrderRecord
                                                                      .workUnderWayDate),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: const Color(
                                                                      0xFF585858),
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFF585858),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                if (columnTrackOrderRecord
                                                        .workCompleted ??
                                                    true)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF00AA07),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation13']!),
                                                if (columnTrackOrderRecord
                                                        .workCompleted ??
                                                    true)
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0x3200AA07),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation14']!),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons.grin,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Work Complete',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (columnTrackOrderRecord
                                                            .workCompletedDate !=
                                                        null)
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  columnTrackOrderRecord
                                                                      .workCompletedDate),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: const Color(
                                                                      0xFF585858),
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 25.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(null),
                                      options: const [
                                        'Request Accepted',
                                        'Heading to you',
                                        'Arrived',
                                        'Work Started',
                                        'Work Complete'
                                      ],
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue = val),
                                      width: 200.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Update Status',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        _model.updateTrackingResponse =
                                            await actions.updateTrackingStatus(
                                          valueOrDefault<String>(
                                            columnTrackOrderRecord
                                                .reference.id,
                                            '0',
                                          ),
                                          _model.dropDownValue!,
                                        );

                                        setState(() {});
                                      },
                                      text: 'Update',
                                      icon: const Icon(
                                        Icons.update,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 120.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF142328),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'ChatPage',
                                          queryParameters: {
                                            'chatUser': serializeParam(
                                              columnUsersRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatUser': columnUsersRecord,
                                          },
                                        );
                                      },
                                      text: 'Message ',
                                      icon: const Icon(
                                        Icons.message,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 120.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF142328),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Video Chat ',
                                      icon: const Icon(
                                        Icons.video_chat,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 120.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFF609F0),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Cancel',
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 120.0,
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFCC0E3A),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
