import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sismos',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sismos"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text(
                "Mapa",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                "Lista",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMapSection(),
          _buildCommentsSection(),
        ],
      ),
      bottomNavigationBar: _buildNavigatorButton(),
    );
  }

  Widget _buildMapSection() {
    return Center(
      child: Container(
        width: 500,
        height: 800,
        color: const Color.fromARGB(105, 33, 149, 243).withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
              image: AssetImage('assets/images/mapcr.jpg'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '24 horas',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '15 días',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsSection() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Usuario $index'),
          subtitle: const Text('Hola Hola Hola'),
        );
      },
    );
  }

  Widget _buildNavigatorButton() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.locationArrow),
          label: 'Sismos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hearing),
          label: '¿Lo sentiste?',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'Más',
        ),
      ],
      onTap: (index) {},
    );
  }
}
