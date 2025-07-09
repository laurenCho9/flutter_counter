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
// TODO: @override
// @override는 "이 메소드는 부모 클래스로부터 물려받은 메소드를 재정의(덮어쓰기)하는 것입니다" 라고
// 명시적으로 알려주는 애너테이션(Annotation) 또는 표시입니다.
// ❗️쉽게 말해, '실수 방지용 스티커'라고 생각하면 좋습니다.
// ❗️@override가 없을 경우, 그냥 새로운 메소드를 만든 것으로 인식되어 오류가 발생하지 않습니다.
// 요약하자면 주요 역할로 다음 2가지가 있습니다.
// 1. 실수 방지(컴파일러 체크)
// 2. 코드 가독성 향상
// FIXME: 요약
// MyApp 클래스는 상태가 없는 정적인 위젯으로, 앱이 실행되면 MaterialApp 이라는 큰 틀을 그립니다.
// 이 틀 안에는 앱의 제목, 초록색 기반의 자동 생성 테마, 그리고 MyHomePage라는 첫 화면이 포함되어 있습니다.
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

// ANCHOR: MyHomePage 위젯은 앱의 첫 번째 화면을 구성하는 StatefulWidget입니다.
// 이 코드는 동적인 데이터 변경이 가능한 **StatefulWidget**을 정의하는 부분입니다.
// StatelessWidget과 달리, 이 위젯은 사용자의 상호작용이나 데이터 변경에 따라 화면을 다시 그릴 수 있습니다.
// NOTE: class MyHomePage extends StatefulWidget
// StatefulWidget(상태가 있는 위젯)을 상속받아 MyHomePage라는 새로운 위젯 클래스를 만듭니다.
// 이 위젯은 내부적으로 변하는 상태를 가질 수 있으며, 그 상태가 변할 때마다 화면을 새로고침할 수 있습니다.
// NOTE: const MyHomePage({super.key, required this.title});
// MyHomePage 위젯의 생성자입니다.
// required this.title: 이 위젯을 생성할 때는 반드시 title이라는 이름의 값을 전달해야 함을 의미합니다. required 키워드로 필수 항목임을 명시합니다.
// NOTE: final String title;
// 부모 위젯(MyApp)으로부터 전달받은 title 값을 저장하는 불변(immutable) 변수입니다.
// final 키워드는 이 title 값이 MyHomePage 위젯이 생성된 이후에는 절대 변경될 수 없음을 보장합니다. 위젯 자체의 설정값은 바뀌지 않는다는 것이 중요합니다.
// NOTE: ‼️@override State<MyHomePage> createState() => _MyHomePageState();
// StatefulWidget의 가장 핵심적인 부분입니다.
// 이 createState 메소드는 StatelessWidget의 build 메소드 대신 사용됩니다.
// 이 메소드의 역할은 위젯의 상태를 관리할 별도의 '상태(State)' 객체를 생성하고 반환하는 것입니다.
// => _MyHomePageState()는 _MyHomePageState 클래스의 인스턴스를 생성하여 반환하라는 의미입니다.
// 이 _MyHomePageState 클래스가 바로 화면에 표시될 UI를 구성(build)하고, 변경 가능한 데이터들을 실제로 관리하게 됩니다.
// FIXME: 요약
// MyHomePage 클래스는 상태를 가질 수 있는 위젯의 '설계도'와 같습니다. 이 설계도 자체는 title과 같은 고정된 설정값만 가지고 있습니다.
// ❗️진짜 중요한 역할은 createState() 메소드를 통해 _MyHomePageState라는 '상태 관리자' 객체를 생성하는 것입니다.
// 앞으로 보게 될 _MyHomePageState 클래스가 실제로 화면을 그리고 데이터를 변경하는 모든 작업을 처리하게 됩니다.
// 이처럼 Flutter는 **위젯의 설정(Widget)**과 **변경 가능한 상태(State)**를 두 개의 다른 클래스로 분리하여 코드를 체계적으로 관리합니다.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ANCHOR: _MyHomePageState는 상태를 관리하고 실제 화면을 그리는 가장 핵심적인 부분으로,
// MyHomePage가 '설계도'였다면, _MyHomePageState는 그 설계도를 바탕으로 만들어진 '살아있는' 집과 같다.
// NOTE: class _MyHomePageState extends State<MyHomePage>
// State 클래스를 상속받아 MyHomePage 위젯의 상태를 관리하는 _MyHomePageState 클래스를 만듭니다.
// ❗️클래스 이름 앞의 밑줄(_)은 이 클래스가 이 파일 안에서만 사용되는 비공개(private) 클래스임을 의미합니다.
// NOTE: int _counter = 0;
// 이 화면에서 변화하는 실제 데이터(상태) 입니다. _counter라는 정수 변수를 선언하고 0으로 초기화했습니다. ❗️이 숫자가 바뀔 때마다 화면도 함께 바뀝니다.
// NOTE: void _incrementCounter() 와 void _decrementCounter()
// _counter 값을 변경하는 함수들입니다.
// ❗️여기서 가장 중요한 것은 setState() 함수입니다.
// setState(() { ... });: Flutter에서 상태를 변경하는 유일하고 올바른 방법입니다.
// setState 내에서 _counter 값을 증가시키거나 감소시킵니다.
// setState는 Flutter 프레임워크에게 "여기 데이터가 바뀌었어!"라고 알립니다.
// 알림을 받은 프레임워크는 화면을 새로고침하기 위해 build 메소드를 다시 호출합니다.
// 결과적으로 _counter의 최신 값이 화면에 반영됩니다.
// TODO: build 메소드 상세 분석 (화면 그리기)
// build 메소드는 현재 상태(_counter 값)를 기반으로 UI를 어떻게 그릴지 결정합니다.
// NOTE: return Scaffold(...)
// 머티리얼 디자인의 기본 구조를 제공하는 Scaffold 위젯을 반환합니다.
// NOTE: appBar: AppBar(...)
// ‼️화면 상단의 앱 바를 정의합니다.
// backgroundColor: Colors.pink[100]: 앱 바의 배경색을 연한 핑크색으로 지정합니다.
// title: Text(widget.title): 앱 바의 제목을 표시합니다.
// 여기서 widget.title은 부모 위젯인 MyHomePage가 가지고 있던 title 값에 접근하는 방법입니다.
// 이처럼 State 클래스에서는 widget.을 통해 자신의 짝인 StatefulWidget의 프로퍼티를 참조할 수 있습니다.
// NOTE: body: Center(...)
// 화면의 중앙 본문 영역입니다. Center 위젯으로 자식 위젯을 중앙에 배치하고, Column 위젯으로 텍스트들을 세로로 나열합니다.
// Text('$_counter', ...): 현재 _counter 변수의 값을 텍스트로 표시합니다. setState가 호출될 때마다 이 부분이 새로운 값으로 업데이트됩니다.
// FIXME: ‼️요약
// _MyHomePageState 클래스는 다음과 같은 일을 합니다.
// 1. 데이터를 가진다 (_counter).
// 2. 데이터를 변경하는 함수를 정의한다 (_incrementCounter 등).
// 3. 데이터가 변경되면 setState를 호출하여 화면 갱신을 요청한다.
// 4. ✨build 메소드를 통해 현재 데이터에 맞는 최신 UI를 그려낸다.
// REVIEW: ‼️질문! class _MyHomePageState는 왜 앞에 언더바가 붙어?
// 클래스나 변수 이름 앞에 붙는 언더바(_)는 Dart 언어에서 **비공개(private)**를 의미하는 약속입니다.
// 즉, _MyHomePageState 클래스는 이 파일 안에서만 사용할 수 있다는 뜻입니다.
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
