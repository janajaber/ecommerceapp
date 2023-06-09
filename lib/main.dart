// main.dart

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'payment.dart';
import 'choose.dart';
import 'models.dart';
import 'package:image_picker/image_picker.dart';

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

      home: WelcomeScreen(),
      // Use AuthWrapper as the home screen
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
      //builder: (BuildContext context) => HomePage()));
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
            image: AssetImage('load4.jpg'),
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
                          ..color = Color.fromARGB(255, 0, 0, 0),
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
      imageUrl: 'im9_1.jpeg',
      imageUrls: ['im9_1.jpeg', 'im9.jpeg', 'im9_2.jpeg'],
      price: 59.99,
    ),
    Shoe(
      name: 'Nike Air Presto',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im6.jpeg',
      imageUrls: ['im6.jpeg', 'im6_1.jpeg', 'im6_2.jpeg'],
      price: 89.99,
    ),
    Shoe(
      name: 'Air Force 1',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im7.jpeg',
      imageUrls: ['im7.jpeg', 'im7_1.jpeg', 'im7_2.jpeg'],
      price: 149.99,
    ),
    Shoe(
      name: 'Nike Cortez',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im8.jpeg',
      imageUrls: ['im8.jpeg', 'im8_1.jpeg', 'im8_2.jpeg'],
      price: 159.99,
    ),
    Shoe(
      name: 'Cortez to Air Force 1',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im3.jpeg',
      imageUrls: ['im3.jpeg', 'im3_1.jpeg', 'im3_2.jpeg'],
      price: 120.99,
    ),
    Shoe(
      name: 'Nike Dunk High',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im5.jpeg',
      imageUrls: ['im5.jpeg', 'im5_1.jpeg', 'im5_2.jpeg'],
      price: 150.99,
    ),
    Shoe(
      name: 'Nike Air Max 270',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im4.jpeg',
      imageUrls: ['im4.jpeg', 'im4_1.jpeg', 'im4_2.jpeg'],
      price: 79.99,
    ),
    Shoe(
      name: 'Nike Air Max 270',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im2.jpeg',
      imageUrls: ['im2.jpeg', 'im2_1.jpeg', 'im2_2.jpeg'],
      price: 59.99,
    ),

    Shoe(
      name: 'Cortez to Air Force 1',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im3.jpeg',
      imageUrls: ['im3.jpeg', 'im3_1.jpeg', 'im3_2.jpeg'],
      price: 120.99,
    ),
    Shoe(
      name: 'Nike Dunk High',
      description: 'This is another example shoe with amazing durability.',
      imageUrl: 'im5.jpeg',
      imageUrls: ['im5.jpeg', 'im5_1.jpeg', 'im5_2.jpeg'],
      price: 150.99,
    ),
    // Add more shoes as needed
  ];
  Cart cart = Cart();

  int _selectedIndex = 1;
  Favorites favorites = Favorites();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FavoritesPage(favorites: favorites)),
        );
        _selectedIndex = 1;
        break;
      case 1:
        Navigator.popUntil(context, (route) => route.isFirst);
        _selectedIndex = 1;
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        _selectedIndex = 1;
        break;
    }
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
          return ShoeCard(shoe: shoes[index], cart: cart, favorites: favorites);
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
  final Cart cart;
  final Favorites favorites;

  const ShoeCard(
      {Key? key,
      required this.shoe,
      required this.cart,
      required this.favorites})
      : super(key: key);

  @override
  _ShoeCardState createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ShoeDetailPage(shoe: widget.shoe, cart: widget.cart),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      widget.shoe
                          .imageUrl, // Replace shoes[index] with widget.shoe
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    widget.shoe.name, // Replace shoes[index] with widget.shoe
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Sans',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                  child: Text(
                    '\$${widget.shoe.price.toStringAsFixed(2)}', // Replace shoes[index] with widget.shoe
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'Sans',
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
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                  if (_isFavorite) {
                    widget.favorites.add(widget.shoe);
                  } else {
                    widget.favorites.remove(widget.shoe);
                  }
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
  ShoeSizeDropdown({Key? key}) : super(key: key);

  @override
  _ShoeSizeDropdownState createState() => _ShoeSizeDropdownState();
}

