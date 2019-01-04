// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Manages a copy/paste text selection toolbar.
class ZefyrTextSelectionToolbar extends StatelessWidget {
  const ZefyrTextSelectionToolbar({
    Key key,
    this.elevation: 1.0,
    this.color: Colors.white,
    this.textColor: Colors.black87,
    this.handleCut,
    this.handleCopy,
    this.handlePaste,
    this.handleSelectAll,
  }) : super(key: key);

  final double elevation;
  final Color color;
  final Color textColor;
  final VoidCallback handleCut;
  final VoidCallback handleCopy;
  final VoidCallback handlePaste;
  final VoidCallback handleSelectAll;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[];
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    if (handleCut != null)
      items.add(FlatButton(
          textColor: textColor,
          child: Text(localizations.cutButtonLabel),
          onPressed: handleCut));
    if (handleCopy != null)
      items.add(FlatButton(
          textColor: textColor,
          child: Text(localizations.copyButtonLabel),
          onPressed: handleCopy));
    if (handlePaste != null)
      items.add(FlatButton(
        textColor: textColor,
        child: Text(localizations.pasteButtonLabel),
        onPressed: handlePaste,
      ));
    if (handleSelectAll != null)
      items.add(FlatButton(
          textColor: textColor,
          child: Text(localizations.selectAllButtonLabel),
          onPressed: handleSelectAll));

    return Material(
      elevation: elevation,
      color: color,
      child: Container(
        height: 44.0,
        child: Row(mainAxisSize: MainAxisSize.min, children: items),
      ),
    );
  }
}
