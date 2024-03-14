import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'help_requests_model.dart';
export 'help_requests_model.dart';

class HelpRequestsWidget extends StatefulWidget {
  const HelpRequestsWidget({super.key});

  @override
  State<HelpRequestsWidget> createState() => _HelpRequestsWidgetState();
}

class _HelpRequestsWidgetState extends State<HelpRequestsWidget>
    with TickerProviderStateMixin {
  late HelpRequestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.681, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1440.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1440.ms,
          duration: 710.ms,
          begin: const Offset(100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1440.ms,
          duration: 710.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpRequestsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.searchFieldController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    return StreamBuilder<List<RequestRecord>>(
      stream: queryRequestRecord(
        queryBuilder: (requestRecord) => requestRecord.where(
          'Complete',
          isEqualTo: false,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<RequestRecord> helpRequestsRequestRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: FloatingActionButton.extended(
                onPressed: () async {
                  context.pushNamed('AddHelpRequest');
                },
                backgroundColor: const Color(0xFFF609F0),
                icon: const Icon(
                  Icons.hail,
                ),
                elevation: 8.0,
                label: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ).animateOnPageLoad(
                  animationsMap['floatingActionButtonOnPageLoadAnimation']!),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF142328),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      1.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF142328),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/White-Pink-Logo.png',
                                          width: 100.0,
                                          height: 50.0,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: StreamBuilder<List<NotificationRecord>>(
                                stream: queryNotificationRecord(
                                  queryBuilder: (notificationRecord) =>
                                      notificationRecord
                                          .where(
                                            'ReceivedId',
                                            isEqualTo: currentUserReference,
                                          )
                                          .where(
                                            'Read',
                                            isEqualTo: false,
                                          ),
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
                                  List<NotificationRecord>
                                      badgeNotificationRecordList =
                                      snapshot.data!;
                                  return badges.Badge(
                                    badgeContent: Text(
                                      valueOrDefault<String>(
                                        badgeNotificationRecordList.length
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                    ),
                                    showBadge:
                                        badgeNotificationRecordList.isNotEmpty,
                                    shape: badges.BadgeShape.circle,
                                    badgeColor: const Color(0xFFF609F0),
                                    elevation: 8.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    position: badges.BadgePosition.topEnd(),
                                    animationType:
                                        badges.BadgeAnimationType.scale,
                                    toAnimate: true,
                                    child: FlutterFlowIconButton(
                                      borderColor: const Color(0xFFF609F0),
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: const Icon(
                                        Icons.notifications_sharp,
                                        color: Color(0xFFFDFDFD),
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('Notifications');
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            StreamBuilder<List<ShoppingCartRecord>>(
                              stream: queryShoppingCartRecord(
                                queryBuilder: (shoppingCartRecord) =>
                                    shoppingCartRecord.where(
                                  'UserId',
                                  isEqualTo: currentUserReference,
                                ),
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
                                List<ShoppingCartRecord>
                                    badgeShoppingCartRecordList =
                                    snapshot.data!;
                                return badges.Badge(
                                  badgeContent: Text(
                                    valueOrDefault<String>(
                                      badgeShoppingCartRecordList.length
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                  showBadge:
                                      badgeShoppingCartRecordList.isNotEmpty,
                                  shape: badges.BadgeShape.circle,
                                  badgeColor: const Color(0xFFF609F0),
                                  elevation: 8.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  position: badges.BadgePosition.topEnd(),
                                  animationType:
                                      badges.BadgeAnimationType.scale,
                                  toAnimate: true,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: const Color(0xFFF609F0),
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: const Icon(
                                        Icons.shopping_cart,
                                        color: Color(0xFFFDFDFD),
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('ShoppingCart');
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FlutterFlowGoogleMap(
                                        controller:
                                            _model.googleMapWidesController,
                                        onCameraIdle: (latLng) => _model
                                            .googleMapWidesCenter = latLng,
                                        initialLocation:
                                            _model.googleMapWidesCenter ??=
                                                currentUserLocationValue!,
                                        markers: helpRequestsRequestRecordList
                                            .map((e) => e.location)
                                            .withoutNulls
                                            .toList()
                                            .map(
                                              (marker) => FlutterFlowMarker(
                                                marker.serialize(),
                                                marker,
                                              ),
                                            )
                                            .toList(),
                                        markerColor: GoogleMarkerColor.violet,
                                        mapType: MapType.normal,
                                        style: GoogleMapStyle.standard,
                                        initialZoom: 14.0,
                                        allowInteraction: true,
                                        allowZoom: true,
                                        showZoomControls: true,
                                        showLocation: true,
                                        showCompass: false,
                                        showMapToolbar: false,
                                        showTraffic: false,
                                        centerMapOnMarkerTap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.35,
                                    decoration: const BoxDecoration(
                                      color: Color(0x8E4B39EF),
                                    ),
                                    child: Stack(
                                      children: [
                                        FlutterFlowGoogleMap(
                                          controller:
                                              _model.googleMapMobilesController,
                                          onCameraIdle: (latLng) => _model
                                              .googleMapMobilesCenter = latLng,
                                          initialLocation: _model
                                                  .googleMapMobilesCenter ??=
                                              _model.placePickerValue.latLng,
                                          markers: helpRequestsRequestRecordList
                                              .map((e) => e.location)
                                              .withoutNulls
                                              .toList()
                                              .map(
                                                (marker) => FlutterFlowMarker(
                                                  marker.serialize(),
                                                  marker,
                                                ),
                                              )
                                              .toList(),
                                          markerColor: GoogleMarkerColor.violet,
                                          mapType: MapType.normal,
                                          style: GoogleMapStyle.standard,
                                          initialZoom: 14.0,
                                          allowInteraction: true,
                                          allowZoom: true,
                                          showZoomControls: true,
                                          showLocation: true,
                                          showCompass: false,
                                          showMapToolbar: false,
                                          showTraffic: false,
                                          centerMapOnMarkerTap: true,
                                        ),
                                        PointerInterceptor(
                                          intercepting: isWeb,
                                          child: FlutterFlowPlacePicker(
                                            iOSGoogleMapsApiKey:
                                                'AIzaSyDm9dUzg0tXX8GhKDrzHk581XK9wmMIwNk',
                                            androidGoogleMapsApiKey:
                                                'AIzaSyDg8-BC2IcmYxvrxHX8-f7n223YaM69QZs',
                                            webGoogleMapsApiKey:
                                                'AIzaSyD8c6ObN67Fy4Ub1MfyWKwuW5J-c-rht0A',
                                            onSelect: (place) async {
                                              setState(() => _model
                                                  .placePickerValue = place);
                                              (await _model
                                                      .googleMapMobilesController
                                                      .future)
                                                  .animateCamera(
                                                      CameraUpdate.newLatLng(
                                                          place.latLng
                                                              .toGoogleMaps()));
                                            },
                                            defaultText: 'Location',
                                            icon: Icon(
                                              Icons.place,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 16.0,
                                            ),
                                            buttonOptions: FFButtonOptions(
                                              width: 100.0,
                                              height: 40.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 12.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 2.0,
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
                                  ),
                                Container(
                                  width: double.infinity,
                                  height: 47.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF142328),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.search,
                                          color: Color(0xFFFDFDFD),
                                          size: 20.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 4.0),
                                          child: TextFormField(
                                            controller:
                                                _model.searchFieldController,
                                            focusNode:
                                                _model.searchFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.searchFieldController',
                                              const Duration(milliseconds: 500),
                                              () => setState(() {}),
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintText: 'Search...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color:
                                                            const Color(0xFFFDFDFD),
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFF609F0),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              suffixIcon: _model
                                                      .searchFieldController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .searchFieldController
                                                            ?.clear();
                                                        setState(() {});
                                                      },
                                                      child: const Icon(
                                                        Icons.clear,
                                                        color:
                                                            Color(0xFFFDFDFD),
                                                        size: 15.0,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: const Color(0xFFFDFDFD),
                                                  fontSize: 18.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                            validator: _model
                                                .searchFieldControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'My Requests',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Uber',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Uber'),
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Switch.adaptive(
                                          value: _model.myRequestSwitchValue ??=
                                              false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.myRequestSwitchValue =
                                                    newValue);
                                          },
                                          activeColor: const Color(0xFFF609F0),
                                          activeTrackColor: Colors.white,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final helpRequests =
                                          helpRequestsRequestRecordList
                                              .toList();
                                      return ListView.builder(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          10.0,
                                          0,
                                          20.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: helpRequests.length,
                                        itemBuilder:
                                            (context, helpRequestsIndex) {
                                          final helpRequestsItem =
                                              helpRequests[helpRequestsIndex];
                                          return Visibility(
                                            visible: functions.searchRequestList(
                                                    helpRequestsItem
                                                        .shortDescription,
                                                    helpRequestsItem
                                                        .longDescription,
                                                    _model.searchFieldController
                                                        .text,
                                                    _model
                                                        .myRequestSwitchValue!,
                                                    helpRequestsItem.userId?.id,
                                                    currentUserUid) ??
                                                true,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 15.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (helpRequestsItem.userId ==
                                                      currentUserReference) {
                                                    if (helpRequestsItem
                                                            .accepted ==
                                                        true) {
                                                      context.pushNamed(
                                                        'AcceptedOfferRequester',
                                                        queryParameters: {
                                                          'thisOffertDocRef':
                                                              serializeParam(
                                                            helpRequestsItem
                                                                .acceptedOfferId,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .leftToRight,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    250),
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      context.pushNamed(
                                                        'RequestOffers',
                                                        queryParameters: {
                                                          'thisRequestDocRef':
                                                              serializeParam(
                                                            helpRequestsItem
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .leftToRight,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    250),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    if (helpRequestsItem
                                                            .accepted ==
                                                        true) {
                                                      context.pushNamed(
                                                        'AcceptedOfferOfferer',
                                                        queryParameters: {
                                                          'thisOffertDocRef':
                                                              serializeParam(
                                                            helpRequestsItem
                                                                .acceptedOfferId,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .leftToRight,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    250),
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      context.pushNamed(
                                                        'RequestDetail',
                                                        queryParameters: {
                                                          'thisRequestDocRef':
                                                              serializeParam(
                                                            helpRequestsItem
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .leftToRight,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    250),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  }
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 5.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x520E151B),
                                                          offset:
                                                              Offset(3.0, 3.0),
                                                          spreadRadius: 3.0,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: SizedBox(
                                                      height: 250.0,
                                                      child: Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child:
                                                                Image.network(
                                                              helpRequestsItem
                                                                  .coverImage,
                                                              width: double
                                                                  .infinity,
                                                              height: 250.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                child:
                                                                    BackdropFilter(
                                                                  filter:
                                                                      ImageFilter
                                                                          .blur(
                                                                    sigmaX: 2.0,
                                                                    sigmaY: 2.0,
                                                                  ),
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.8,
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Color(
                                                                            0xDF000000),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Text(
                                                                                    helpRequestsItem.shortDescription,
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                if (helpRequestsItem.openPrice == false)
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      formatNumber(
                                                                                        helpRequestsItem.totalPrice,
                                                                                        formatType: FormatType.custom,
                                                                                        currency: '\$',
                                                                                        format: '###.00',
                                                                                        locale: '',
                                                                                      ),
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                        ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                helpRequestsItem.longDescription,
                                                                                maxLines: 3,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          functions.distanceBetweenTwoPoints(isWeb == true ? FFAppState().kelowna : currentUserLocationValue, helpRequestsItem.location, ''),
                                                                                          'Distance',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Uber',
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Uber'),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  if (helpRequestsItem.accepted == true)
                                                                                    Text(
                                                                                      'Offer Accepted',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: const Color(0xFFF609F0),
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation']!),
                                            ),
                                          );
                                        },
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
