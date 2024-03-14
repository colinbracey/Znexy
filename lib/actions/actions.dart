import '/backend/backend.dart';
import '/components/leave_review/leave_review_widget.dart';
import 'package:flutter/material.dart';

Future showReviewPopup(
  BuildContext context, {
  String? requestersName,
  DocumentReference? requestersUserId,
  DocumentReference? requestDocRef,
  DocumentReference? trackOrderDocRef,
  required bool? isRequester,
}) async {
  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: SizedBox(
          height: 350.0,
          width: 300.0,
          child: LeaveReviewWidget(
            requestersName: requestersName,
            requesterUserId: requestersUserId!,
            requestDocRef: requestDocRef!,
            trackOrderDocRef: trackOrderDocRef!,
            isRequester: isRequester!,
          ),
        ),
      );
    },
  );
}
