import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:product_app/model/models.dart';
import 'package:product_app/screens/customers_page.dart';
import 'package:product_app/screens/my_cart.dart';
import 'package:product_app/screens/product_page.dart';

class HomePage extends StatelessWidget {
  final List<String> imgList = [
    'assets/bnr2.png',
    'assets/bnr1.jpg',
    'assets/bnr2.png',
  ];
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5f5),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomersPage(),));
                        },
                        child: Text(
                          "Good day!",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff064f1a),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Image(
                        image: AssetImage("assets/hand.png"),
                        height: 20,
                      ),
                    ],
                  ),
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
            SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 350,
            child: Material(
              elevation: 5.0,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(50),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search grocery',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
        ),
            SizedBox(height: 30,),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
            ),
            items: imgList.map((item) => Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                    child: Image.asset(item, fit: BoxFit.cover, width: 500,height: 500,)),
              ),
            )).toList(),
          ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xff064f1a)),),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Categories.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Categories[index]['nav']));
                        },
                        child: Container(
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(Categories[index]['image']),
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(height: 5),
                              Text(Categories[index]['text']),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                Text("Discovery",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xff064f1a)),)
                ,Row(
                  children: [
                    Text("See all",style: TextStyle(fontSize: 13,color: Color(0xff064f1a )),),
                    SizedBox(width: 3,),
                    Icon(Icons.arrow_forward_ios,color: Color(0xff064f1a),size: 10,)
                  ],
                )
              ],),

            ),
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25),
                child: GridView.builder(
                  itemCount: Discovery.length,
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
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Positioned(
                          top: -50,
                          left:30,

                          child: Image(
                              image: AssetImage(Discovery[index]['image']),width: 120,height: 120,)),
                      Positioned
                        (
                        left:147,
                          top:15,
                          child: Icon(Icons.favorite,color: Colors.red,))
                      ,
                      Positioned(
                        top:80,
                          right:70,
                          child: Text(Discovery[index]['title'],style: TextStyle(fontSize: 16,color: Color(0xff064f1a),fontWeight: FontWeight.bold),))
                     , Positioned(
                       right:25,
                        top:85,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff064f1a),
                         child: IconButton(

                              onPressed: () {

                          }, icon: Icon(Icons.add),color: Colors.white,),
                       ),
                     ),
                      Positioned(
                        left: 15,
                        top: 100,
                        child: Row(
                          children: [
                            Text(Discovery[index]['rate'],style: TextStyle(fontSize: 17,color: Color(0xff064f1a),fontWeight: FontWeight.bold),),
                            Text("/kg",style: TextStyle(fontSize: 12,color: Colors.grey),)
                          ],
                        ),
                      ),

                    ],
                  );

                },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
              ),
            )
          ],
        ),
      ),
    );
  }
}