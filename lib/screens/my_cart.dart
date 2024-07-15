import 'package:flutter/material.dart';
import 'package:product_app/model/models.dart';

import '../widgets/cutome_blureffect.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5f5),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff064f1a),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150.0),
                        child: Text(
                          "My Cart",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff064f1a),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 780,
                    child: ListView.builder(
                      itemCount: CartData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 80), // Add some space for the image
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            CartData[index]['title'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                CartData[index]['rate'],
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
                                          SizedBox(height: 20,),

                                        ],
                                      ),
                                      SizedBox(width:20,),
                                      Container(alignment: Alignment.center,
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(border: Border.all(color: Color(0xff064f1a)),borderRadius: BorderRadius.circular(50)),
                                          child:Center(child: Icon(Icons.minimize,color: Color(0xff064f1a),))
                                      ),
                                      Text("1",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w900),),

                                      CircleAvatar(
                                        backgroundColor: Color(0xff064f1a),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add),
                                          color: Colors.white,
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 15.0),
                                        child: Text(CartData[index]['rate'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff064f1a)),),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -10,
                                left: 10,
                                child: Image(
                                  image: AssetImage(CartData[index]['image']),
                                  width: 60,
                                  height: 60,
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  ),

                ],
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
        ),
      ),
    );
  }
}

