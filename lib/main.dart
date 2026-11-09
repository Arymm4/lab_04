
import 'package:flutter/material.dart';
import 'order_summary.dart';

void main() {
  runApp(const PizzaStoreApp());
}

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Store',
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu',

      routes: {
        // Main Menu
        '/menu': (context) => const MenuScreen(),

        // Pepperoni Pizza Detail Screen
        '/vegetable': (context) => const DetailScreen(
              name: 'Pepperoni Pizza',
              image: 'assets/images/pepperoni.png',
              description:
                  'Delicious pizza with pepperoni slices, '
                  'melted cheese and rich tomato sauce.',
            ),

        // Margherita Pizza Detail Screen
        '/cheese': (context) => const DetailScreen(
              name: 'Margherita Pizza',
              image: 'assets/images/margherita.png',
              description:
                  'Classic Italian pizza topped with '
                  'mozzarella cheese, tomato sauce and fresh basil.',
            ),

        // French Fries Detail Screen
        '/fries': (context) => const DetailScreen(
              name: 'Box of Fries',
              image: 'assets/images/fries.png',
              description:
                  'Crispy golden French fries, '
                  'freshly prepared and served hot.',
            ),

        // AI-Generated Order Summary Screen
        '/summary': (context) => const OrderSummaryScreen(
              itemName: 'Pepperoni Pizza',
              quantity: 2,
              price: 12.50,
            ),
      },
    );
  }
}

// =======================================
// MENU SCREEN
// =======================================

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pizza Store Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          // Pepperoni Pizza
          menuCard(
            context,
            'Pepperoni Pizza',
            '/vegetable',
          ),

          // Margherita Pizza
          menuCard(
            context,
            'Margherita Pizza',
            '/cheese',
          ),

          // French Fries
          menuCard(
            context,
            'Box of Fries',
            '/fries',
          ),

          const SizedBox(height: 25),

          // Order Summary Button
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/summary',
              );
            },

            icon: const Icon(Icons.receipt_long),

            label: const Text(
              'View Order Summary',
              style: TextStyle(fontSize: 18),
            ),

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(18),
            ),
          ),
        ],
      ),
    );
  }

  // Menu Card Widget
  Widget menuCard(
    BuildContext context,
    String name,
    String route,
  ) {
    return Card(
      color: Colors.orange.shade200,
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),

      child: ListTile(
        contentPadding: const EdgeInsets.all(20),

        title: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.deepOrange,
        ),

        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}

// =======================================
// DETAIL SCREEN
// =======================================

class DetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const DetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // Pizza / Fries Image
                Image.asset(
                  image,
                  height: 220,
                  width: 280,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 25),

                // Food Name
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Food Description
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 30),

                // Back Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(Icons.arrow_back),

                  label: const Text(
                    'Back to Menu',
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
