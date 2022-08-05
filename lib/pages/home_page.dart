import 'package:flutter/material.dart';
import 'package:minefield/pages/board_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80.0),
                  child: Image.asset('assets/images/logo.jpeg'),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                        child: const Card(
                          child: Center(
                            child: Text('Easy'),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const BoardPage(bombs: 8))),
                      ),
                      GestureDetector(
                        child: const Card(
                          child: Center(
                            child: Text('Normal'),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const BoardPage(bombs: 16))),
                      ),
                      GestureDetector(
                        child: const Card(
                          child: Center(
                            child: Text('Hard'),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const BoardPage(bombs: 24))),
                      ),
                      GestureDetector(
                        child: const Card(
                          child: Center(
                            child: Text('HardCore'),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const BoardPage(bombs: 32))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
