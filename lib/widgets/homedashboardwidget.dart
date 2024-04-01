import 'package:ecommerceadmin/views/ordersscreen.dart';
import 'package:ecommerceadmin/views/paymentsscreen.dart';
import 'package:ecommerceadmin/views/productspage.dart';
import 'package:flutter/material.dart';


class HomeDashBoardWidget extends StatelessWidget {
  const HomeDashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return  SizedBox(
      width: double.infinity,
      height:height*0.55,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
              children: [
                
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsPage()));
                  },
                  child:const Hero(
                    tag: 'products',
                    child: Card(
        
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                       
                       
                     Text(
                            "Products",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
             Hero(
                  tag: 'payments',
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentsScreen()));
                    },
                    child:const Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         
                         Text(
                            "Payments",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Hero(
                  tag: 'analytics',
                  child:Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                  Text(
                          "Analytics",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Hero(
                  tag: 'orders',
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderScreenPage()));
                    },
                    child:const Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                       
                        Text(
                            "Orders",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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