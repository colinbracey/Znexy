import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/choose_destination/choose_destination_widget.dart';
import '/components/request_listing_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpRequestsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RequestRecord>>(
      stream: queryRequestRecord(
        queryBuilder: (requestRecord) => requestRecord
            .where(
              'Complete',
              isEqualTo: false,
            )
            .orderBy('CreatedAt', descending: true),
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
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
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
                                    borderRadius: BorderRadius.circular(8.0),
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFFF609F0),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<NotificationRecord>
                                  badgeNotificationRecordList = snapshot.data!;
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
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                animationType: badges.BadgeAnimationType.scale,
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFF609F0),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ShoppingCartRecord>
                                badgeShoppingCartRecordList = snapshot.data!;
                            return badges.Badge(
                              badgeContent: Text(
                                valueOrDefault<String>(
                                  badgeShoppingCartRecordList.length.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                              ),
                              showBadge: badgeShoppingCartRecordList.isNotEmpty,
                              shape: badges.BadgeShape.circle,
                              badgeColor: const Color(0xFFF609F0),
                              elevation: 8.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              position: badges.BadgePosition.topEnd(),
                              animationType: badges.BadgeAnimationType.scale,
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
                  if (_model.displaySearchContainer)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: Container(
                        height: 64.0,
                        constraints: const BoxConstraints(
                          maxWidth: 770.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(64.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 6,
                              child: SizedBox(
                                width: 220.0,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    _model.searchAllRequests =
                                        await actions.searchRequests(
                                      _model.textController.text,
                                      helpRequestsRequestRecordList.toList(),
                                    );
                                    setState(() {
                                      _model.searchActive = true;
                                    });

                                    setState(() {});
                                  },
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Search requests',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    alignLabelWithHint: false,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(48.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(48.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(48.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(48.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(48.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(48.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(48.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(48.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: (_model
                                                .textFieldFocusNode?.hasFocus ??
                                            false)
                                        ? FlutterFlowTheme.of(context).accent1
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 32.0, 0.0, 32.0),
                                    suffixIcon: Icon(
                                      Icons.search_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            if (_model.searchActive ?? true)
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  width: 1.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              width: _model.searchActive! ? 100.0 : 0.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(44.0),
                              ),
                              child: Visibility(
                                visible: _model.searchActive ?? true,
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.searchActive = false;
                                        });
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                      },
                                      text: 'Clear',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100.0,
                              child: VerticalDivider(
                                width: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showAlignedDialog(
                                      barrierColor: Colors.transparent,
                                      context: context,
                                      isGlobal: false,
                                      avoidOverflow: true,
                                      targetAnchor: const AlignmentDirectional(
                                              -1.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: const AlignmentDirectional(
                                              -1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: const ChooseDestinationWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  child: Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(44.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Where',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          Text(
                                            'Search destinations...',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!_model.displaySearchContainer)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: Container(
                        height: 64.0,
                        constraints: const BoxConstraints(
                          maxWidth: 770.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(64.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                      ),
                    ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 16.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            padding: const EdgeInsets.all(4.0),
                            tabs: const [
                              Tab(
                                text: 'll Requests',
                              ),
                              Tab(
                                text: 'My Offers',
                              ),
                              Tab(
                                text: 'My Requests',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [
                                () async {
                                  setState(() {
                                    _model.displaySearchContainer = true;
                                  });
                                },
                                () async {
                                  setState(() {
                                    _model.displaySearchContainer = false;
                                  });
                                },
                                () async {
                                  setState(() {
                                    _model.displaySearchContainer = false;
                                  });
                                }
                              ][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              KeepAliveWidgetWrapper(
                                builder: (context) => Stack(
                                  children: [
                                    if (!_model.searchActive! &&
                                        !_model.showMap)
                                      Builder(
                                        builder: (context) {
                                          final allRequests =
                                              helpRequestsRequestRecordList
                                                  .toList();
                                          return GridView.builder(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              10.0,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 1;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 2;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 3;
                                                } else {
                                                  return 4;
                                                }
                                              }(),
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: 1.5,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: allRequests.length,
                                            itemBuilder:
                                                (context, allRequestsIndex) {
                                              final allRequestsItem =
                                                  allRequests[allRequestsIndex];
                                              return RequestListingWidget(
                                                key: Key(
                                                    'Key3u3_${allRequestsIndex}_of_${allRequests.length}'),
                                                requestDoc: allRequestsItem,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (_model.searchActive! && !_model.showMap)
                                      Builder(
                                        builder: (context) {
                                          final searchRequests = _model
                                                  .searchAllRequests
                                                  ?.toList() ??
                                              [];
                                          return GridView.builder(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              10.0,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 1;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 2;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 3;
                                                } else {
                                                  return 4;
                                                }
                                              }(),
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: 1.5,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: searchRequests.length,
                                            itemBuilder:
                                                (context, searchRequestsIndex) {
                                              final searchRequestsItem =
                                                  searchRequests[
                                                      searchRequestsIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .requestListingModels2
                                                    .getModel(
                                                  searchRequestsItem
                                                      .reference.id,
                                                  searchRequestsIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: RequestListingWidget(
                                                  key: Key(
                                                    'Keyw66_${searchRequestsItem.reference.id}',
                                                  ),
                                                  requestDoc:
                                                      searchRequestsItem,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (!_model.searchActive! && _model.showMap)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 50.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) => SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: custom_widgets.ZnexyMap(
                                                width: double.infinity,
                                                height: double.infinity,
                                                showLocation: true,
                                                showCompass: true,
                                                showMapToolbar: true,
                                                showTraffic: true,
                                                allowZoom: true,
                                                showZoomControls: true,
                                                defaultZoom: 7.0,
                                                places:
                                                    helpRequestsRequestRecordList,
                                                mapCentre:
                                                    helpRequestsRequestRecordList
                                                        .first.location!,
                                                onClickMarker:
                                                    (requestRecord) async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: SizedBox(
                                                            height: 300.0,
                                                            width: 350.0,
                                                            child:
                                                                RequestListingWidget(
                                                              requestDoc:
                                                                  requestRecord,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (_model.searchActive! && _model.showMap)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 50.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) => SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: custom_widgets.ZnexyMap(
                                                width: double.infinity,
                                                height: double.infinity,
                                                showLocation: true,
                                                showCompass: true,
                                                showMapToolbar: true,
                                                showTraffic: true,
                                                allowZoom: true,
                                                showZoomControls: true,
                                                defaultZoom: 4.0,
                                                places:
                                                    _model.searchAllRequests,
                                                mapCentre: _model
                                                    .searchAllRequests!
                                                    .first
                                                    .location!,
                                                onClickMarker:
                                                    (requestRecord) async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: SizedBox(
                                                            height: 300.0,
                                                            width: 350.0,
                                                            child:
                                                                RequestListingWidget(
                                                              requestDoc:
                                                                  requestRecord,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 70.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.showMap =
                                                        !_model.showMap;
                                                  });
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFF609F0),
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
                                                            50.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _model.showMap
                                                            ? 'Show List'
                                                            : 'Show Map',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons.map_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 24.0,
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
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
                              KeepAliveWidgetWrapper(
                                builder: (context) => Stack(
                                  children: [
                                    StreamBuilder<List<OfferRecord>>(
                                      stream: queryOfferRecord(
                                        queryBuilder: (offerRecord) =>
                                            offerRecord.where(
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFF609F0),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<OfferRecord>
                                            containerOfferRecordList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final myOfferDocuments =
                                                  containerOfferRecordList
                                                      .toList();
                                              return GridView.builder(
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  10.0,
                                                ),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return 1;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return 2;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return 3;
                                                    } else {
                                                      return 4;
                                                    }
                                                  }(),
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 5.0,
                                                  childAspectRatio: 1.5,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    myOfferDocuments.length,
                                                itemBuilder: (context,
                                                    myOfferDocumentsIndex) {
                                                  final myOfferDocumentsItem =
                                                      myOfferDocuments[
                                                          myOfferDocumentsIndex];
                                                  return StreamBuilder<
                                                      RequestRecord>(
                                                    stream: RequestRecord
                                                        .getDocument(
                                                            myOfferDocumentsItem
                                                                .requestId!),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                Color(
                                                                    0xFFF609F0),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final requestListingRequestRecord =
                                                          snapshot.data!;
                                                      return RequestListingWidget(
                                                        key: Key(
                                                            'Key02m_${myOfferDocumentsIndex}_of_${myOfferDocuments.length}'),
                                                        requestDoc:
                                                            requestListingRequestRecord,
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              KeepAliveWidgetWrapper(
                                builder: (context) => Stack(
                                  children: [
                                    StreamBuilder<List<RequestRecord>>(
                                      stream: queryRequestRecord(
                                        queryBuilder: (requestRecord) =>
                                            requestRecord
                                                .where(
                                                  'UserId',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .orderBy('CreatedAt',
                                                    descending: true),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFF609F0),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<RequestRecord>
                                            allRequestsRequestRecordList =
                                            snapshot.data!;
                                        return GridView.builder(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            10.0,
                                          ),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 1;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 2;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 3;
                                              } else {
                                                return 4;
                                              }
                                            }(),
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 5.0,
                                            childAspectRatio: 1.5,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              allRequestsRequestRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, allRequestsIndex) {
                                            final allRequestsRequestRecord =
                                                allRequestsRequestRecordList[
                                                    allRequestsIndex];
                                            return RequestListingWidget(
                                              key: Key(
                                                  'Keynos_${allRequestsIndex}_of_${allRequestsRequestRecordList.length}'),
                                              requestDoc:
                                                  allRequestsRequestRecord,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 70.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.showMap =
                                                        !_model.showMap;
                                                  });
                                                },
                                                child: Container(
                                                  width: 150.0,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFF609F0),
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
                                                            50.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _model.showMap
                                                            ? 'Show List'
                                                            : 'Show Map',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons.map_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 24.0,
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
