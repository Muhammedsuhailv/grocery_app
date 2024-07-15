import 'package:flutter/material.dart';
import 'package:product_app/screens/my_cart.dart';
import 'package:product_app/widgets/cutome_blureffect.dart';
import '../model/models.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isfav=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5f5),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Text(
                          "Fruit",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff064f1a),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart(),));
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -5,
                            right: -5,
                            child: CircleAvatar(
                              minRadius: 8,
                              backgroundColor: Colors.red,
                              child: Text(
                                "5",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                SizedBox(
                  height: 800,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: GridView.builder(
                      itemCount: Fruit.length,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 200,
                                height: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -50,
                              left: 30,
                              child: Image(
                                image: AssetImage(Fruit[index]['image']),
                                width: 120,
                                height: 120,
                              ),
                            ),
                            Positioned(
                              left: 147,
                              top: 15,
                              child:IconButton(onPressed: () {
                                setState(() {
                                  isfav=!isfav;
                                });
                              }, icon:isfav==true?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border),color: Colors.red,),
                            ),
                            Positioned(
                              top: 80,
                              right: 90,
                              child: Text(
                                Fruit[index]['title'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff064f1a),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 25,
                              top: 85,
                              child: CircleAvatar(
                                backgroundColor: Color(0xff064f1a),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              top: 100,
                              child: Row(
                                children: [
                                  Text(
                                    Fruit[index]['rate'],
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff064f1a),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "/kg",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        120), // Add some padding to the bottom to avoid clipping
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: BlurEffect(
              width: 400,
              height: 90,
              borderRadius: 25,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(color: Color(0xff064f1a)),
                          ),
                          Text(
                            "\$45",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff064f1a),
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff064f1a),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "CHECKOUT NOW",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
