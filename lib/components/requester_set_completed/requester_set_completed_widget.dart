import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/leave_review/leave_review_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'requester_set_completed_model.dart';
export 'requester_set_completed_model.dart';

class RequesterSetCompletedWidget extends StatefulWidget {
  const RequesterSetCompletedWidget({
    super.key,
    required this.offerDocRef,
    required this.trackOrderRef,
    String? requesterUserName,
    required this.requesterUserId,
  }) : requesterUserName = requesterUserName ?? 'Requester Name';

  final OfferRecord? offerDocRef;
  final DocumentReference? trackOrderRef;
  final String requesterUserName;
  final DocumentReference? requesterUserId;

  @override
  State<RequesterSetCompletedWidget> createState() =>
      _RequesterSetCompletedWidgetState();
}

class _RequesterSetCompletedWidgetState
    extends State<RequesterSetCompletedWidget> {
  late RequesterSetCompletedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequesterSetCompletedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                      'Congratulations!',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'The requester has set the status to \'Work Complete\', if you agree, click \'Complete\' below and your payment will be released to your account.\nGreat job!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 250.0,
                  height: 250.0,
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
                          await widget.trackOrderRef!
                              .update(createTrackOrderRecordData(
                            workCompletedOfferer: true,
                            workCompletedDateOfferer: getCurrentTimestamp,
                          ));

                          await widget.offerDocRef!.reference
                              .update(createOfferRecordData(
                            status: 7,
                          ));

                          await TransactionRecord.collection.doc().set({
                            ...createTransactionRecordData(
                              totalValue: 5.0,
                              createdAt: getCurrentTimestamp,
                              tax: 0.0,
                              znexyValue: 0.0,
                              userId: currentUserReference,
                              type: TransactionType.WorkCredit.name,
                            ),
                            ...mapToFirestore(
                              {
                                'OfferIds': [widget.offerDocRef?.reference],
                              },
                            ),
                          });
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: LeaveReviewWidget(
                                  requestersName: widget.requesterUserName,
                                  requesterUserId: widget.requesterUserId!,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          context.pushNamed('Profile');
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
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.white,
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
