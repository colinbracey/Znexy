import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'user_rating_large_copy_model.dart';
export 'user_rating_large_copy_model.dart';

class UserRatingLargeCopyWidget extends StatefulWidget {
  const UserRatingLargeCopyWidget({
    super.key,
    double? userRating,
  }) : userRating = userRating ?? 0.0;

  final double userRating;

  @override
  State<UserRatingLargeCopyWidget> createState() =>
      _UserRatingLargeCopyWidgetState();
}

class _UserRatingLargeCopyWidgetState extends State<UserRatingLargeCopyWidget> {
  late UserRatingLargeCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRatingLargeCopyModel());

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

    return RatingBarIndicator(
      itemBuilder: (context, index) => const Icon(
        Icons.star_rounded,
        color: Color(0xFFF609F0),
      ),
      direction: Axis.horizontal,
      rating: valueOrDefault<double>(
        widget.userRating,
        0.0,
      ),
      unratedColor: Colors.white,
      itemCount: 5,
      itemSize: 25.0,
    );
  }
}
