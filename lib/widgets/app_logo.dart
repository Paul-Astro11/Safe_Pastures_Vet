import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool showText;

  const AppLogo({
    super.key,
    this.size = 32,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Image.asset(
                'assets/logo.png', // <-- your logo path
                height: 80,
             // Changed logo letter from V to S for Safe Pastures
            ),
          ),
        ),
          const SizedBox(width: 80),
          ],
    );
  }
}
