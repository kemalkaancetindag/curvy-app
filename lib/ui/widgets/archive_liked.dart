import 'package:curvy_app/ui/widgets/archive_liked_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArchiveLiked extends StatelessWidget {
  const ArchiveLiked({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ArchiveLikedBox(),
                  ArchiveLikedBox(),
                  ArchiveLikedBox()
                ],
              )
            ],
          ),
        ));
  }
}
