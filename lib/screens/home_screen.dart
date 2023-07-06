import 'package:flutter/material.dart';
import 'package:gitspy/screens/home_desktop.dart';
import 'package:gitspy/screens/home_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
              // Desktop layout
              return const HomeDesktop();
            } else {
              // Mobile layout
              return const HomeMobile();
            }
          },
        ),
      ),
    );
  }
}