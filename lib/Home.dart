import 'package:flutter/material.dart';

import 'cart.dart';
import 'dish_object.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dish> _dishes = <Dish>[];

  List<Dish> _cartList = <Dish>[];

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'ASK ecomerce App',
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      body: _buildGridView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _dishes.length,
      itemBuilder: (context, index) {
        var item = _dishes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: Card(
            elevation: 4.0,
            child: ListTile(
              leading: Icon(
                item.icon,
                color: item.color,
              ),
              title: Text(item.name),
              trailing: GestureDetector(
                child: (!_cartList.contains(item))
                    ? Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                onTap: () {
                  setState(() {
                    if (!_cartList.contains(item))
                      _cartList.add(item);
                    else
                      _cartList.remove(item);
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10.0,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: (_cartList.contains(item))
                            ? Colors.grey
                            : item.color,
                        size: 90.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        item.rate,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              '5',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              item.Icon,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                      bottom: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
                            ? Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                        onTap: () {
                          setState(() {
                            if (!_cartList.contains(item))
                              _cartList.add(item);
                            else
                              _cartList.remove(item);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateDishes() {
    var list = <Dish>[
      Dish(
        name: 'iphone',
        icon: Icons.phone_iphone_rounded,
        color: Colors.blueGrey,
        rate: '\u{20B9} 1,25,000',
        Icon: Icons.star,
      ),
      Dish(
        name: 'Charger',
        icon: Icons.charging_station_rounded,
        color: Colors.brown.shade300,
        rate: '\u{20B9} 15,000',
        Icon: Icons.star,
      ),
      Dish(
        name: 'Table',
        icon: Icons.table_restaurant,
        color: Colors.brown,
        rate: '\u{20B9} 45,000',
        Icon: Icons.star,
      ),
      Dish(
        name: 'Wodden chair',
        icon: Icons.chair_rounded,
        color: Colors.purple,
        rate: '\u{20B9} 10,000',
        Icon: Icons.star,
      ),
      Dish(
        name: 'Android Phone',
        icon: Icons.phone_android_rounded,
        color: Colors.black,
        rate: '\u{20B9} 35,000',
        Icon: Icons.star,
      ),
      Dish(
        name: 'Mac',
        icon: Icons.laptop_mac,
        color: Colors.blueGrey,
        rate: '\u{20B9} 1,50,000',
        Icon: Icons.star,
      ),
    ];

    setState(() {
      _dishes = list;
    });
  }
}
