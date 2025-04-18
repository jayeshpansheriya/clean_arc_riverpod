import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlreadyHaveAccount extends ConsumerWidget {
  final VoidCallback onPressed;
  const AlreadyHaveAccount({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            "LogIn",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
