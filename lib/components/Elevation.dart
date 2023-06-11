
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/otherConsts/other_consts.dart';

class ElevationCustom extends StatelessWidget {

  dynamic child;

  ElevationCustom({Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shadowColor: K.shadowColor,
      color: Colors.white,
      borderRadius: K.fieldRadius,
      child: child,
    );
  }
}
