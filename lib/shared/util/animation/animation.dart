import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/core.dart';

extension WidgetAnimationExtension on Widget {
  Widget get am300 => animate()
      .move(
        duration: 300.ms,
      )
      .fadeIn(
        duration: 300.ms,
      );

  Widget get am400 => animate()
      .move(
        duration: 400.ms,
      )
      .fadeIn(
        duration: 400.ms,
      );

  Widget get am500 => animate()
      .move(
        duration: 500.ms,
      )
      .fadeIn(
        duration: 500.ms,
      );

  Widget get am600 => animate()
      .move(
        duration: 600.ms,
      )
      .fadeIn(
        duration: 600.ms,
      );

  Widget get am700 => animate()
      .move(
        duration: 700.ms,
      )
      .fadeIn(
        duration: 700.ms,
      );
  Widget get am800 => animate()
      .move(
        duration: 800.ms,
      )
      .fadeIn(
        duration: 800.ms,
      );
  Widget get am900 => animate()
      .move(
        duration: 900.ms,
      )
      .fadeIn(
        duration: 900.ms,
      );
  Widget get am1000 => animate()
      .move(
        duration: 1000.ms,
      )
      .fadeIn(
        duration: 1000.ms,
      );

  Widget get am => animate()
      .move(
        duration: 900.ms,
      )
      .fadeIn(
        duration: 900.ms,
      );
  Widget get amShimmer => animate()
      .fadeIn(
        duration: 900.ms,
      )
      .shimmer(
        duration: 1200.ms,
      );
  Widget get moveFromDownAndFade => animate()
      .moveY(
        begin: 80,
        duration: 500.ms,
      )
      .fadeIn(
        duration: 1200.ms,
      );

  Widget get moveAndFace => animate()
      .move(
        duration: 500.ms,
      )
      .fadeIn(
        duration: 1200.ms,
      );

  Widget get amMoveAndFade => animate()
      .move(
        duration: (400).ms,
      )
      .fadeIn(
        duration: (400).ms,
      );
  Widget amMoveAndFadeIndex(int index) => animate()
      .move(
        duration: (400 + (index * 300)).ms,
      )
      .fadeIn(
        duration: (400 + (index * 300)).ms,
      );
}

extension ColumnWidgetAnimationExtension on Column {
  Widget get amx {
    final children = this.children;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: List.generate(
        children.length,
        (index) {
          final child = children[index];
          final duration = 400 + (index * 200);
          return child
              .animate()
              .move(
                duration: duration.ms,
              )
              .shimmer(
                duration: (duration + 300).ms,
              )
              .fadeIn(
                duration: duration.ms,
              );
        },
      ),
    );
  }
}

extension WidgetExtension on List<Widget> {
  List<Widget> get colorize {
    List<Widget> values = this;
    for (var i = 0; i < values.length; i++) {
      var value = values[i];
      if (value is ListRowImageItem) continue;
      values[i] = Container(
        color: i % 2 == 0 ? Colors.grey[200] : Colors.grey[100],
        child: values[i],
      );
    }
    return values;
  }
}
