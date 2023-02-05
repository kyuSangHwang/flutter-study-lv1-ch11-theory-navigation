import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

import '../main.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two Screen',
      children: [
        Text(
          'argument: $arguments',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          },
          child: const Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            /*
            * pushReplacement: push 하면서 바로 이전의 route 를 삭제한다.
            * [HomeScreen(), RouteOneScreen(), RouteThreeScreen()]
            */
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const RouteThreeScreen(),
              ),
            );
          },
          child: const Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/three',
            );
          },
          child: const Text('Push ReplacementNamed'),
        ),
        ElevatedButton(
          onPressed: () {
            /*
            * pushAndRemoveUntil
            * (route)에 false return 하면 이전의 모든 route 를 삭제한다.
            * (route)에 true return 하면 이전의 모든 route 를 가지고 있는다.
            * (route)에 route.settings.name == A 라고 한다면 push 해서 가지고 있는 route 중에 A 이면 살리고 나머지는 삭제한다. (argument 도 있음)
            */
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => const RouteThreeScreen(),
              ),
              (route) => route.settings.name == HOME_ROUTE,
            );
          },
          child: const Text('push And Remove Until'),
        ),
      ],
    );
  }
}
