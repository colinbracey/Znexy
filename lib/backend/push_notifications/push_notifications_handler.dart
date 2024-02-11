import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? const Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFFF609F0),
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'StartPage': ParameterData.none(),
  'SigninPage': ParameterData.none(),
  'Splash': ParameterData.none(),
  'Onboarding': ParameterData.none(),
  'LoginEmail': ParameterData.none(),
  'RegisterEmail': ParameterData.none(),
  'AddHelpRequestFull': ParameterData.none(),
  'AddHelpRequest': ParameterData.none(),
  'RequestDetail': (data) async => ParameterData(
        allParams: {
          'thisRequestDocRef':
              getParameter<DocumentReference>(data, 'thisRequestDocRef'),
        },
      ),
  'Profile': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'RequestOffers': (data) async => ParameterData(
        allParams: {
          'thisRequestDocRef':
              getParameter<DocumentReference>(data, 'thisRequestDocRef'),
        },
      ),
  'UsersReviews': (data) async => ParameterData(
        allParams: {
          'userIdRef': getParameter<DocumentReference>(data, 'userIdRef'),
        },
      ),
  'RequestOfferDetail': (data) async => ParameterData(
        allParams: {
          'offerDocRef': getParameter<DocumentReference>(data, 'offerDocRef'),
        },
      ),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'AllChatsPage': ParameterData.none(),
  'ShoppingCart': ParameterData.none(),
  'UserProfile': (data) async => ParameterData(
        allParams: {
          'userDocRef': getParameter<DocumentReference>(data, 'userDocRef'),
        },
      ),
  'MyOffers': ParameterData.none(),
  'AcceptedOfferRequester': (data) async => ParameterData(
        allParams: {
          'thisOffertDocRef':
              getParameter<DocumentReference>(data, 'thisOffertDocRef'),
        },
      ),
  'CongratulationsOfferAccepted': ParameterData.none(),
  'AcceptedOfferOfferer': (data) async => ParameterData(
        allParams: {
          'thisOffertDocRef':
              getParameter<DocumentReference>(data, 'thisOffertDocRef'),
        },
      ),
  'HelpRequests': ParameterData.none(),
  'AcceptedOfferOffererCopy': (data) async => ParameterData(
        allParams: {
          'thisOffertDocRef':
              getParameter<DocumentReference>(data, 'thisOffertDocRef'),
        },
      ),
  'RequestDetailCopy': (data) async => ParameterData(
        allParams: {
          'thisRequestDocRef':
              getParameter<DocumentReference>(data, 'thisRequestDocRef'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
