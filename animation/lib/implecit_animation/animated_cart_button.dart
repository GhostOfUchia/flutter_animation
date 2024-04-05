import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool isSecleted = false;

  @override
  Widget build(BuildContext context) {
    var wide = isSecleted ? 200 : 100;
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSecleted = !isSecleted;
            });
          },
          child: AnimatedContainer(
            width: isSecleted ? 200 : 100,
            height: 80,
            decoration: BoxDecoration(
                color: isSecleted ? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(isSecleted ? 40 : 20)),
            duration: Duration(milliseconds: 1000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isSecleted
                    ? Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                if (isSecleted)
                  Text(
                    "Added to cart!",
                    style: TextStyle(color: Colors.white),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
