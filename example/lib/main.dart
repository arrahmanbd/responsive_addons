import 'package:flutter/material.dart';
import 'package:responsive_addons/responsive_addons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      designSize: const Size(375, 812), // Figma/AdobeXD design size
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Responsive Addons Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.deepPurple,
          ),
          home: const StoreHomePage(),
        );
      },
    );
  }
}


class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
       
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        title: Text("Responsive Addons"),
        actions: [
         
          2.s,
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeaderCard(context)),
          
          SliverPadding(
            padding: 16.p,
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _buildProductCard(context);
              }, childCount: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.adaptive.grid.crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: context.adaptive.cardWithImageRatio,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProductCard(BuildContext context) {
    return Container(
      padding: 4.p,
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(2.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.dp,
            offset: Offset(0, 1.dp),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.pw),
              
            ),
          ),
          SizedBox(height: 20.h),
          Text("Product Name", ),
          SizedBox(height: 5.h),
          Text(
            "\$49.99",
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Short description of the product goes here.",
           
          ),
        ],
      ),
    );
  }

  Container _buildHeaderCard(BuildContext context) {
    return Container(
      height: 350.h, // 20% height of screen
      padding: EdgeInsets.all(4.pw),
      decoration: BoxDecoration(
       // borderRadius: BorderRadius.circular(2.r),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 204, 221, 253),
            const Color.fromARGB(255, 214, 198, 241),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to Flutter Addons!",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Text("Explore top deals and new arrivals."),
          Spacer(),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Explore')),
              4.s,
              OutlinedButton(onPressed: () {}, child: Text('Signup')),
            ],
          ),
        ],
      ),
    );
  }
}