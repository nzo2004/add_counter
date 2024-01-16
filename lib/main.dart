import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  final counter = HomeCounter();

  void _incrementCounter() {
    counter.increment();
  }

  void _decrementCounter() {
    counter.decrement();
  }

  void _resetCounter() {
    counter.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        //Değişen verileri anlık değiştirerek gösterir
        body: ValueListenableBuilder(
          valueListenable: counter,
          builder: (context, value, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$value',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: _decrementCounter,
              child: const Icon(Icons.remove),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: _resetCounter,
              child: const Icon(Icons.refresh_rounded),
            ),
          ],
        ));
  }
}

//ValueNotifier = belli bir değeri takip eden ve bu değer değiştiğinde bildirim gönderen bir sınıftır.
class HomeCounter extends ValueNotifier {
  HomeCounter() : super(0);

  void increment() {
    value++;
  }

  void decrement() {
    value == 0 ? 0 : value--;
  }

  void reset() {
    value = 0;
  }
}
