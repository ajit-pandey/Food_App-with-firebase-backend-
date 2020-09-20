import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/providers/category.dart';
import 'package:food_course/scr/providers/featured.dart';
import 'package:food_course/scr/providers/restaurant.dart';
import 'package:food_course/scr/providers/user.dart';
import 'package:food_course/scr/screens/bag.dart';
import 'package:food_course/scr/screens/category.dart';
import 'package:food_course/scr/screens/details.dart';
import 'package:food_course/scr/screens/featured.dart';
import 'package:food_course/scr/widgets/bottom_navigation_items.dart';
import 'package:food_course/scr/widgets/categories.dart';
import 'package:food_course/scr/widgets/featured_products.dart';
import 'package:food_course/scr/widgets/loading.dart';
import 'package:food_course/scr/widgets/restaurant.dart';
import 'package:food_course/scr/widgets/small_floating_button.dart';
import 'package:food_course/scr/widgets/title.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import '../helpers/commons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final userProvider  = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final featuredProvider = Provider.of<FeaturedProvider>(context);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: white),
          backgroundColor: red,
          elevation: 0.5,
          title: Text("FoodApp"),
          actions: [
            Stack(children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  changeScreen(context, ShoppingBag());
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20))),
              )
            ]),
            Stack(children: [
              IconButton(
                  icon: Icon(Icons.notifications_none), onPressed: () {}),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20))),
              )
            ])
          ]),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: red,
            ),
            accountName: CustomText(
              text: "Ajit Pandey",
              weight: FontWeight.bold,
              size: 20,
            ),
            accountEmail: CustomText(
              text: "azytpandey19@gmail.com",
              color: black,
            ),
            // text: authProvider.userModel.name,),
            // accountEmail: CustomText(text:authProvider.userModel.email),
          ),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: "Home")),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.fastfood),
              title: CustomText(text: "Food I like")),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.restaurant),
              title: CustomText(text: "Liked Restaurants")),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My Orders")),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart")),
          ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: CustomText(text: "Settings")),
        ]),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: grey[800],
                            offset: Offset(1, 1),
                            blurRadius: 4)
                      ]),
                  child: ListTile(
                    leading: Icon(Icons.search, color: red),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: "Find food of your choice",
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: Icon(Icons.filter_list, color: red),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "What would you like to eat?",
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(height: 5),
            Container(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryProvider.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async{
                      print("AJit");
                      await featuredProvider.loadFeaturedByCategory(categoryName:categoryProvider.categories[index].name);
                      changeScreen(context, CategoryScreen(categoryModel: categoryProvider.categories[index],));
                    },
                                      child: CategoryWidget(
                        category: categoryProvider.categories[index]),
                  );
                },
              ),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomText(
                      text: "Featured",
                      size: 20,
                      color: grey,
                      weight: FontWeight.bold),
                ),
                FlatButton(
                  child: CustomText(text: "see all"),
                  onPressed: () {},
                )
              ],
            ),

            Container(
              height: 210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredProvider.featured.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: (){
                        featuredProvider.loadFeaturedByCategory();
                        changeScreen(_, Details(product: featuredProvider.featured[index]));
                      },
                                          child: FeaturedWidget(
                          featured:featuredProvider.featured[index]),
                    );
                  },
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Popular",
                size: 18,
                weight: FontWeight.bold,
                color: grey,
              ),
            ),
            Column(
              children:
                restaurantProvider.restaurants
                .map((item) => GestureDetector(
                  onTap: ()async {
                    await featuredProvider.loadFeaturedByRestaurant(restaurantId:item.id);
                    changeScreen(context, FeaturedScreen(featuredModel: item,));
                  },
                  child: RestaurantWidget(restaurant:item),
                ))
                .toList()
        
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavIcon(image: "images/table.png", name: "Home"),
            BottomNavIcon(image: "images/table.png", name: "Nearby"),
            BottomNavIcon(
              image: "images/table.png",
              name: "Cart",
              onTap: () {
                changeScreen(context, ShoppingBag());
              },
            ),
            BottomNavIcon(image: "images/table.png", name: "Account"),
          ],
        ),
      ),
    );
  }
}
