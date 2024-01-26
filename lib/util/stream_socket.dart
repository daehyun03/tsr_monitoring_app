/*
import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'constants.dart';


class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose(){
    _socketResponse.close();
  }
}

final StreamSocket streamSocket = StreamSocket();

void connectAndListen(){
  print("connecting...");
  IO.Socket socket = IO.io(BASE_URL + "/sio/VacuumPump1",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .build()
  );

  socket.onConnect((_) {
    print('connect');
  });
  socket.on("*", (data) => streamSocket.addResponse);
  socket.onDisconnect((_) => print('disconnect'));

}*/
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket createSocket(String url) {
  IO.Socket socket = IO.io(url,
      IO.OptionBuilder().setTransports(['websocket']).build());
  return socket;
}
