import '/backend/backend.dart';
import '/components/user_rating/user_rating_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reviews_list_model.dart';
export 'reviews_list_model.dart';

class ReviewsListWidget extends StatefulWidget {
  const ReviewsListWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final List<ReviewRecord>? parameter1;
  final DocumentReference? parameter2;

  @override
  State<ReviewsListWidget> createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  late ReviewsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewsListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ReviewRecord>>(
      stream: queryReviewRecord(
        queryBuilder: (reviewRecord) => reviewRecord.where(
          'UserId',
          isEqualTo: widget.parameter2,
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
        List<ReviewRecord> containerReviewRecordList = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 100.0,
          decoration: const BoxDecoration(
            color: Color(0xFF142328),
          ),
          child: Builder(
            builder: (context) {
              final reviewList = containerReviewRecordList.toList();
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                scrollDirection: Axis.horizontal,
                itemCount: reviewList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 5.0),
                itemBuilder: (context, reviewListIndex) {
                  final reviewListItem = reviewList[reviewListIndex];
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: UserRatingWidget(
                              key: Key(
                                  'Key78j_${reviewListIndex}_of_${reviewList.length}'),
                              userRating: reviewListItem.rating.toDouble(),
                            ),
                          ),
                          Text(
                            'Rating (${valueOrDefault<String>(
                              reviewListItem.rating.toString(),
                              '0',
                            )}/5)',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 10.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            'Hello World Hello World Hello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello World',
                            maxLines: 5,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 8.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
