import 'package:flutter/material.dart';
import 'package:my_second_app/form.dart';
import 'package:my_second_app/movie.dart';
import 'package:my_second_app/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
            indicatorWeight: 5,
            labelColor: Colors.blue,
            indicatorColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            controller: tabController,
            tabs: const [
              Tab(
                text: "FORM",
                icon: Icon(
                  Icons.person,
                  color: Colors.orange,
                ),
              ),
              Tab(
                text: "SEARCH",
                icon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
              ),
              Tab(
                text: "MOVIE",
                icon: Icon(
                  Icons.movie,
                  color: Colors.blue,
                ),
              ),
            ]),
      ),
      body: TabBarView(
          controller: tabController,
          children: const [FormPage(), SearchPage(), MoviePage()]),
    );
  }
}
