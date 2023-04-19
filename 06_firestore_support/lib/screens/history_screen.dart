import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator History"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseProvider.getHistory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Map<String, dynamic>> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = data[index];
                return ListTile(
                  title: Text(item[DatabaseProvider.COLUMN_EXPRESSION]),
                  subtitle: Text(item[DatabaseProvider.COLUMN_RESULT]),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
