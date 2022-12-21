import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    required this.errorText,
    required this.onPressed,
  }) : super(key: key);

  final String errorText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber,
            color: Colors.grey[400],
            size: size.width / 3,
          ),
          Text(
            errorText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(color: Colors.green),
                ),
              ),
            ),
            child: Text(
              'Try again',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.green,
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
