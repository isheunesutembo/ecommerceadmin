import 'package:ecommerceadmin/views/productspage.dart';
import 'package:ecommerceadmin/widgets/homedashboardwidget.dart';
import 'package:ecommerceadmin/widgets/revenuechartwidget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Dashboard",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HomeDashBoardWidget(),
            const SizedBox(
              height: 5,
            ),
         
              
          ],
        ),
      )),
    );
  }
}
