import 'package:flutter/material.dart';
import 'package:give_tour_app/gen/assets.gen.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 12),
            child: Assets.images.givetourInvert.image(
              width: 24,
              height: 24,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              '© GiveTour.com',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'ournament and league management software',
              style: TextStyle(
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _textButton(text: 'Contact Us', onPressed: () {}),
              _textButton(text: 'Our happy clients', onPressed: () {}),
              _textButton(text: 'Privacy Policy', onPressed: () {}),
              _textButton(text: 'Term Of Service', onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  _textButton({required String text, required Function() onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: ClipRect(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        ),
      ),
    );
  }
}
