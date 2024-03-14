import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/offer_accepted/offer_accepted_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_a_bid_model.dart';
export 'add_a_bid_model.dart';

class AddABidWidget extends StatefulWidget {
  const AddABidWidget({
    super.key,
    required this.thisRequestDocRef,
    required this.thisOfferDocRef,
    String? requestersName,
  }) : requestersName = requestersName ?? 'The requester';

  final DocumentReference? thisRequestDocRef;
  final String? thisOfferDocRef;
  final String requestersName;

  @override
  State<AddABidWidget> createState() => _AddABidWidgetState();
}

class _AddABidWidgetState extends State<AddABidWidget> {
  late AddABidModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddABidModel());

    _model.offerAmountController ??= TextEditingController();
    _model.offerAmountFocusNode ??= FocusNode();

    _model.offerDescriptionController ??= TextEditingController();
    _model.offerDescriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OfferRecord>>(
      stream: queryOfferRecord(
        queryBuilder: (offerRecord) => offerRecord
            .where(
              'RequestId',
              isEqualTo: widget.thisRequestDocRef,
            )
            .where(
              'UserId',
              isEqualTo: currentUserReference,
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
        List<OfferRecord> createNoteOfferRecordList = snapshot.data!;
        final createNoteOfferRecord = createNoteOfferRecordList.isNotEmpty
            ? createNoteOfferRecordList.first
            : null;
        return Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Container(
            width: 700.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: StreamBuilder<RequestRecord>(
              stream: RequestRecord.getDocument(widget.thisRequestDocRef!),
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
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Add A Bid for the Request',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Uber',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Uber'),
                                    ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                color: Color(0xFF142328),
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            18.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Enter your bid in \$ below',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Uber',
                                    useGoogleFonts:
                                        GoogleFonts.asMap().containsKey('Uber'),
                                  ),
                            ),
                            AlignedTooltip(
                              content: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'Make your offer as competative as possible to stand out from the crowd.',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  )),
                              offset: 4.0,
                              preferredDirection: AxisDirection.down,
                              borderRadius: BorderRadius.circular(8.0),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              tailBaseWidth: 24.0,
                              tailLength: 12.0,
                              waitDuration: const Duration(milliseconds: 100),
                              showDuration: const Duration(milliseconds: 1500),
                              triggerMode: TooltipTriggerMode.tap,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.info_outline,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            18.0, 10.0, 18.0, 0.0),
                        child: TextFormField(
                          controller: _model.offerAmountController,
                          focusNode: _model.offerAmountFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF142328),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFF609F0),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 8.0, 10.0, 0.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Uber',
                                    fontSize: 18.0,
                                    useGoogleFonts:
                                        GoogleFonts.asMap().containsKey('Uber'),
                                  ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          validator: _model.offerAmountControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            18.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Enter a detailed description of your offer',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Uber',
                                    useGoogleFonts:
                                        GoogleFonts.asMap().containsKey('Uber'),
                                  ),
                            ),
                            AlignedTooltip(
                              content: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'The more detail you provide, the more chances you have of your offer being accepted',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  )),
                              offset: 4.0,
                              preferredDirection: AxisDirection.down,
                              borderRadius: BorderRadius.circular(8.0),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              tailBaseWidth: 24.0,
                              tailLength: 12.0,
                              waitDuration: const Duration(milliseconds: 100),
                              showDuration: const Duration(milliseconds: 1500),
                              triggerMode: TooltipTriggerMode.tap,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.info_outline,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            18.0, 10.0, 18.0, 0.0),
                        child: TextFormField(
                          controller: _model.offerDescriptionController,
                          focusNode: _model.offerDescriptionFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            alignLabelWithHint: true,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF142328),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFF609F0),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 20.0, 10.0, 0.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Uber',
                                    fontSize: 18.0,
                                    useGoogleFonts:
                                        GoogleFonts.asMap().containsKey('Uber'),
                                  ),
                          maxLines: 6,
                          validator: _model.offerDescriptionControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: const LatLng(0.0, 0.0));
                                  if ((createNoteOfferRecord != null) == true) {
                                    await createNoteOfferRecord!.reference
                                        .update({
                                      ...createOfferRecordData(
                                        value: double.tryParse(
                                            _model.offerAmountController.text),
                                        description: _model
                                            .offerDescriptionController.text,
                                        location: currentUserLocationValue,
                                        status: 2,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'BidHistory': FieldValue.arrayUnion([
                                            getBidHistoryFirestoreData(
                                              updateBidHistoryStruct(
                                                BidHistoryStruct(
                                                  amount: double.tryParse(_model
                                                      .offerAmountController
                                                      .text),
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  accepted: false,
                                                  description: _model
                                                      .offerDescriptionController
                                                      .text,
                                                  cancelled: false,
                                                ),
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                        },
                                      ),
                                    });
                                  } else {
                                    await OfferRecord.collection.doc().set({
                                      ...createOfferRecordData(
                                        requestId: widget.thisRequestDocRef,
                                        userId: currentUserReference,
                                        value: double.tryParse(
                                            _model.offerAmountController.text),
                                        createdAt: getCurrentTimestamp,
                                        accepted: false,
                                        description: _model
                                            .offerDescriptionController.text,
                                        status: 1,
                                        location: currentUserLocationValue,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'BidHistory': [
                                            getBidHistoryFirestoreData(
                                              updateBidHistoryStruct(
                                                BidHistoryStruct(
                                                  amount: double.tryParse(_model
                                                      .offerAmountController
                                                      .text),
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  accepted: false,
                                                  description: _model
                                                      .offerDescriptionController
                                                      .text,
                                                  cancelled: false,
                                                ),
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              true,
                                            )
                                          ],
                                        },
                                      ),
                                    });
                                  }

                                  await NotificationRecord.collection
                                      .doc()
                                      .set(createNotificationRecordData(
                                        senderId: currentUserReference,
                                        receivedId: columnRequestRecord.userId,
                                        type: 1,
                                        message: valueOrDefault<String>(
                                          '$currentUserDisplayName made a bid of \$${valueOrDefault<String>(
                                            _model.offerAmountController.text,
                                            '0',
                                          )}',
                                          '0',
                                        ),
                                        createdAt: getCurrentTimestamp,
                                        read: false,
                                        offerId:
                                            createNoteOfferRecord?.reference,
                                        requestId: widget.thisRequestDocRef,
                                      ));
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SizedBox(
                                          height: 285.0,
                                          width: 420.0,
                                          child: OfferAcceptedWidget(
                                            requestersName:
                                                widget.requestersName,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'Confirm Bid',
                                options: FFButtonOptions(
                                  width: 270.0,
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFFF609F0),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleMediumFamily,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
