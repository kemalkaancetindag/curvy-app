import 'package:curvy_app/ui/widgets/hub/hub_empty.dart';
import 'package:curvy_app/ui/widgets/hub/hub_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HubScreen  extends StatelessWidget {
  const HubScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HubFoundWidget(),
    );
  }
}