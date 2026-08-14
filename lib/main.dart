import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

void main() => runApp(const MaterialApp(home: FakeCallScreen()));

class FakeCallScreen extends StatelessWidget {
  const FakeCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Simulate Fake Call"),
          onPressed: () {
            FlutterRingtonePlayer.play(android: AndroidSounds.ringtone, looping: true);
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Incoming Call"),
                content: const Text("Dad is calling..."),
                actions: [
                  TextButton(onPressed: () { FlutterRingtonePlayer.stop(); Navigator.pop(ctx); }, child: const Text("End Call"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
