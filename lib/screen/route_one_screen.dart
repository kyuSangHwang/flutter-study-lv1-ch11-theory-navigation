import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({
    Key? key,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One Screen',
      children: [
        ElevatedButton(
          onPressed: () {
            print(Navigator.of(context).canPop());
          },
          child: const Text('can pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          child: const Text('maybe Pop'),
        ),
        Text(
          'arguments: ${number.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: const Text(
            "pop",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const RouteTwoScreen(),
                settings: const RouteSettings(
                  arguments: 789,
                ),
              ),
            );
          },
          child: const Text("push"),
        )
      ],
    );
  }
}
