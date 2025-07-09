// ANCHOR: Flutter 애플리케이션 개발의 핵심적인 부분으로,
// 구글의 머티리얼 디자인(Material Design) 시스템을 구현하는 데 필요한 위젯과 도구들의 포괄적인 라이브러리를 가져옵니다.
// 즉, 구글 디자인 가이드에 따른 사용자 인터페이스(UI)를 구축하기 위한 기본 구성 요소들을 제공합니다.
import 'package:flutter/material.dart';

// ANCHOR: main 함수는 Dart 언어의 약속된 진입점(entry point)입니다.
// NOTE: void main()
// 프로그램이 시작될 때 가장 먼저 실행됩니다.
// void는 이 함수가 아무런 값도 반환하지 않음을 의미합니다.
// NOTE: runApp()
// Flutter 프레임워크가 제공하는 핵심 함수입니다.
// 전달받은 위젯(Widget)을 화면의 루트(root) 위젯으로 만들어 전체 화면을 그리도록 지시하는 역할을 합니다.
// 이 함수를 통해 비로소 우리가 만든 위젯이 화면에 나타나게 됩니다.
// NOTE: const MyApp()
// "앱이 시작되면, MyApp이라는 위젯을 화면 전체에 그려줘" 라는 의미를 가집니다.
// 이 한 줄이 Flutter 앱의 생명을 불어넣는 첫 단계입니다.
void main() {
  runApp(const MyApp());
}

// ANCHOR: Flutter 애플리케이션의 최상위 뼈대를 정의하는 MyApp 위젯입니다. 앱의 기본적인 설정과 첫 화면을 지정하는 역할을 하죠.
// NOTE: class MyApp extends StatelessWidget
// StatelessWidget (상태가 없는 위젯)을 상속받아 MyApp이라는 새로운 위젯 클래스를 만듭니다.
// StatelessWidget은 한번 그려진 후에는 내부적으로 상태가 변하지 않는 정적인 위젯으로써,
// 이 위젯은 오직 부모 위젯으로부터 전달받은 값(설정)에 의해서만 모습이 결정됩니다.
// NOTE: const MyApp({super.key});
// MyApp 위젯의 생성자입니다. const로 선언되어 성능 최적화에 기여합니다.
// {super.key}는 부모 클래스인 StatelessWidget에 key 값을 전달하는 부분입니다.
// Key는 Flutter가 위젯들을 효율적으로 식별하고 관리하기 위해 사용됩니다.
// NOTE: @override Widget build(BuildContext context)
// build 메소드는 StatelessWidget이 화면에 그려져야 할 때 Flutter 프레임워크에 의해 자동으로 호출됩니다.
// ❗️이 메소드는 실제로 화면에 표시될 위젯을 반환해야 합니다.
// BuildContext context는 위젯 트리에서 현재 위젯의 위치와 관련된 정보를 담고 있는 중요한 객체입니다.
// NOTE: return MaterialApp(...)
// build 메소드가 MaterialApp 위젯을 반환합니다. MaterialApp은 머티리얼 디자인을 사용하는 앱을 만들기 위한 필수적인 최상위 위젯으로, 앱의 핵심 기능을 설정합니다.
// title: 'Flutter Demo': 앱의 전반적인 제목입니다. 보통 기기의 앱 전환기 등에서 사용자에게 표시됩니다.
// theme: ThemeData(...): 앱 전체에 적용될 디자인 테마를 설정합니다.
// colorScheme: ColorScheme.fromSeed(seedColor: Colors.green): Material 3에서 도입된 방식으로,
// seedColor(씨앗 색)로 Colors.green을 지정하면 Flutter가 이 색을 기반으로 조화로운 전체 색상 팔레트(기본색, 강조색 등)를 자동으로 생성해줍니다.
// home: const MyHomePage(...): 앱이 처음 실행될 때 가장 먼저 보여줄 화면을 지정합니다.
// 여기서는 MyHomePage라는 또 다른 커스텀 위젯을 첫 화면으로 설정하고, 'Flutter Demo Home Page'라는 title 값을 전달하고 있습니다.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // - 기능 구현
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
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
      // FIXME: Scaffold에 floatingActionButtonLocation를 추가해 좌측의 버튼이 좌측으로 쏠리는 현상을 해결.
      // (좌우 여백이 이제야 균등해짐)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // NOTE: floatingActionButton이 두개 이상일 경우 Row(가로 정렬), Column(세로 정렬) 위젯으로 감싸야 한다.
      floatingActionButton: Padding(
        // NOTE: Padding 위젯은 자식 위젯에 여백을 추가하는데 사용됩니다.
        // EdgeInsets.fromLTRB는 클래스의 생성자(constructor) 중 하나로, 네 방향의 여백을 각각 지정할 때 사용합니다.
        //fromLTRB는 이름 그대로 Left, Top, Right, Bottom의 약자입니다.
        // 좌우에 16px 여백을 줍니다.
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
        child: Row(
          // NOTE: 버튼을 감싼 container에 대해 정렬 적용.
          // css의 flex 스타일에서 사용하는 justify-content: space-between; 등과 유사하다.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              // NOTE: 구글 폰트에서 아이콘들 볼 수 있다. 소문자로 입력하되, 띄어쓰기가 있는 아이콘의 경우 _언더바로 대체.
              child: const Icon(Icons.remove),
              // NOTE: 고유한 heroTag를 추가.
              // 왜 필요한가?
              // FloatingActionButton은 기본적으로 그 애니메이션(Hero) 기능을 내장하고 있기 때문에,
              // 한 화면에 두 개 이상의 버튼이 있으면, 애니메이션을 안쓰더라도 Flutter는 내부적으로 각 버튼을 구분하려고 시도하기 때문에
              // 필수로 각각의 heroTag를 지정해줘야 합니다.
              heroTag: 'decrement',
            ),
            // NOTE: 버튼 사이에 약간의 공간 추가.
            // (Optional이고, MainAxisAlignment.spaceBetween을 사용했기 때문에 지워야 하지만, 공부를 위해 남겨둠.)
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
              heroTag: 'increment', // NOTE: 고유한 heroTag를 추가.
            ),
          ],
        ),
      ),
    );
  }
}
