import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  TitleHome(
    this.startPlay_call, {
    super.key,
  });

  VoidCallback startPlay_call;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/home_back.jpg'),
        const SizedBox(
          height: 22,
        ),
        const Text(
          'Play an exciting Trivia game.',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 5,
            ),
            onPressed: startPlay_call,
            child: const Text(
              'Play',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
