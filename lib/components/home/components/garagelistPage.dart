import 'package:crna_flutter/components/home/components/garageModel.dart';
import 'package:flutter/material.dart';

import 'garageItemcard.dart';

class HotCoffeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, int key) {
          return MenuItemCard(index: key);
        },
      ),
    );
  }
}
