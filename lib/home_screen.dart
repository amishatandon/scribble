import 'package:flutter/material.dart';
import 'package:scribble_io/create_room_screen.dart';
import 'package:scribble_io/join_room_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Create/join a room to play!!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateRoomScreen(),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  textStyle: WidgetStateProperty.all(
                    const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  maximumSize: WidgetStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width / 2.5,
                      50,
                    ),
                  ),
                ),
                child: const Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const JoinRoomScreen(),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  textStyle: WidgetStateProperty.all(
                    const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  maximumSize: WidgetStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width / 2.5,
                      50,
                    ),
                  ),
                ),
                child: const Text(
                  "Join",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
