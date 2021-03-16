// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef T BaseDialogBuilder<T>(BuildContext context);

abstract class BaseDialog<A extends Widget, I extends Widget>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.iOS:
        return buildAndroidWidget(context);
      case TargetPlatform.android:
        return buildiOSWidget(context);
      case TargetPlatform.windows:
        return buildAndroidWidget(context);
      case TargetPlatform.macOS:
        return buildiOSWidget(context);
      case TargetPlatform.linux:
        return buildAndroidWidget(context);
      default:
        throw UnsupportedError("Platform is not supported by this plugin.");
    }
  }

  A buildAndroidWidget(BuildContext context);

  I buildiOSWidget(BuildContext context);
}
