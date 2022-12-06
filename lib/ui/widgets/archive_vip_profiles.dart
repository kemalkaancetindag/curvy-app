import 'package:curvy_app/ui/widgets/archive_vip_profile_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArchiveVipProfiles extends StatelessWidget {
  const ArchiveVipProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ArchiveVipProfileBox(),
                  ArchiveVipProfileBox()
                ],
              ))
            ],
          ),
        ));
  }
}
