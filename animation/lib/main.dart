

import 'package:animation/explicit_animation/animation_login_screen.dart';
import 'package:animation/explicit_animation/bouncing_ball_animation.dart';
import 'package:animation/explicit_animation/radial_progress_indicater.dart';
import 'package:animation/implecit_animation/animated_cart_button.dart';
import 'package:animation/implecit_animation/animation_dot_pulsing.dart';
import 'package:animation/page_rounting/first_screen.dart';
import 'package:flutter/material.dart';

import 'explicit_animation/animation_list.dart';
import 'implecit_animation/animated_color_pallet.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BouncingBallAnimation()
  ));
}
