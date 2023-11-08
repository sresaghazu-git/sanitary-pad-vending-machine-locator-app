import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:sanitary_pad_vending_machine_locator_app/screens/vending_machine_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext scaffoldContext) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 250, 211, 223),
            actions: [
              Builder(
                builder: (BuildContext scaffoldContext) {
                  return IconButton(
                    icon: const Icon(Icons.menu), // Hamburger icon
                    onPressed: () {
                      Scaffold.of(scaffoldContext).openDrawer();
                    },
                  );
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Enter location...',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          // Handle notifications here
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              // Google Map (use GoogleMap widget)
              Expanded(
                child: MapScreen(
                  initialCameraPosition: const CameraPosition(
                    target:
                        LatLng(37.7749, -122.4194), // Initial map coordinates
                    zoom: 14.0, // Initial zoom level
                  ),
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/women1.png'),
                        radius: 20,
                      ),
                      SizedBox(width: 10), // Adds some spacing
                      Text(
                        'Guest User',
                        style: TextStyle(
                          color: Color.fromARGB(255, 181, 179, 179),
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('Vending Machines'),
                  onTap: () {
                    Navigator.pop(context); // Closes the drawer
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VendingMachineList()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('Contact Us'),
                  onTap: () {
                    Navigator.pop(context); // Closes the drawer
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VendingMachineList()),
                  );
                },
              ),
              const Text('Nearby Vending Machines'), // Label
            ],
          ),
        );
      },
    );
  }
}

class MapScreen extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition initialCameraPosition;

  MapScreen({
    Key? key,
    required this.initialCameraPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
