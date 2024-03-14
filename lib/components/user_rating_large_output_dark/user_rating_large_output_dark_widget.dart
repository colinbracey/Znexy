import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'user_rating_large_output_dark_model.dart';
export 'user_rating_large_output_dark_model.dart';

class UserRatingLargeOutputDarkWidget extends StatefulWidget {
  const UserRatingLargeOutputDarkWidget({
    super.key,
    double? userRating,
  }) : userRating = userRating ?? 0.0;

  final double userRating;

  @override
  State<UserRatingLargeOutputDarkWidget> createState() =>
      _UserRatingLargeOutputDarkWidgetState();
}

class _UserRatingLargeOutputDarkWidgetState
    extends State<UserRatingLargeOutputDarkWidget> {
  late UserRatingLargeOutputDarkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRatingLargeOutputDarkModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, index) => const Icon(
        Icons.star_rounded,
        color: Color(0xFFF609F0),
      ),
      direction: Axis.horizontal,
      rating: widget.userRating,
      unratedColor: FlutterFlowTheme.of(context).secondaryText,
      itemCount: 5,
      itemSize: 25.0,
    );
  }
}
