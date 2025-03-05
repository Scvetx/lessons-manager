// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/assets/app_icons.dart';

enum AvatarSize { small, medium, large }

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    this.onTap,
    this.size = AvatarSize.medium,
    this.width,
    this.widthPlaceholder,
    this.isLoading = false,
  });

  final String? imageUrl;
  final VoidCallback? onTap;
  final AvatarSize size;
  final double? width;
  final double? widthPlaceholder;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final radius =  width ?? 
              (size == AvatarSize.small
                ? 20
              : size == AvatarSize.medium
                ? 30
                : 70);

    return isLoading ?
      CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        radius: radius,
      ) :
      InkWell(
        onTap: onTap,
        child: CircleAvatar(
           backgroundColor: Colors.blueGrey,
          backgroundImage: imageUrl != null 
              ? NetworkImage(imageUrl!)
              : const AssetImage(AppIcon.avatar) as ImageProvider<Object>,
          radius: radius,
        ),
      );
  }

}
