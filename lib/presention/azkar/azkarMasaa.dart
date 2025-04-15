import 'package:flutter/material.dart';
import '../../models/azkar.dart';
import '../customs/appbar_custom.dart';
import '../customs/custom_text.dart';
import '../resorces/color_app.dart';
import '../resorces/size_app.dart';

class AzarMasa extends StatelessWidget {
  const AzarMasa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context, "أذكار المساء"),
      body: ListView.builder(
        itemCount: azkarMasa.length,
        itemBuilder: (context, index) {
          final item = azkarMasa[index];
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
                      font: getResponsiveFontSize(context,iphoneSize: 16,ipadMediumSize: 18,ipadLargeSize: 20),
                      maxLines: 16,
                    ),
                    Divider(),
                    if (item['bless'] != '')
                      CustomText(
                        name: item['bless'],
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        font: getResponsiveFontSize(context,iphoneSize: 12,ipadMediumSize: 14,ipadLargeSize: 16),
                        maxLines: 16,

                      ),
                    CustomText(
                      name: "التكرار (${item['repeat'].toString()})",
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      font: getResponsiveFontSize(context,iphoneSize: 12,ipadMediumSize: 14,ipadLargeSize: 16),
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
