import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/choose_destination/choose_destination_widget.dart';
import '/components/request_listing_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'help_requests_model.dart';
export 'help_requests_model.dart';

class HelpRequestsWidget extends StatefulWidget {
  const HelpRequestsWidget({super.key});

  @override
  State<HelpRequestsWidget> createState() => _HelpRequestsWidgetState();
}

class _HelpRequestsWidgetState extends State<HelpRequestsWidget> {
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Container(
                      height: 64.0,
                      constraints: const BoxConstraints(
                        maxWidth: 770.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  const Duration(milliseconds: 500),
                                  () => setState(() {}),
                                ),
                                onFieldSubmitted: (_) async {
                                  safeSetState(() {
                                    _model.simpleSearchResults = TextSearch(
                                      helpRequestsRequestRecordList
                                          .map(
                                            (record) =>
                                                TextSearchItem.fromTerms(
                                                    record, [
                                              record.shortDescription,
                                              record.longDescription
                                            ]),
                                          )
                                          .toList(),
                                    )
                                        .search(_model.textController.text)
                                        .map((r) => r.object)
                                        .toList();
                                  });
                                  setState(() {
                                    _model.searchActive = true;
                                  });
                                },
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Search requests',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  alignLabelWithHint: false,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      color: FlutterFlowTheme.of(context).error,
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
                                      color: FlutterFlowTheme.of(context).error,
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
                                  fillColor:
                                      (_model.textFieldFocusNode?.hasFocus ??
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
                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                                      borderRadius: BorderRadius.circular(8.0),
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
                  Expanded(
                    child: Stack(
                      children: [
                        if ((!_model.searchActive! && !_model.showMap) &&
                            responsiveVisibility(
                              context: context,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Builder(
                            builder: (context) {
                              final allRequests =
                                  helpRequestsRequestRecordList.toList();
                              return GridView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10.0,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 5.0,
                                  childAspectRatio: 1.5,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: allRequests.length,
                                itemBuilder: (context, allRequestsIndex) {
                                  final allRequestsItem =
                                      allRequests[allRequestsIndex];
                                  return RequestListingWidget(
                                    key: Key(
                                        'Key4w0_${allRequestsIndex}_of_${allRequests.length}'),
                                    requestDoc: allRequestsItem,
                                  );
                                },
                              );
                            },
                          ),
                        if ((_model.searchActive! && !_model.showMap) &&
                            responsiveVisibility(
                              context: context,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Builder(
                            builder: (context) {
                              final searchRequests =
                                  _model.simpleSearchResults.toList();
                              return GridView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10.0,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 5.0,
                                  childAspectRatio: 1.5,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: searchRequests.length,
                                itemBuilder: (context, searchRequestsIndex) {
                                  final searchRequestsItem =
                                      searchRequests[searchRequestsIndex];
                                  return RequestListingWidget(
                                    key: Key(
                                        'Keymwd_${searchRequestsIndex}_of_${searchRequests.length}'),
                                    requestDoc: searchRequestsItem,
                                  );
                                },
                              );
                            },
                          ),
                        if ((!_model.searchActive! && !_model.showMap) &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Builder(
                            builder: (context) {
                              final allRequests =
                                  helpRequestsRequestRecordList.toList();
                              return GridView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10.0,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 5.0,
                                  childAspectRatio: 1.5,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: allRequests.length,
                                itemBuilder: (context, allRequestsIndex) {
                                  final allRequestsItem =
                                      allRequests[allRequestsIndex];
                                  return RequestListingWidget(
                                    key: Key(
                                        'Keygto_${allRequestsIndex}_of_${allRequests.length}'),
                                    requestDoc: allRequestsItem,
                                  );
                                },
                              );
                            },
                          ),
                        if ((_model.searchActive! && !_model.showMap) &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Builder(
                            builder: (context) {
                              final searchTabRequests =
                                  _model.simpleSearchResults.toList();
                              return GridView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10.0,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 5.0,
                                  childAspectRatio: 1.5,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchTabRequests.length,
                                itemBuilder: (context, searchTabRequestsIndex) {
                                  final searchTabRequestsItem =
                                      searchTabRequests[searchTabRequestsIndex];
                                  return RequestListingWidget(
                                    key: Key(
                                        'Keywvm_${searchTabRequestsIndex}_of_${searchTabRequests.length}'),
                                    requestDoc: searchTabRequestsItem,
                                  );
                                },
                              );
                            },
                          ),
                        if ((!_model.searchActive! && !_model.showMap) &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                          Builder(
                            builder: (context) {
                              final allRequests =
                                  helpRequestsRequestRecordList.toList();
                              return GridView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10.0,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 5.0,
                                  childAspectRatio: 1.5,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: allRequests.length,
                                itemBuilder: (context, allRequestsIndex) {
                                  final allRequestsItem =
                                      allRequests[allRequestsIndex];
                                  return RequestListingWidget(
                                    key: Key(
                                        'Keypf3_${allRequestsIndex}_of_${allRequests.length}'),
                                    requestDoc: allRequestsItem,
                                  );
                                },
                              );
                            },
                          ),
                        if ((_model.searchActive! && !_model.showMap) &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                          Builder(
                            builder: (context) {
                              final allRequests =
                                  _model.simpleSearchResults.toList();
                              return GridView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  10.0,
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 5.0,
                                  childAspectRatio: 1.5,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: allRequests.length,
                                itemBuilder: (context, allRequestsIndex) {
                                  final allRequestsItem =
                                      allRequests[allRequestsIndex];
                                  return RequestListingWidget(
                                    key: Key(
                                        'Keyil7_${allRequestsIndex}_of_${allRequests.length}'),
                                    requestDoc: allRequestsItem,
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
                                builder: (context) => FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController1,
                                  onCameraIdle: (latLng) =>
                                      _model.googleMapsCenter1 = latLng,
                                  initialLocation: _model.googleMapsCenter1 ??=
                                      helpRequestsRequestRecordList
                                          .first.location!,
                                  markers: helpRequestsRequestRecordList
                                      .map(
                                        (helpRequestsRequestRecord) =>
                                            FlutterFlowMarker(
                                          helpRequestsRequestRecord
                                              .reference.path,
                                          helpRequestsRequestRecord.location!,
                                          () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
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
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: SizedBox(
                                                      height: 200.0,
                                                      width: 350.0,
                                                      child:
                                                          RequestListingWidget(
                                                        requestDoc:
                                                            helpRequestsRequestRecord,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                        ),
                                      )
                                      .toList(),
                                  markerColor: GoogleMarkerColor.violet,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 7.0,
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
                                builder: (context) => FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController2,
                                  onCameraIdle: (latLng) =>
                                      _model.googleMapsCenter2 = latLng,
                                  initialLocation: _model.googleMapsCenter2 ??=
                                      _model
                                          .simpleSearchResults.first.location!,
                                  markers: helpRequestsRequestRecordList
                                      .map(
                                        (helpRequestsRequestRecord) =>
                                            FlutterFlowMarker(
                                          helpRequestsRequestRecord
                                              .reference.path,
                                          helpRequestsRequestRecord.location!,
                                          () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
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
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child:
                                                        const RequestListingWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                        ),
                                      )
                                      .toList(),
                                  markerColor: GoogleMarkerColor.violet,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 7.0,
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
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 70.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.showMap = !_model.showMap;
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
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _model.showMap
                                                ? 'Show List'
                                                : 'Show Map',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Icon(
                                            Icons.map_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('InsertHelp');
                                    },
                                    child: Container(
                                      width: 150.0,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF609F0),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add Request',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Icon(
                                            Icons.add_circle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24.0,
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
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
          ),
        );
      },
    );
  }
}
