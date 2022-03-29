import 'package:flutter/material.dart';
import 'list_restoran.dart';
class HomePage extends StatelessWidget {
  static const routeName= '/list_restauran';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString("assets/asset/local_restaurant.json"),
        builder: (context, snapshot) {
          final List<restauran> restaurans = parserestaurans(snapshot.data);
          return ListView.builder(
            itemCount: restaurans.length,
            itemBuilder: (context, index) {
              return _buildrestauranItem(context, restaurans[index]);
            },
          );
          },
      ),
    );
  }
}

Widget _buildrestauranItem(BuildContext context, restauran restauran){
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(restauran.pictureId, width: 100,),
    title: Text(restauran.name),
  );

}