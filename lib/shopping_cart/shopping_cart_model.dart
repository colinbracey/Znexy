import '/components/empty_shopping_cart/empty_shopping_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shopping_cart_widget.dart' show ShoppingCartWidget;
import 'package:flutter/material.dart';

class ShoppingCartModel extends FlutterFlowModel<ShoppingCartWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EmptyShoppingCart component.
  late EmptyShoppingCartModel emptyShoppingCartModel;
  // Stores action output result for [Stripe Payment] action in bottomButton widget.
  String? paymentId;
  // Stores action output result for [Custom Action - updateRequestToPaid] action in bottomButton widget.
  bool? updatedShoppingCart;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emptyShoppingCartModel =
        createModel(context, () => EmptyShoppingCartModel());
  }

  @override
  void dispose() {
    emptyShoppingCartModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
