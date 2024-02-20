import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'empty_shopping_cart_model.dart';
export 'empty_shopping_cart_model.dart';

class EmptyShoppingCartWidget extends StatefulWidget {
  const EmptyShoppingCartWidget({super.key});

  @override
  State<EmptyShoppingCartWidget> createState() =>
      _EmptyShoppingCartWidgetState();
}

class _EmptyShoppingCartWidgetState extends State<EmptyShoppingCartWidget> {
  late EmptyShoppingCartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyShoppingCartModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
          child: Lottie.asset(
            'assets/lottie_animations/Animation_-_1706246288715.json',
            width: 300.0,
            height: 300.0,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Shopping cart is empty',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
