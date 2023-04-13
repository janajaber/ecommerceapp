// main.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test/auth_wrapper.dart';

import 'choose.dart';
import 'models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        debugShowCheckedModeBanner: false,

      home: WelcomeScreen(), // Use AuthWrapper as the home screen
    );
  }
}
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<void> navigatorpage() async {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const ChooseSignInorSignUp()));
    });
  }

  @override
  void initState() {
    super.initState();
    navigatorpage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('load3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
          


  child: Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: Stack(
            children: [
              // Add blue text with stroke
              Text(
                'Shoes',
                style: TextStyle(
                  fontFamily: 'OPTICoyonet',
                  fontSize: 100,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 7
                    ..color = Color.fromARGB(255, 0, 107, 194),
                ),
              ),
              // Add white text
              const Text(
                'Shoes',
                style: TextStyle(
                  fontFamily: 'OPTICoyonet',
                  fontSize: 100,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),

      ),
    );
  }
}


class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  List<Shoe> shoes = [
    Shoe(
      name: 'Example Shoe 1',
      description: 'This is an example shoe with great comfort and style.',
      imageUrl: 'im1.png',
      price: 59.99,
    ),
    Shoe(
      name: 'Example Shoe 2',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im2.jpeg',
      price: 89.99,
    ),
    // Add more shoes as needed
  ];
  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoe Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchPage(shoes: shoes),
          ),
              );

            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              ).then((_) {
                setState(() {});
              });
            },
          ),
        ],
      ),
      body:GridView.builder(
  padding: EdgeInsets.all(8),
  itemCount: shoes.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    childAspectRatio: 0.6,
  ),
  itemBuilder: (BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShoeDetailPage(shoe: shoes[index], cart: cart),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.asset(
                  shoes[index].imageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                shoes[index].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('\$${shoes[index].price.toStringAsFixed(2)}'),
            ),
          ],
        ),
      ),
    );
  },
),
    );
  }
}

class ShoeDetailPage extends StatelessWidget {
  final Shoe shoe;
  final Cart cart;

  ShoeDetailPage({required this.shoe, required this.cart});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset( // Replace Image.network with Image.asset
              shoe.imageUrl,
              fit: BoxFit.cover,
              height: 300,
            ),
          Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                shoe.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '\$${shoe.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(shoe.description),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  cart.addItem(shoe);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to cart!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18),
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

class CartPage extends StatefulWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cart.items.length,
        itemBuilder: (BuildContext context, int index) {
          Shoe shoe = widget.cart.items[index];
          return ListTile(
            leading: Image.asset( // Replace Image.network with Image.asset
              shoe.imageUrl,
              height: 50,
              width: 50,
            ),
            title: Text(shoe.name),
            subtitle: Text('\$${shoe.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                setState(() {
                  widget.cart.removeItem(shoe);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Removed from cart!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
class SearchPage extends StatefulWidget {
  final List<Shoe> shoes;

  SearchPage({required this.shoes});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Shoe> _searchResults = [];

  void _searchShoes(String query) {
    List<Shoe> results = widget.shoes.where((shoe) {
      return shoe.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search shoes...',
          ),
          onChanged: (value) {
            _searchShoes(value);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (BuildContext context, int index) {
          Shoe shoe = _searchResults[index];
          return ListTile(
            leading: Image.asset(shoe.imageUrl, height: 50, width: 50),
            title: Text(shoe.name),
            subtitle: Text('\$${shoe.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoeDetailPage(shoe: shoe, cart: Cart()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}