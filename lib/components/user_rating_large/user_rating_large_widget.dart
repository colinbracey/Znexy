import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'user_rating_large_model.dart';
export 'user_rating_large_model.dart';

class UserRatingLargeWidget extends StatefulWidget {
  const UserRatingLargeWidget({
    super.key,
    int? userRating,
  })  : userRating = userRating ?? 0;

  final int userRating;

  @override
  _UserRatingLargeWidgetState createState() => _UserRatingLargeWidgetState();
}

class _UserRatingLargeWidgetState extends State<UserRatingLargeWidget> {
  late UserRatingLargeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRatingLargeModel());

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
      rating: widget.userRating.toDouble(),
      unratedColor: const Color(0xFF142328),
      itemCount: 5,
      itemSize: 25.0,
    );
  }
}
