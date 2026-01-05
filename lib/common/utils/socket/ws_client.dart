import 'dart:async';
import 'dart:developer';
import 'package:centrifuge/centrifuge.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:travisgen_client/app/app_exception.dart';
import 'package:travisgen_client/common/constant/env.dart';
import 'package:travisgen_client/common/constant/hive_keys.dart';

@lazySingleton
class WsClient {
  final Box<dynamic> _authBox;

  WsClient(@Named(HiveKeys.authBox) Box<dynamic> authBox) : _authBox = authBox;

  Client? _client;

  StreamSubscription<ConnectedEvent>? _connectedSubscription;
  StreamSubscription<ConnectingEvent>? _connectingSubscription;
  StreamSubscription<ServerSubscribedEvent>? _subscribedSubscription;
  StreamSubscription<ServerPublicationEvent>? _publicationSubscription;
  StreamSubscription<DisconnectedEvent>? _disconnectedSubscription;

  void init() {
    try {
      _client = createClient(Env.wsUrl, ClientConfig(token: _authBox.get(HiveKeys.token) as String));

      _client?.connect();

      _listen();
    } catch (e) {
      log('WsClient: error $e');
    }
  }

  void _listen() {
    _connectingSubscription = _client?.connecting.listen((event) {
      log('WsClient: connecting');
    });

    _connectedSubscription = _client?.connected.listen((event) {
      log('WsClient: connected');
    });

    _subscribedSubscription = _client?.subscribed.listen((event) {
      log('WsClient: subscribed');
    });

    _publicationSubscription = _client?.publication.listen((event) {
      log('WsClient: publication');
      _listenPublication(event);
    });

    _disconnectedSubscription = _client?.disconnected.listen((event) {
      log('WsClient: disconnected');
    });
  }

  void _listenPublication(ServerPublicationEvent event) {
    try {} catch (e, st) {
      AppExceptionError('WsClient publication parsing error: $e\n$st');
    }
  }

  Future<void> dispose() async {
    final subscriptions = [
      _connectingSubscription?.cancel(),
      _connectedSubscription?.cancel(),
      _subscribedSubscription?.cancel(),
      _publicationSubscription?.cancel(),
      _disconnectedSubscription?.cancel(),
    ].where((element) => element != null).map((e) => e!);

    await Future.wait<void>(subscriptions);
    await _client?.disconnect();
  }
}
