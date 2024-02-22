import '/backend/backend.dart';
import '/components/congratulations_pop/congratulations_pop_widget.dart';
import '/components/offerer_profile_drawer/offerer_profile_drawer_widget.dart';
import '/components/offerer_set_completed/offerer_set_completed_widget.dart';
import '/components/requester_set_completed/requester_set_completed_widget.dart';
import '/components/user_rating/user_rating_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'accepted_offer_offerer_model.dart';
export 'accepted_offer_offerer_model.dart';

class AcceptedOfferOffererWidget extends StatefulWidget {
  const AcceptedOfferOffererWidget({
    super.key,
    required this.thisOffertDocRef,
  });

  final DocumentReference? thisOffertDocRef;

  @override
  State<AcceptedOfferOffererWidget> createState() =>
      _AcceptedOfferOffererWidgetState();
}

class _AcceptedOfferOffererWidgetState extends State<AcceptedOfferOffererWidget>
    with TickerProviderStateMixin {
  late AcceptedOfferOffererModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

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
    'containerOnPageLoadAnimation3': AnimationInfo(
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
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(-1000.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation15': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(1000.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(-1000.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation16': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(1000.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(-1000.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation17': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(1000.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(-1000.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation18': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(1000.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceptedOfferOffererModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: const Center(
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
        final acceptedOfferOffererOfferRecord = snapshot.data!;
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
                  context.safePop();
                },
              ),
              title: Text(
                'Accepted Offer offer',
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
                    acceptedOfferOffererOfferRecord.userId!),
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
                      Flexible(
                        child: StreamBuilder<RequestRecord>(
                          stream: RequestRecord.getDocument(
                              acceptedOfferOffererOfferRecord.requestId!),
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
                            final columnRequestRecord = snapshot.data!;
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Color(0xFFF609F0),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<TrackOrderRecord>
                                        columnTrackOrderRecordList =
                                        snapshot.data!;
                                    final columnTrackOrderRecord =
                                        columnTrackOrderRecordList.isNotEmpty
                                            ? columnTrackOrderRecordList.first
                                            : null;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions.displayInitialMap(
                                            columnTrackOrderRecord!,
                                            acceptedOfferOffererOfferRecord
                                                .congratulationsShown,
                                            currentUserLocationValue,
                                            columnTrackOrderRecord.source))
                                          Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.35,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: custom_widgets.GMap(
                                                width: double.infinity,
                                                height: double.infinity,
                                                trackOrderRef:
                                                    columnTrackOrderRecord.reference.id,
                                                trackOrderDoc:
                                                    columnTrackOrderRecord,
                                              ),
                                            ),
                                          ),
                                        if (functions.displayTrackingMap(
                                            columnTrackOrderRecord,
                                            acceptedOfferOffererOfferRecord
                                                .congratulationsShown,
                                            currentUserLocationValue,
                                            columnTrackOrderRecord.source))
                                          Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.35,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: custom_widgets.GMapWidget2(
                                                width: double.infinity,
                                                height: double.infinity,
                                                trackOrderRef:
                                                    columnTrackOrderRecord.reference.id,
                                                trackOrderDoc:
                                                    columnTrackOrderRecord,
                                              ),
                                            ),
                                          ),
                                        if (functions.displayInitialMap(
                                                columnTrackOrderRecord,
                                                acceptedOfferOffererOfferRecord
                                                    .congratulationsShown,
                                                columnTrackOrderRecord.source,
                                                columnTrackOrderRecord
                                                    .destination) ||
                                            functions.displayTrackingMap(
                                                columnTrackOrderRecord,
                                                acceptedOfferOffererOfferRecord
                                                    .congratulationsShown,
                                                currentUserLocationValue,
                                                columnTrackOrderRecord.source))
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 5.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    'Arriving in ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 10.0,
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 170.0,
                                                    height: 40.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF142328),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Time Left: ${columnTrackOrderRecord.timeLeft}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Distance Left: ${columnTrackOrderRecord.distanceLeft}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontSize: 12.0,
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 5.0, 10.0, 0.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                columnRequestRecord.userId!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0xFFF609F0),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerUsersRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              OffererProfileDrawerWidget(
                                                            userDoc:
                                                                containerUsersRecord,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 8.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0xFF585858),
                                                        width: 0.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        4.0,
                                                                        10.0,
                                                                        4.0),
                                                            child:
                                                                AnimatedContainer(
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      150),
                                                              curve: Curves
                                                                  .easeInOut,
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFF609F0),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child:
                                                                    Container(
                                                                  width: 120.0,
                                                                  height: 120.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    containerUsersRecord
                                                                        .photoUrl,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          containerUsersRecord
                                                              .displayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  '${valueOrDefault<String>(
                                                                    containerUsersRecord
                                                                        .numberOfReviews
                                                                        .toString(),
                                                                    '0',
                                                                  )} Review(s)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .userRatingModel,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      UserRatingWidget(
                                                                    userRating:
                                                                        containerUsersRecord
                                                                            .averageRating,
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
                                            },
                                          ),
                                        ),
                                        if (acceptedOfferOffererOfferRecord
                                            .congratulationsShown)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 12.0, 12.0),
                                            child: StreamBuilder<RequestRecord>(
                                              stream: RequestRecord.getDocument(
                                                  acceptedOfferOffererOfferRecord
                                                      .requestId!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Color(0xFFF609F0),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final rowRequestRecord =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        rowRequestRecord
                                                            .shortDescription,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Comfortaa',
                                                              fontSize: 20.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          formatNumber(
                                                            acceptedOfferOffererOfferRecord
                                                                .value,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: '',
                                                            format: '0.00',
                                                            locale: '',
                                                          ),
                                                          '0',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              fontSize: 25.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        if (acceptedOfferOffererOfferRecord
                                            .congratulationsShown)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                width: 12.0,
                                                                height: 12.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF585858),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                              ),
                                                              if (columnTrackOrderRecord
                                                                      .accepted ??
                                                                  true)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xFF00AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation1']!),
                                                            ],
                                                          ),
                                                          ClipRRect(
                                                            child: Container(
                                                              width: 2.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFBDBDBD),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  if (columnTrackOrderRecord
                                                                          .accepted ??
                                                                      true)
                                                                    Container(
                                                                      width:
                                                                          2.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Color(
                                                                            0xFF00AA07),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            columnTrackOrderRecord.accepted ??
                                                                                true,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              12.0,
                                                                          height:
                                                                              12.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x3200AA07),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation2']!),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                width: 12.0,
                                                                height: 12.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF585858),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              if (columnTrackOrderRecord
                                                                      .headingYourWay ??
                                                                  true)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xFF00AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation4']!),
                                                              if (columnTrackOrderRecord
                                                                      .headingYourWay ??
                                                                  true)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0x3200AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation5']!),
                                                            ],
                                                          ),
                                                          ClipRRect(
                                                            child: Container(
                                                              width: 2.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFBDBDBD),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  if (columnTrackOrderRecord
                                                                          .headingYourWay ??
                                                                      true)
                                                                    Container(
                                                                      width:
                                                                          2.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Color(
                                                                            0xFF00AA07),
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
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                width: 12.0,
                                                                height: 12.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF585858),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              if (columnTrackOrderRecord
                                                                      .arrived ??
                                                                  true)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xFF00AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation7']!),
                                                              if (columnTrackOrderRecord
                                                                      .arrived ??
                                                                  true)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0x3200AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation8']!),
                                                            ],
                                                          ),
                                                          ClipRRect(
                                                            child: Container(
                                                              width: 2.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFBDBDBD),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  if (columnTrackOrderRecord
                                                                          .arrived ??
                                                                      true)
                                                                    Container(
                                                                      width:
                                                                          2.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Color(
                                                                            0xFF00AA07),
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
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                width: 12.0,
                                                                height: 12.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF585858),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              if (columnTrackOrderRecord
                                                                      .workUnderWay ??
                                                                  true)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xFF00AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation10']!),
                                                              if (columnTrackOrderRecord
                                                                      .workUnderWay ??
                                                                  true)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0x3200AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation11']!),
                                                            ],
                                                          ),
                                                          ClipRRect(
                                                            child: Container(
                                                              width: 2.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFBDBDBD),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  if (columnTrackOrderRecord
                                                                          .workUnderWay ??
                                                                      true)
                                                                    Container(
                                                                      width:
                                                                          2.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Color(
                                                                            0xFF00AA07),
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
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Container(
                                                                width: 12.0,
                                                                height: 12.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFF585858),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              if (columnTrackOrderRecord.workCompletedRequester ||
                                                                  columnTrackOrderRecord.workCompletedOfferer)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xFF00AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation13']!),
                                                              if (columnTrackOrderRecord.workCompletedRequester ||
                                                                  columnTrackOrderRecord.workCompletedOfferer)
                                                                Container(
                                                                  width: 12.0,
                                                                  height: 12.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0x3200AA07),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation14']!),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .checkCircle,
                                                                color: columnTrackOrderRecord.accepted
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .success
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        color: columnTrackOrderRecord.accepted
                                                                            ? FlutterFlowTheme.of(context).success
                                                                            : FlutterFlowTheme.of(context).primaryText,
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
                                                                          1.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                          'relative',
                                                                          columnTrackOrderRecord
                                                                              .acceptedDate),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Urbanist',
                                                                          color:
                                                                              const Color(0xFF585858),
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      13.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .car,
                                                                  color: columnTrackOrderRecord.headingYourWay
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .success
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${columnUsersRecord.displayName} is heading to you',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Urbanist',
                                                                          color: columnTrackOrderRecord.headingYourWay
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).primaryText,
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
                                                                            1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                            'relative',
                                                                            columnTrackOrderRecord.headingYourWayDate),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                const Color(0xFF585858),
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      13.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .flagCheckered,
                                                                color: columnTrackOrderRecord.arrived
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .success
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Arrived',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Urbanist',
                                                                          color: columnTrackOrderRecord.arrived
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).primaryText,
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
                                                                            1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                            'relative',
                                                                            columnTrackOrderRecord.arrivedDate),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                const Color(0xFF585858),
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      13.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .playCircle,
                                                                color: columnTrackOrderRecord.workUnderWay
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .success
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Work Started',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Urbanist',
                                                                          color: columnTrackOrderRecord.workUnderWay
                                                                              ? FlutterFlowTheme.of(context).success
                                                                              : FlutterFlowTheme.of(context).primaryText,
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
                                                                            1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                            'relative',
                                                                            columnTrackOrderRecord.workUnderWayDate),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                const Color(0xFF585858),
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      13.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .grin,
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  functions.workCompletedColor(
                                                                      columnTrackOrderRecord
                                                                          .workCompletedOfferer,
                                                                      columnTrackOrderRecord
                                                                          .workCompletedRequester),
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                                size: 24.0,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Work Complete',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Urbanist',
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            functions.workCompletedColor(columnTrackOrderRecord.workCompletedOfferer,
                                                                                columnTrackOrderRecord.workCompletedRequester),
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (columnTrackOrderRecord
                                                                      .workCompletedDateOfferer !=
                                                                  null)
                                                                Flexible(
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                            'relative',
                                                                            columnTrackOrderRecord.workCompletedDateOfferer),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                const Color(0xFF585858),
                                                                            fontSize:
                                                                                12.0,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (!columnTrackOrderRecord.headingYourWay)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                0.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .car,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Have you left yet?',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation1'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'containerOnActionTriggerAnimation1']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }

                                                                  await columnTrackOrderRecord.reference
                                                                      .update(
                                                                          createTrackOrderRecordData(
                                                                    headingYourWay:
                                                                        true,
                                                                    headingYourWayDate:
                                                                        getCurrentTimestamp,
                                                                  ));
                                                                },
                                                                text: 'Yes',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: const Color(
                                                                      0xFFF609F0),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation15']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation1']!,
                                                        ),
                                                  ),
                                                ),
                                              if (columnTrackOrderRecord.headingYourWay &&
                                                  !columnTrackOrderRecord.arrived)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                0.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .flagCheckered,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Have you Arrived yet?',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge,
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation2'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'containerOnActionTriggerAnimation2']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }

                                                                  await columnTrackOrderRecord.reference
                                                                      .update(
                                                                          createTrackOrderRecordData(
                                                                    arrived:
                                                                        true,
                                                                    arrivedDate:
                                                                        getCurrentTimestamp,
                                                                  ));
                                                                },
                                                                text: 'Yes',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: const Color(
                                                                      0xFFF609F0),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation16']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation2']!,
                                                        ),
                                                  ),
                                                ),
                                              if (!columnTrackOrderRecord.workUnderWay &&
                                                  columnTrackOrderRecord.arrived)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                0.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .playCircle,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Has work started yet?',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge,
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation3'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'containerOnActionTriggerAnimation3']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }

                                                                  await columnTrackOrderRecord.reference
                                                                      .update(
                                                                          createTrackOrderRecordData(
                                                                    workUnderWay:
                                                                        true,
                                                                    workUnderWayDate:
                                                                        getCurrentTimestamp,
                                                                  ));
                                                                },
                                                                text: 'Yes',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: const Color(
                                                                      0xFFF609F0),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation17']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation3']!,
                                                        ),
                                                  ),
                                                ),
                                              if (columnTrackOrderRecord.workUnderWay &&
                                                  ((columnTrackOrderRecord
                                                              .workCompletedOfferer ==
                                                          false) &&
                                                      (columnTrackOrderRecord
                                                              .workCompletedRequester ==
                                                          false)))
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                0.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 8.0,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .grin,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Is the work Complete?',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge,
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation4'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'containerOnActionTriggerAnimation4']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }

                                                                  await columnTrackOrderRecord.reference
                                                                      .update(
                                                                          createTrackOrderRecordData(
                                                                    workCompletedOfferer:
                                                                        true,
                                                                    workCompletedDateOfferer:
                                                                        getCurrentTimestamp,
                                                                  ));
                                                                },
                                                                text: 'Yes',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: const Color(
                                                                      0xFFF609F0),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                        .animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation18']!)
                                                        .animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation4']!,
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
                              ],
                            );
                          },
                        ),
                      ),
                      if (!acceptedOfferOffererOfferRecord.congratulationsShown)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: double.infinity,
                                          child: OffererProfileDrawerWidget(
                                            userDoc: columnUsersRecord,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: wrapWithModel(
                                model: _model.congratulationsPopModel,
                                updateCallback: () => setState(() {}),
                                child: CongratulationsPopWidget(
                                  offerDocRef: widget.thisOffertDocRef!,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                              if ((acceptedOfferOffererOfferRecord
                                          .congratulationsShown ==
                                      true) &&
                                  ((columnTrackOrderRecord
                                              ?.workCompletedRequester ==
                                          true) &&
                                      (columnTrackOrderRecord
                                              ?.workCompletedOfferer ==
                                          true)))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.requesterSetCompletedModel,
                                      updateCallback: () => setState(() {}),
                                      child: RequesterSetCompletedWidget(
                                        offerDocRef:
                                            acceptedOfferOffererOfferRecord,
                                        trackOrderRef:
                                            columnTrackOrderRecord!.reference,
                                        requesterUserName:
                                            columnUsersRecord.displayName,
                                        requesterUserId:
                                            columnUsersRecord.reference,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
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
                              if ((acceptedOfferOffererOfferRecord
                                          .congratulationsShown ==
                                      true) &&
                                  ((columnTrackOrderRecord
                                              ?.workCompletedRequester ==
                                          false) &&
                                      (columnTrackOrderRecord
                                              ?.workCompletedOfferer ==
                                          true)))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.offererSetCompletedModel,
                                      updateCallback: () => setState(() {}),
                                      child: const OffererSetCompletedWidget(),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
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
