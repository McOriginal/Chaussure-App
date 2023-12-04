import 'package:chaussure/data/dummy_data.dart';
import 'package:chaussure/models/models.dart';
import 'package:chaussure/theme/custom_app_theme.dart';
import 'package:chaussure/utils/app_methods.dart';

import 'package:chaussure/utils/constants.dart';
import 'package:chaussure/view/compoments/app_bar.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView(
      {super.key, required this.model, required this.isComeFromMoreSection});

  final ShoeModel model;
  final bool isComeFromMoreSection;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
// **************
  bool _isCountrySelected = false;
  int? _isSizeSelecte;
// ***************
  @override
  Widget build(BuildContext context) {
    // ***************
    Size size = MediaQuery.of(context).size;
    // ***************
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: CustomDetailViewsAppBar(context),
        body: SizedBox(
          width: size.width,
          height: size.height * 1.1,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _topProductImageAndBg(size),
                _morePicOfProduct(size),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _productNameAndPrice(),
                      _productInfo(size.width, size.height),
                      // _moreDetailsText(size.width, size.height),
                      _sizeAndCountry(size),
                      _sizeButtonSelection(size),
                      // Add to Cart Button
                      _addToBagButton(size),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addToBagButton(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: MaterialButton(
          onPressed: () {
            AppMethods.addToCart(widget.model, context);
          },
          minWidth: size.height / 1.2,
          height: size.height / 15,
          // color: widget.model.modelColor,
          color: AppConstantsColor.materialButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "Add to BAG",
            style: TextStyle(
              color: AppConstantsColor.ligthTextColor,
            ),
          ),
        ),
      ),
    );
  }

// SizeButtonSelection *********************

  Widget _sizeButtonSelection(Size size) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      width: size.width,
      height: size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width / 4.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Try it",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 8),
                  RotatedBox(
                    quarterTurns: -1,
                    child: Icon(
                      Icons.wb_incandescent_sharp,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.7,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSizeSelecte = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _isSizeSelecte == index
                              ? Colors.black
                              : Colors.grey,
                          width: 1.5,
                        ),
                        color: _isSizeSelecte == index
                            ? Colors.black
                            : AppConstantsColor.backgroundColor,
                      ),
                      child: Center(
                        child: Text(
                          sizes[index].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _isSizeSelecte == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

// *********** Size And Country ****************

  Widget _sizeAndCountry(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Size",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstantsColor.darkTextColor,
              fontSize: 22,
            ),
          ),
          SizedBox(
            width: size.width * 0.45,
            height: size.height * 0.05,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isCountrySelected = false;
                    });
                  },
                  child: Text(
                    "UK",
                    style: TextStyle(
                      fontWeight: _isCountrySelected
                          ? FontWeight.w400
                          : FontWeight.bold,
                      color: _isCountrySelected
                          ? Colors.grey
                          : AppConstantsColor.darkTextColor,
                      fontSize: 19,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isCountrySelected = true;
                    });
                  },
                  child: Text(
                    "USA",
                    style: TextStyle(
                      fontWeight: !_isCountrySelected
                          ? FontWeight.w400
                          : FontWeight.bold,
                      color: !_isCountrySelected
                          ? Colors.grey
                          : AppConstantsColor.darkTextColor,
                      fontSize: 19,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // More Details ***************
  Widget _moreDetailsText(width, height) {
    return const Padding(
      padding: EdgeInsets.only(top: 12),
      child: Text(
        "Plus de detail...",
        style: AppThemes.detailsMorText,
      ),
    );
  }

  // about Shoes **************************
  Widget _productInfo(width, height) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: SizedBox(
        width: width,
        height: height / 15,
        child: Text(
          "Améliorez votre niveau avec des baskets pour homme innovantes aux designs audacieux. Découvrez des chaussures classiques et de nouveaux modèles ici.",
          style: AppThemes.detailsProductDescription,
        ),
      ),
    );
  }

  // About price and Compoments *****************
  _productNameAndPrice() {
    return Row(
      children: [
        Text(
          widget.model.model,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          "\$${widget.model.price.toStringAsFixed((2))}",
          style: AppThemes.detailsProductPrice,
        ),
      ],
    );
  }

  Widget _morePicOfProduct(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.1,
      color: Colors.grey[800],
      child: Row(
        children: List.generate(
          4,
          (index) => index == 3
              ? Container(
                  padding: const EdgeInsets.all(2),
                  width: size.width / 5,
                  height: size.height / 14,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: AssetImage(widget.model.imgAdress),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.grey.withOpacity(1),
                        BlendMode.darken,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      color: AppConstantsColor.ligthTextColor,
                      size: 30,
                    ),
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: roundedImage(size.width, size.height),
                ),
        ),
      ),
    );
  }

  Widget _topProductImageAndBg(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 60,
            bottom: 20,
            child: Container(
              width: size.width,
              height: size.height / 2.2,
              decoration: BoxDecoration(
                color: widget.model.modelColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(1500),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag: widget.model.imgAdress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image(
                    image: AssetImage(widget.model.imgAdress),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.model.imgAdress),
      ),
    );
  }
}
