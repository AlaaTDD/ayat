import 'package:flutter/material.dart';
import '../../models/model_list_grid.dart';
import '../customs/custom_text.dart';
import '../customs/scale_animation_item.dart';
import '../resorces/routes_manager.dart';

class MainListHome extends StatelessWidget {
  const MainListHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        itemCount: modelListGrid.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8
        ),
        itemBuilder: (BuildContext context, int index) {
          return ScaleAnimationItem(
            index: index,
            child: GestureDetector(
              onTap: (){
                switch (modelListGrid[index]["id"]) {
                  case "1":
                    Navigator.pushNamed(context, Routes.azkaspahRoute);
                    break;
                  case "2":
                    Navigator.pushNamed(context, Routes.azkamassRoute);
                    break;
                  case "3":
                    Navigator.pushNamed(context, Routes.sphaRoute);
                  case "4":
                    Navigator.pushNamed(context, Routes.markRoute);
                    break;
                  case "5":
                    Navigator.pushNamed(context, Routes.updateRoute);
                    break;
                  case "6":
                    Navigator.pushNamed(context, Routes.infoRoute);
                    break;
                  case "7":
                    Navigator.pushNamed(context, Routes.settingRoute);
                    break;
                  default:
                }
              },
              child: Container(
                height: 200,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),

                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(modelListGrid[index]["image"]),
                    )),
                    Container(
                      decoration: BoxDecoration(
                        color:Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CustomText(
                          name: modelListGrid[index]["text"],
                          height: 30,
                          alignmentGeometry: Alignment.center,
                          fontWeight: FontWeight.w700,
                          font: 12),
                    ),
                  ],
                ),
              ),
            ),
          );
        },),
    );
  }
}
