import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // 이 위젯은 애플리케이션의 루트입니다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ANCHOR: This is the theme of your application.
        // NOTE: 이것이 귀하의 신청서의 주제입니다.
        //
        // ANCHOR: TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        // NOTE: 이렇게 해 보세요: "flutter run"으로 애플리케이션을 실행해 보세요.
        // 애플리케이션에 보라색 툴바가 표시됩니다. 앱을 종료하지 않고
        // 아래 colorScheme의 seedColor를 Colors.green으로 변경한 후
        // "hot reload"를 호출해 보세요(변경 사항을 저장하거나 Flutter 지원 IDE에서 "hot reload" 버튼을 누르거나,
        // FIXME: 명령줄을 사용하여 앱을 시작한 경우 "r"을 누르세요).
        // TODO: 터미널의 dart창에서 "r"을 누르면 hot reload(수정된 사항만 리렌더링) 됩니다.
        //
        // ANCHOR: Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        // NOTE: 카운터가 0으로 재설정되지 않은 것을 확인하세요. 애플리케이션
        // 상태는 다시 로드하는 동안 손실되지 않습니다. 상태를 재설정하려면
        // hot restart를 대신 사용하세요.
        // TODO: 터미널의 dart창에서 "shift + r"을 누르면 hot restart(전체 새로고침) 됩니다.
        //
        // ANCHOR: This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // NOTE: 이 기능은 값뿐만 아니라 코드에도 적용됩니다. 대부분의 코드 변경 사항은
        // hot reload(수정된 사항만 리렌더링)만으로 테스트할 수 있습니다.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // ANCHOR: This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // NOTE: 이 위젯은 애플리케이션의 홈페이지입니다. 상태가 유지됩니다.
  // 즉, 위젯의 모양에 영향을 미치는 필드가 포함된 State 객체(아래에 정의됨)를 가집니다.

  // ANCHOR: This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  // NOTE: 이 클래스는 상태의 구성입니다.
  // 부모(이 경우 App 위젯)에서 제공하고 State의 build 메서드에서 사용하는 값(이 경우 제목)을 보관합니다.
  // 위젯 하위 클래스의 필드는 항상 "최종"으로 표시됩니다.

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // ANCHOR: This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // NOTE: 이 setState 호출은 Flutter 프레임워크에 이 State에서 무언가 변경되었음을 알립니다.
      // 그러면 Flutter 프레임워크는 아래 build 메서드를 다시 실행하여 업데이트된 값을 화면에 반영합니다.
      // setState()를 호출하지 않고 _counter를 변경하면 build 메서드가 다시 호출되지 않으므로 아무 일도 일어나지 않는 것처럼 보입니다.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ANCHOR: This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    // NOTE: 이 메서드는 setState가 호출될 때마다 다시 실행됩니다. 예를 들어 위의 _incrementCounter 메서드에서처럼요.

    // ANCHOR: The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // NOTE: Flutter 프레임워크는 빌드 메서드를 빠르게 재실행할 수 있도록 최적화되어
    // 위젯 인스턴스를 개별적으로 변경할 필요 없이 업데이트가 필요한 부분만 다시 빌드하면 됩니다.
    return Scaffold(
      appBar: AppBar(
        // ANCHOR: TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // NOTE: 이렇게 해 보세요: 여기 색상을 특정 색상(예: Colors.amber 와 같은 색으로)으로 변경하고
        // hot reload(수정된 사항만 리렌더링)를 실행하면
        // AppBar 색상이 변경되는 반면 다른 색상은 그대로 유지되는 것을 확인할 수 있습니다.
        // FIXME: backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // TODO: Theme.of(context)는 현재 위젯의 위치에서 가장 가까운 Theme 위젯의 데이터를 가져옵니다.
        // TODO: colorScheme는 앱의 전체적인 색상 조합을 정의하는 규칙입니다.
        // 예전에는 primaryColor, accentColor 등을 직접 지정했지만,
        // 다크 모드 지원 등 더 체계적인 색상 관리를 위해 ColorScheme이 도입되었습니다.
        // TODO: inversePrimary는 이름 그대로 primary 색상의 반전(inverse)된 용도로 사용되는 색상입니다.
        // 주로 primary 색상 위에 올라가는 콘텐츠(텍스트, 아이콘 등)가 잘 보이도록 하기 위해 사용됩니다.
        // 예를 들어:
        // 앱의 primary 색상이 어두운 파란색이라면, inversePrimary는 보통 밝은 흰색 계열로 설정됩니다.
        // 앱의 primary 색상이 밝은 노란색이라면, inversePrimary는 어두운 회색이나 검은색 계열로 설정됩니다.
        // (근데 지금 초록색 배경이던데??)
        backgroundColor: Colors.pink[100],
        // ANCHOR: Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // NOTE: 여기서는 App.build 메서드로 생성된 MyHomePage 객체의 값을 가져와 앱 바 제목을 설정하는 데 사용합니다.
        title: Text(widget.title),
      ),
      body: Center(
        // ANCHOR: Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // NOTE: Center는 레이아웃 위젯입니다. 하나의 자식 위젯을 가져와 부모 위젯의 가운데에 배치합니다.
        child: Column(
          // ANCHOR: Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          // NOTE: Column(세로줄)도 레이아웃 위젯입니다. 자식 위젯 목록을 가져와
          // 세로로 정렬합니다. 기본적으로 자식 위젯의 가로 크기에 맞춰 크기가 조정되며,
          // 부모 위젯의 높이와 같도록 조정합니다.
          //
          // ANCHOR: Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          // NOTE: 열에는 자체 크기와 자식 열의 위치 지정 방식을 제어하는 ​​다양한 속성이 있습니다.
          // 여기서는 mainAxisAlignment를 사용하여 자식 열의 세로 중앙 정렬을 수행합니다.
          // 여기서 주축은 세로 축입니다. 열은 세로 방향이기 때문입니다. (교차축은 가로 방향입니다.)
          // TODO: Axis는 중심선이라는 뜻.
          //
          // ANCHOR: TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          // NOTE: 다음을 시도해 보세요. "debug painting"을 호출하세요(IDE에서 "디버그 페인팅 전환"
          // FIXME: 동작을 선택하거나 콘솔에서 "p"를 누르세요).
          // 각 위젯의 와이어프레임을 확인하세요.
          // TODO: 터미널의 dart창에서 "p"을 누르면 위젯의 와이어프레임 선이 파란색으로 보여집니다.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // ANCHOR: This trailing comma makes auto-formatting nicer for build methods.
      // NOTE: 이 마지막 쉼표는 빌드 방법에 대한 자동 서식을 더욱 편리하게 만들어줍니다.
    );
  }
}
