import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum IndexBadgeContext {
  correct,
  wrong;

  Color get backgroundColor {
    switch (this) {
      case IndexBadgeContext.correct:
        return const Color.fromARGB(255, 13, 224, 182);
      case IndexBadgeContext.wrong:
        return const Color.fromARGB(255, 232, 28, 181);
    }
  }
}

class IndexBadge extends StatelessWidget {
  final IndexBadgeContext uiContext;
  final int index;

  const IndexBadge(
      {super.key,
      this.uiContext = IndexBadgeContext.correct,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: uiContext.backgroundColor),
      child: Center(
        child: Text(
          index.toString(),
          style: GoogleFonts.lato(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
