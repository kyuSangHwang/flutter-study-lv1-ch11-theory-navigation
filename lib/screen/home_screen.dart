import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      /*
      * onWillPop
      * async 를 무조건 해줘야 한다.
      * true : pop 가능
      * false : pop 불가능
      * 안드로이드에서는 앱 처음 실행 후 뒤로 가기를 하면 앱이 종료되는 경우가 있기 때문에 이 설정이 필요한 경우가 있다.
      */
      onWillPop: () async {
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
        title: "Home Screen",
        children: [
          ElevatedButton(
            onPressed: () {
              /*
              * canPop: 현재 route 에서 pop 을 할 수 있는지 bool 으로 반환해준다.
              */
              print(Navigator.of(context).canPop());
            },
            child: const Text('can pop'),
          ),
          ElevatedButton(
            onPressed: () {
              /*
              * maybePop: route 안에 route 가 있을 때만 뒤로 간다.
              */
              Navigator.of(context).maybePop();
            },
            child: const Text('maybe Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('pop'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => const RouteOneScreen(
                          number: 123,
                        )),
              );

              print(result);
            },
            child: const Text(
              "Push",
            ),
          )
        ],
      ),
    );
  }
}
