import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'user_rating_large_output_model.dart';
export 'user_rating_large_output_model.dart';

class UserRatingLargeOutputWidget extends StatefulWidget {
  const UserRatingLargeOutputWidget({
    super.key,
    double? userRating,
  }) : userRating = userRating ?? 0.0;

  final double userRating;

  @override
  State<UserRatingLargeOutputWidget> createState() =>
      _UserRatingLargeOutputWidgetState();
}

class _UserRatingLargeOutputWidgetState
    extends State<UserRatingLargeOutputWidget> {
  late UserRatingLargeOutputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRatingLargeOutputModel());

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
      unratedColor: Colors.white,
      itemCount: 5,
      itemSize: 25.0,
    );
  }
}
