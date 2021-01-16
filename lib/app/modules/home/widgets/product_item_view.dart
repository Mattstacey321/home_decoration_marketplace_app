import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';

class ProductItemView extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  ProductItemView({@required this.product, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    Color containerColor = Color(0xffB0C5BB);
    String name = product.name;
    String imagePath = product.imagePath;
    ProductType productType = product.type;
    double userRating = product.userRating;
    double price = product.price;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 300,
        width: 220,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 180,
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: containerColor.withOpacity(0.2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(productType.type, style: TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          Text(
                            r'$' "${price.toString()}",
                            style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Spacer(),
                          Container(
                            height: 40,
                            width: 40,
                            decoration:
                                BoxDecoration(shape: BoxShape.circle, color: AppColors.main200),
                            child: Icon(EvaIcons.heart, color: Colors.white, size: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 30,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imagePath,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Icon(EvaIcons.star, color: Colors.amber),
                          Text(
                            "($userRating)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
