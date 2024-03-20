import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/leave_review/leave_review_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'offerer_set_offer_completed_model.dart';
export 'offerer_set_offer_completed_model.dart';

class OffererSetOfferCompletedWidget extends StatefulWidget {
  const OffererSetOfferCompletedWidget({
    super.key,
    required this.offerDoc,
    required this.trackOrderRef,
    String? offerUserName,
    required this.offererUserId,
  }) : offerUserName = offerUserName ?? 'Offerer Name';

  final OfferRecord? offerDoc;
  final DocumentReference? trackOrderRef;
  final String offerUserName;
  final DocumentReference? offererUserId;

  @override
  State<OffererSetOfferCompletedWidget> createState() =>
      _OffererSetOfferCompletedWidgetState();
}

class _OffererSetOfferCompletedWidgetState
    extends State<OffererSetOfferCompletedWidget> {
  late OffererSetOfferCompletedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OffererSetOfferCompletedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Container(
        width: 700.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Work Set to Complete',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    '${widget.offerUserName} has set the status to \'Work Complete\', if you agree, click \'Complete\' below and the request will be completed and paid out. Great job!',
                    'The offer User',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: const BoxDecoration(),
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Lottie.asset(
                        'assets/lottie_animations/Animation_-_1706039834608.json',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget.offerDoc!.reference
                              .update(createOfferRecordData(
                            status: 8,
                          ));
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: SizedBox(
                                  height: 350.0,
                                  width: 300.0,
                                  child: LeaveReviewWidget(
                                    requestersName: widget.offerUserName,
                                    requesterUserId: widget.offererUserId!,
                                    requestDocRef: widget.offerDoc!.requestId!,
                                    trackOrderDocRef: widget.trackOrderRef!,
                                    isRequester: true,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          unawaited(
                            () async {
                              await widget.trackOrderRef!
                                  .update(createTrackOrderRecordData(
                                workCompletedRequester: true,
                                workCompletedDateRequester: getCurrentTimestamp,
                              ));
                            }(),
                          );

                          await TransactionRecord.collection.doc().set({
                            ...createTransactionRecordData(
                              totalValue: valueOrDefault<double>(
                                widget.offerDoc?.value,
                                0.0,
                              ),
                              createdAt: getCurrentTimestamp,
                              tax: 0.0,
                              znexyValue: 0.0,
                              userId: widget.offerDoc?.userId,
                              type: TransactionType.WorkCredit.name,
                              withdrawn: false,
                            ),
                            ...mapToFirestore(
                              {
                                'OfferIds': [widget.offerDoc?.reference],
                              },
                            ),
                          });

                          context.pushNamed('HelpRequests');
                        },
                        text: 'Complete',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
        ),
      ),
    );
  }
}
