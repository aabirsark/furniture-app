import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/app/app_colors.dart';
import 'package:furniture_app/app/ext.dart';
import 'package:furniture_app/meta/details.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomSheet: Container(
        color: scaffoldBgColor,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.responsive(16, axis: Axis.horizontal)),
          height: 65,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset("assets/home.svg"),
                SvgPicture.asset("assets/bookmark.svg"),
                SvgPicture.asset("assets/bell.svg"),
                SvgPicture.asset("assets/profile.svg"),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
              color: scaffoldBgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: context.responsive(20),
                ),
                const SearchBar(),
                SizedBox(
                  height: context.responsive(20),
                ),
                const CustomCard(),
                SizedBox(height: context.responsive(30)),
                const BestSelllerRow(),
                SizedBox(
                  height: context.responsive(15),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) =>
                      ProductCard(data: products[index]),
                ),
                SizedBox(
                  height: context.responsive(100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: context.responsive(70),
      title: Column(
        children: [
          const Text(
            "Location",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "Vadodara",
            style: TextStyle(
                color: Colors.grey.shade800, fontSize: context.responsive(20)),
          )
        ],
      ),
      leading: IconButton(
        icon: SvgPicture.asset("assets/menu.svg"),
        onPressed: () {},
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: context.responsive(17),
            backgroundImage: const AssetImage("assets/user_icon.png"),
          ),
        )
      ],
    );
  }
}

class BestSelllerRow extends StatelessWidget {
  const BestSelllerRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Best Seller",
          style: TextStyle(
              color: Colors.blueGrey.shade700,
              fontSize: context.responsive(20)),
        ),
        Text(
          "View all",
          style: TextStyle(
              color: Colors.blueGrey.shade400,
              fontSize: context.responsive(20)),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  DetailPage(),
            ));
      },
      child: SizedBox(
        height: context.responsive(155),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: context.responsive(120),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: cardLinerColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(10)),
                )),
            Positioned(
                right: context.responsive(20),
                bottom: 0,
                child: Image.asset("assets/chair.png")),
            Positioned(
                left: context.responsive(20),
                bottom: context.responsive(55),
                child: Text(
                  "Super Flash Sale\n 50% OFF",
                  style: TextStyle(
                      color: Colors.white, fontSize: context.responsive(20)),
                )),
            Positioned(
                left: context.responsive(20),
                bottom: context.responsive(20),
                child: Row(
                  children: [
                    Text(
                      "Check out",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: context.responsive(15)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.arrow_right,
                      size: context.responsive(20),
                      color: Colors.white54,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                SvgPicture.asset("assets/search-normal.svg"),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Search Product",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: primaryColor),
          child: SvgPicture.asset("assets/setting-4.svg"),
        )
      ],
    );
  }
}

class ProductMeta {
  final String image;
  final String label;
  final String seller;
  final int price;

  ProductMeta(
      {required this.image,
      required this.label,
      required this.seller,
      required this.price});
}

List<ProductMeta> products = [
  ProductMeta(
      image: "assets/products/product2.png",
      label: "Ex 100 Ox Chair",
      seller: "Hanes Huberman",
      price: 199),
  ProductMeta(
      image: "assets/products/product1.png",
      label: "Minimalist Chair",
      seller: "Rajesh Sahu",
      price: 259),
  ProductMeta(
      image: "assets/products/product3.png",
      label: "Ex 300 Chair",
      seller: "Lisel Meminger",
      price: 199),
  ProductMeta(
      image: "assets/products/product3.png",
      label: "Rx Comfort 889yx Chair",
      seller: "Hermione Granger",
      price: 199),
];

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.data}) : super(key: key);

  final ProductMeta data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(data.image),
          const SizedBox(
            height: 10,
          ),
          Text(
            data.label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            data.seller,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                "\$ ${data.price}",
                style: const TextStyle(color: Colors.blueGrey),
              ),
              const Spacer(),
              Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: primaryColor),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
