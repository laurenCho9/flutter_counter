import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
