import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

// TODO: background should take out from the chartContainer
Canvas backgroundDisplayGrid({
  Color gridColor = Colors.black,
  @required var spaceBetweenData,
  priceDiff,
  @required double highPriceLimit,
  @required Size painterContainerSize,
  @required List<List> tempNestedDataList,
  @required Canvas canvas,
  @required bool isEnableVerticalGrid,
  @required bool isEnableHorizontalGrid,
}) {
  Paint gridPainter = new Paint()
    ..color = gridColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 1;

  Path gridPath_Horizontal({Canvas canvas}) {
    var incrementHeightIndex = painterContainerSize.height / 3;
    Path path = new Path();
    for (int i = 1; i < 3; i++) {
      path.moveTo(0, incrementHeightIndex * (i));
      path.lineTo(painterContainerSize.width, incrementHeightIndex * (i));
    }
    return path;
  }

  Path gridPath_Vertical({Canvas canvas}) {
    var incrementWidthIndex = painterContainerSize.width / 6;
    Path path = new Path();
    for (int i = 1; i < 6; i++) {
      path.moveTo(incrementWidthIndex * (i), 0);
      path.lineTo(incrementWidthIndex * (i), painterContainerSize.height);
    }
    return path;
  }

  if (isEnableHorizontalGrid) {
    canvas.drawPath(
      dashPath(
        gridPath_Horizontal(canvas: canvas), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[5, 5]),
      ),
      gridPainter,
    );
  }

  if (isEnableVerticalGrid) {
    canvas.drawPath(
      dashPath(
        gridPath_Vertical(canvas: canvas), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[5, 5]),
      ),
      gridPainter,
    );
  }

  return canvas;
}