class _ShoeSizeDropdownState extends State<ShoeSizeDropdown> {
  final List<String> shoeSizes = ['36', '37', '38', '39', '40', '41', '42'];
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          hint: Text(
            'Select shoe size',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          value: _selectedSize,
          onChanged: (String? newValue) {
            setState(() {
              _selectedSize = newValue;
            });
          },
          items: shoeSizes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            );
          }).toList(),
          selectedItemBuilder: (BuildContext context) {
            return shoeSizes.map<Widget>((String value) {
              return Container(
                padding: EdgeInsets.only(top: 14),
                child: Text(value,
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              );
            }).toList();
          },
          style: TextStyle(color: Colors.black, fontSize: 16),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}

class ShoeDetailPage extends StatefulWidget {
  final Shoe shoe;
  final Cart cart;

  ShoeDetailPage({required this.shoe, required this.cart});

  @override
  _ShoeDetailPageState createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  final GlobalKey<_ShoeSizeDropdownState> _sizeDropdownKey =
      GlobalKey<_ShoeSizeDropdownState>();
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.shoe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.shoe.imageUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        widget.shoe.imageUrls[index],
                        fit: BoxFit.cover,
                        height: 300,
                      );
                    },
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                      if (_currentPage == 0) {
                        _pageController.animateToPage(
                            widget.shoe.imageUrls.length - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      }
                    },
                  ),
                ),
                Positioned(
                  top: 130,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                    onPressed: () {
                      if (_currentPage < widget.shoe.imageUrls.length - 1) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                      if (_currentPage == widget.shoe.imageUrls.length - 1) {
                        _pageController.animateToPage(0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.shoe.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '\$${widget.shoe.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.shoe.description,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ShoeSizeDropdown(key: _sizeDropdownKey),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  if (_sizeDropdownKey.currentState?._selectedSize != null) {
                    widget.cart.addItem(widget.shoe);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added to cart!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Warning',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'Please select a shoe size first.',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
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
  double getTotalPrice() {
    return widget.cart.items.fold(0, (sum, item) => sum + item.price);
  }

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
                    builder: (context) => PaymentPage(
                        cart: widget.cart, totalPrice: getTotalPrice()),
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

//THIS IS FOR FAVORITE PAGE
class Favorites {
  List<Shoe> favoriteShoes = [];

  void add(Shoe shoe) {
    favoriteShoes.add(shoe);
  }

  void remove(Shoe shoe) {
    favoriteShoes.remove(shoe);
  }
}

class FavoritesPage extends StatefulWidget {
  final Favorites favorites;

  FavoritesPage({Key? key, required this.favorites}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: widget.favorites.favoriteShoes.length,
        itemBuilder: (context, index) {
          final shoe = widget.favorites.favoriteShoes[index];
          return ListTile(
            leading: Image.asset(
              shoe.imageUrl,
              height: 50,
              width: 50,
            ),
            title: Text(shoe.name),
            subtitle: Text('\$${shoe.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}

//THIS IS PROFILE PAGE

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  bool _isEditing = false;
  File? _profileImage;
  ImageProvider<Object> getProfileImage() {
    if (_profileImage == null) {
      return AssetImage('profile.JPG');
    } else {
      return FileImage(_profileImage!);
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _profileImage = image as File?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: () => _pickImage(),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: getProfileImage(),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: Text(
                                'Tap on the image to change',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                            SizedBox(height: 30),
                            SizedBox(height: 40),
                            Text(
                              'Name',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: 'John Doe',
                                enabled: _isEditing,
                              ),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              cursorColor: Colors.black,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Email',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: 'john.doe@example.com',
                                enabled: _isEditing,
                              ),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              cursorColor: Colors.black,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Location',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextField(
                              controller: _locationController,
                              decoration: InputDecoration(
                                hintText: 'San Francisco, CA',
                                enabled: _isEditing,
                              ),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              cursorColor: Colors.black,
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isEditing = !_isEditing;
                                    });
                                  },
                                  child: Text(
                                    _isEditing ? 'Save' : 'Edit',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                  ),
                                ),
                                SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChooseSignInorSignUp()),
                                    );
                                  },
                                  child: Text(
                                    'Log Out',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Shoe1@hotmail.com',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                '+961 79175075',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
