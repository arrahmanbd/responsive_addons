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
      appBar: ResponsiveAppBar(
        logo: Text(
          'Flutter Addons',
          style: TextStyle(
            fontSize: 22.dt,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        navItems: [
          NavItem(label: "Home", onTap: () => print("Home")),
          NavItem(label: "Shop", onTap: () => print("Shop")),
          NavItem(label: "About", onTap: () => print("About")),
        ],
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blueAccent,
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
          // Replacing Expanded with SliverFillRemaining
          SliverFillRemaining(hasScrollBody: false, child: ExampleTrap()),
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
            height: 200.dh,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.pw),
            ),
            child: Center(child: Icon(Icons.image_outlined)),
          ),
          SizedBox(height: 20.dh),
          Text("Product Name"),
          SizedBox(height: 5.dh),
          Text(
            "\$49.99",
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.dh),
          Text("Short description of the product goes here."),
        ],
      ),
    );
  }

  Container _buildHeaderCard(BuildContext context) {
    return Container(
      height: 350.dh, // 20% height of screen
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
            "Welcome to Responsive Addons!",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.dh),
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

///bootstrap
class ExampleTrap extends StatelessWidget {
  const ExampleTrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Kontainer(
      child: ResponsiveRow(
        children: [
          Col(md: 4, offsetMd: 2, child: Text('Column with Offset')),
          HiddenOn(
            sizes: [ScreenSize.xs],
            child: Col(md: 6, child: Text('Hidden on XS')),
          ),
          Col(
            md: 12,
            child: ResponsiveRow(
              children: [
                Col(xs: 6, child: Text('Nested Col 1')),
                Col(xs: 6, child: Text('Nested Col 2')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
