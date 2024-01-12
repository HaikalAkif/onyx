import 'package:flutter/material.dart';
import '../styles/color.dart';

class FbPage extends StatefulWidget {
  @override
  _FbPageState createState() => _FbPageState();
}

class _FbPageState extends State<FbPage> {
  int selectedComboQuantity = 0;
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Text('Food and Beverages'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            // return ComboCard(
            //   comboIndex: index,
            //   onSelect: (quantity, price) {
            //     setState(() {
            //       selectedComboQuantity = quantity;
            //       totalPrice = price;
            //     });
            //   },
            // );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: MyColors.primary,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16.0, color: MyColors.second),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.second,
                foregroundColor: Colors.white,
              ),
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComboCard extends StatefulWidget {
  final int comboIndex;
  final ValueChanged<int> onSelect;

  const ComboCard({
    Key? key,
    required this.comboIndex,
    required this.onSelect,
  }) : super(key: key);

  @override
  _ComboCardState createState() => _ComboCardState();
}

class _ComboCardState extends State<ComboCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: MyColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'lib/assets/onyxLogo.png',
              height: 40.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Combo Package ${widget.comboIndex}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: MyColors.second,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Popcorn and Cola',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Price: \$10.00',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (quantity > 0) {
                      setState(() {
                        quantity--;
                      });
                      widget.onSelect(quantity);
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16.0),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                    widget.onSelect(quantity);
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: const Center(
        child: Text('This is the payment page'),
      ),
    );
  }
}
