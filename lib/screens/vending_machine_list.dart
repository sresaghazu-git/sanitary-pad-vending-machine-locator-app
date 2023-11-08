import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendingMachineList extends StatelessWidget {
  const VendingMachineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 211, 223),
        title: const Text(
          'Vending Machines',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Vending Machines')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(); // It displays a loading indicator while data is loading.
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text('No data available');
          } else {}

          final vendingMachines =
              snapshot.data!.docs; // List of documents in the collection

          return ListView.builder(
            itemCount: vendingMachines.length,
            itemBuilder: (context, index) {
              final machineData =
                  vendingMachines[index].data() as Map<String, dynamic>;

              final name = machineData['name'] as String;
              final address = machineData['address'] as String;
              final openingTime = machineData['opening_time'] as String;
              final sanitaryPadAvailability =
                  machineData['pad_availability'] as bool;

              return ListTile(
                title: Text(name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address: $address'),
                    Text('Opening Time: $openingTime'),
                    Text(
                        'Sanitary Pad Availability: ${sanitaryPadAvailability ? 'Available' : 'Not Available'}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
