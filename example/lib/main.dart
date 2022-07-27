import 'package:flutter/material.dart';
import 'package:stopper/stopper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello")),
      body: Builder(
        builder: (context) {
          final h = MediaQuery.of(context).size.height;
          return Center(
              child: MaterialButton(
            color: Colors.green,
            child: const Text("Show Stopper"),
            onPressed: () {
              showStopper(
                context: context,
                stops: [0.4 * h, h],
                builder: (context, scrollController, scrollPhysics, stop) {
                  return ClipRRect(
                    borderRadius: stop == 0
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )
                        : const BorderRadius.only(),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      color: Colors.orange,
                      child: CustomScrollView(
                        slivers: <Widget>[
                          const SliverAppBar(
                            title: Text("What's Up?"),
                            backgroundColor: Colors.orange,
                            automaticallyImplyLeading: false,
                            primary: false,
                            floating: true,
                            pinned: true,
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, idx) => ListTile(
                                title: const Text("Nothing much"),
                                subtitle: Text("$idx"),
                              ),
                              childCount: 100,
                            ),
                          )
                        ],
                        controller: scrollController,
                        physics: scrollPhysics,
                      ),
                    ),
                  );
                },
              );
            },
          ));
        },
      ),
    );
  }
}
