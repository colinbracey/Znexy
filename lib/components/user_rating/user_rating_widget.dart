import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'user_rating_model.dart';
export 'user_rating_model.dart';

class UserRatingWidget extends StatefulWidget {
  const UserRatingWidget({
    super.key,
    double? userRating,
  }) : userRating = userRating ?? 0.0;

  final double userRating;

  @override
  State<UserRatingWidget> createState() => _UserRatingWidgetState();
}

class _UserRatingWidgetState extends State<UserRatingWidget> {
  late UserRatingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRatingModel());

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
      unratedColor: const Color(0xFF142328),
      itemCount: 5,
      itemSize: 15.0,
    );
  }
}
