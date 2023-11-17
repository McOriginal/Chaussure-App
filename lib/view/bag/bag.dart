import 'package:chaussure/data/dummy_data.dart';
import 'package:chaussure/models/shoe_model.dart';
import 'package:chaussure/theme/custom_app_theme.dart';
import 'package:chaussure/utils/app_methods.dart';
import 'package:chaussure/utils/constants.dart';
import 'package:chaussure/view/bag/compoment/empty_style.dart';
import 'package:flutter/material.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  // ********
  int lengthsOfItemsOnBag = itemsOnBag.length;
  // ********
  @override
  Widget build(BuildContext context) {
    // ***************
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // ***************

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: width,
          height: height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Column(
                  children: [
                    itemsOnBag.isEmpty
                        ? const EmptyState()
                        : _bagAppBar(width, height),
                    _maiProductLists(width, height),
                    _buttonInfos(width, height),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buttonInfos(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.13,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TOTAL",
                style: AppThemes.bagTotalPrice,
              ),
              Text(
                "\$${AppMethods.allItemsOnBags()}",
                style: AppThemes.bagSumOfItemOnBag,
              ),
            ],
          ),
          const SizedBox(height: 15),
          materialButton(width, height),
        ],
      ),
    );
  }

// Material Button *******************
  materialButton(width, height) {
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: width / 1.2,
      height: height / 15,
      color: AppConstantsColor.materialButtonColor,
      child: const Text(
        "NEXT",
        style: TextStyle(
          color: AppConstantsColor.ligthTextColor,
        ),
      ),
    );
  }

// Products Lists **************
  Widget _maiProductLists(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.6,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: itemsOnBag.length,
          itemBuilder: (context, index) {
            ShoeModel currentBagItem = itemsOnBag[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              width: width,
              height: height * 0.2,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: currentBagItem.modelColor.withOpacity(0.9),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 15,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(-40 / 360),
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Image(
                                image: AssetImage(currentBagItem.imgAdress),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentBagItem.model,
                        style: AppThemes.bagProductModel,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${currentBagItem.price}",
                        style: AppThemes.bagProductPrice,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemsOnBag.remove(currentBagItem);
                                lengthsOfItemsOnBag = itemsOnBag.length;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("1", style: AppThemes.bagProductPrice),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

// Bag AppBar *********************
  SizedBox _bagAppBar(double width, double height) {
    return SizedBox(
        width: width,
        height: height / 14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "My Bag",
              style: AppThemes.bagTitle,
            ),
            Text(
              "Total $lengthsOfItemsOnBag Items",
              style: AppThemes.bagTotalPrice,
            )
          ],
        ));
  }
}
