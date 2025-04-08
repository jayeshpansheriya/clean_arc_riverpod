import 'package:clean_arc_riverpod/features/signup/presentation/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpButton extends ConsumerWidget {
  final VoidCallback onPressed;
  const SignUpButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      signUpControllerProvider.select((value) => value.isLoading),
    );
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        label: Text('Sign Up', style: const TextStyle(fontSize: 8)),
        icon:
            isLoading
                ? const CircularProgressIndicator.adaptive()
                : const Icon(Icons.person_add),
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}
