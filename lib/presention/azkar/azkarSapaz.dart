import 'package:flutter/material.dart';

import '../../models/azkar.dart';
import '../customs/appbar_custom.dart';
import '../customs/custom_text.dart';

class AzkaSapaz extends StatelessWidget {
  const AzkaSapaz({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, "أذكار الصباح"),
      body: ListView.builder(
        itemCount: azkar.length,
        itemBuilder: (context, index) {
          final item = azkar[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).shadowColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomText(
                      name: item['zekr'],
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      font: 16,
                      maxLines: 16,
                    ),
                    Divider(),
                    if (item['bless'] != '')
                      CustomText(
                        name: item['bless'],
                        fontWeight: FontWeight.w300,
                        textAlign: TextAlign.center,
                        font: 12,
                        maxLines: 16,
                      ),
                    CustomText(
                      name: item['repeat'].toString(),
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      font: 16,
                      maxLines: 16,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
