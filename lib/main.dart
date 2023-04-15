// main.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'payment.dart';

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
        primaryColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white), // Change underline color to black
          ),
        ),
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
      name: 'Air Yeezy',
      description: 'This is an example shoe with great comfort and style.',
      imageUrl: 'im2.jpeg',
      price: 59.99,
    ),
    Shoe(
      name: 'Nike Air Presto',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im6.jpeg',
      price: 89.99,
    ),
    Shoe(
      name: 'Cortez to Air Force 1',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im4.jpeg',
      price: 89.99,
    ),
    Shoe(
      name: 'Nike Dunk High',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im5.jpeg',
      price: 89.99,
    )
    // Add more shoes as needed
  ];
  Cart cart = Cart();
  
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      body: GridView.builder(
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
                  builder: (context) =>
                      ShoeDetailPage(shoe: shoes[index], cart: cart),
                ),
              );
            },
            
            child: Stack(

            children: [
              Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        shoes[index].imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      shoes[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily:
                            'Sans', // Specify the sans-serif font family
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(8, 0, 8, 16), // Add bottom margin
                    child: Text(
                      '\$${shoes[index].price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black, // Change the color to black
                        fontFamily:
                            'Sans', // Specify the sans-serif font family
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
        top: 8,
        right: 8,
        child: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {
            // Add functionality for adding to favorites
          },
        ),
      ),
            ],
            ),
          );
        },
      ),
       bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
  
}
class ShoeCard extends StatefulWidget {
  final Shoe shoe;

  const ShoeCard({Key? key, required this.shoe}) : super(key: key);

  @override
  _ShoeCardState createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Your existing onTap code
      },
      child: Stack(
        children: [
          // Your existing Card widget code
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}


class ShoeSizeDropdown extends StatefulWidget {
  @override
  _ShoeSizeDropdownState createState() => _ShoeSizeDropdownState();
}

class _ShoeSizeDropdownState extends State<ShoeSizeDropdown> {
  final List<String> shoeSizes = ['36', '37', '38', '39', '40', '41', '42'];
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('Select shoe size'),
      value: _selectedSize,
      onChanged: (String? newValue) {
        setState(() {
          _selectedSize = newValue;
        });
      },
      items: shoeSizes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
        backgroundColor: Colors.black,
        title: Text(shoe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              // Replace Image.network with Image.asset
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
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: ShoeSizeDropdown(),
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
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
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
        backgroundColor: Colors.black,
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.items.length,
              itemBuilder: (BuildContext context, int index) {
                Shoe shoe = widget.cart.items[index];
                return ListTile(
                  leading: Image.asset(
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
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(cart: widget.cart),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Confirm Order',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
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
        backgroundColor: Colors.black,
        title: TextField(
          cursorColor: Colors.white,
          controller: _searchController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search shoes...',
            hintStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.black,
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
                  builder: (context) =>
                      ShoeDetailPage(shoe: shoe, cart: Cart()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
