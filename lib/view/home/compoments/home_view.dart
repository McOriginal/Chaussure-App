import 'package:chaussure/data/dummy_data.dart';
import 'package:chaussure/models/models.dart';
import 'package:chaussure/theme/custom_app_theme.dart';
import 'package:chaussure/utils/constants.dart';
import 'package:chaussure/view/detail_page.dart';
import 'package:chaussure/view/home/compoments/home_appBar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // *************
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 0;
  // *************
  @override
  Widget build(BuildContext context) {
    // *************
    Size size = MediaQuery.of(context).size;
    // *************
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(height: size.height * 0.01),
            _maiShoesList(size),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _morText(),
                    _bottomSideCategory(size),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// ########################### Bottom Side Gategory ############
  SizedBox _bottomSideCategory(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: availableShoe.length,
        itemBuilder: (context, index) {
          ShoeModel model = availableShoe[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsView(
                    model: model,
                    isComeFromMoreSection: true,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 4,
                    child: Container(
                      color: Colors.red,
                      width: size.width / 13,
                      height: size.height / 10,
                      child: const RotatedBox(
                        quarterTurns: -1,
                        child: Center(
                          child: Text(
                            "News",
                            style: AppThemes.homeGridNewText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: AppConstantsColor.darkTextColor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 5,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(-20 / 360),
                      child: Hero(
                        tag: model.model,
                        child: Image(
                          image: AssetImage(model.imgAdress),
                          width: size.width * 0.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 21,
                    child: FittedBox(
                      child: Text(
                        "${model.name} ${model.model}",
                        style: AppThemes.homeGridNameAndModel,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    child: Text(
                      "\$${model.price.toStringAsFixed(2)}",
                      style: AppThemes.homeGridPrice,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

//  ############ More Text #############""
  Padding _morText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Plus..",
            style: AppThemes.homeMoreText,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_double_arrow_right_rounded,
              size: 27,
            ),
          )
        ],
      ),
    );
  }

// ###################### Main Shoes List ##################################
  Row _maiShoesList(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          width: size.width / 16,
          height: size.height / 2.4,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfFeatured = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                    ),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfFeatured == index ? 21 : 18,
                        color: selectedIndexOfFeatured == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedColor,
                        fontWeight: selectedIndexOfFeatured == index
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // #############
        SizedBox(
          width: size.width * 0.89,
          height: size.height * 0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: availableShoe.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              ShoeModel model = availableShoe[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsView(
                        model: model,
                        isComeFromMoreSection: false,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: size.width / 1.5,
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.005,
                    vertical: size.height * 0.01,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: size.width / 1.81,
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              model.name,
                              style: AppThemes.homeProductName,
                            ),
                            SizedBox(
                              width: size.width * 0.3,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 10,
                        child: Text(
                          model.model,
                          style: AppThemes.homeProductModel,
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: Text(
                          "\$${model.price.toStringAsFixed(2)}",
                          style: AppThemes.homeProductPrice,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Hero(
                          tag: model.imgAdress,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(-30 / 360),
                            child: SizedBox(
                              width: 250,
                              height: 330,
                              child: Image(
                                image: AssetImage(model.imgAdress),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 160,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 35,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

// Categories View
  Widget _categoryView(Size size) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexOfCategory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: selectedIndexOfCategory == index ? 21 : 18,
                      color: selectedIndexOfCategory == index
                          ? AppConstantsColor.darkTextColor
                          : AppConstantsColor.unSelectedColor,
                      fontWeight: selectedIndexOfCategory == index
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
