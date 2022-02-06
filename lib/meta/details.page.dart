import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/app/app_colors.dart';
import 'package:furniture_app/app/ext.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderCard(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Minimalist Chair",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const PriceRow(),
                  const SizedBox(
                    height: 15,
                  ),
                  const RatingsRow(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "Angel Furniture 39x18x18 inch Honey Semi Glossy Finish Wood Sitting Chair, AC-13 (Set of 2) is a premium quality product from Angel Furniture. Moglix is a well-known ecommerce platform for qualitative range of Dining Chairs. All Angel Furniture 39x18x18 inch Honey Semi Glossy Finish Wood Sitting Chair, AC-13 (Set of 2) are manufactured by using quality ecommerce platform for qualitative range of Dining Chairs. All Angel Furniture 39x18x18 inch Honey Semi Glossy Finish Wood Sitting Chair, AC-13 (Set of 2) are manufactured by using quality "),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: scaffoldBgColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: SvgPicture.asset("assets/bookmark.svg"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: primaryColor),
                        child: const Center(
                            child: Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RatingsRow extends StatelessWidget {
  const RatingsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          CupertinoIcons.star_fill,
          color: Colors.amber,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "4.5",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20),
        Text("(50 reviews)")
      ],
    );
  }
}

class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "\$ 299",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          "Quantity : 1",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.responsive(400),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/products/product.jpg"))),
        ),
        Positioned(
            top: context.responsive(30),
            left: context.responsive(5, axis: Axis.horizontal),
            child: const CustomAppBarButton(icon: CupertinoIcons.left_chevron)),
        Positioned(
            top: context.responsive(30),
            right: context.responsive(5, axis: Axis.horizontal),
            child: const CustomAppBarButton(icon: CupertinoIcons.share)),
      ],
    );
  }
}

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: scaffoldBgColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
