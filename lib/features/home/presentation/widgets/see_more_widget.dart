import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SeeMoreWidget extends StatefulWidget {
  const SeeMoreWidget(
    this.text, {
    super.key,
    this.textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    this.animationDuration = const Duration(milliseconds: 200),
    this.seeMoreText = "See More",
    this.seeMoreStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    this.seeLessText = "See Less",
    this.seeLessStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    this.trimLength = 240,
  });

  final String text;
  final TextStyle textStyle;
  final Duration animationDuration;
  final String seeMoreText;
  final TextStyle seeMoreStyle;
  final String seeLessText;
  final TextStyle seeLessStyle;
  final int trimLength;
  @override
  State<SeeMoreWidget> createState() => _SeeMoreWidgetState();
}

class _SeeMoreWidgetState extends State<SeeMoreWidget> {
  bool seeMore = false;

  @override
  Widget build(BuildContext context) {
    if (widget.text.length < widget.trimLength) {
      return RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: widget.text,
          style: widget.textStyle,
        ),
      );
    }
    return AnimatedCrossFade(
      firstChild: RichText(
        // maxLines: 3,
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: widget.text.substring(0, widget.trimLength),
          style: widget.textStyle,
          children: <TextSpan>[
            TextSpan(
                text: " ${widget.seeMoreText}",
                style: widget.seeMoreStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      seeMore = !seeMore;
                    });
                  }),
          ],
        ),
      ),
      secondChild: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: widget.text,
          style: widget.textStyle,
          children: <TextSpan>[
            TextSpan(
                text: " ${widget.seeLessText}",
                style: widget.seeLessStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      seeMore = !seeMore;
                    });
                  }),
          ],
        ),
      ),
      crossFadeState: !seeMore ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: widget.animationDuration,
    );
  }
}