import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/utils/app_assets.dart';
import 'package:safar_maei/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaButton extends StatelessWidget {
  final SocialMediaPlatform platform;
  final VoidCallback? onTap;

  const SocialMediaButton({
    super.key,
    required this.platform,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => _launchSocialMedia(context, platform),
      child: Image.asset(
        _getPlatformImage(),
        width: 24.w,
        height: 24.h,
      ),
    );
  }

  String _getPlatformImage() {
    switch (platform) {
      case SocialMediaPlatform.facebook:
        return AppAssets.facebookIcon;
      case SocialMediaPlatform.twitter:
        return AppAssets.twitterIcon;
      case SocialMediaPlatform.instagram:
        return AppAssets.instagramIcon;
      case SocialMediaPlatform.snapchat:
        return AppAssets.snapchat;
      case SocialMediaPlatform.youtube:
        return AppAssets.youtubeIcon;
      case SocialMediaPlatform.whatsapp:
        return AppAssets.whatsappIcon;
      case SocialMediaPlatform.tiktok:
        return AppAssets.tiktokIcon;
    }
  }

  Future<void> _launchSocialMedia(BuildContext context, SocialMediaPlatform platform) async {
    final url = _getPlatformUrl(platform);
    try {
      if (!await launchUrl(Uri.parse(url))) {
        _showErrorSnackbar(context, 'error $url');
      }
    } catch (e) {
      _showErrorSnackbar(context, 'An error: ${e.toString()}');
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  String _getPlatformUrl(SocialMediaPlatform platform) {
    switch (platform) {
      case SocialMediaPlatform.facebook:
        return 'https://facebook.com';
      case SocialMediaPlatform.twitter:
        return 'https://twitter.com';
      case SocialMediaPlatform.instagram:
        return 'https://instagram.com';
      case SocialMediaPlatform.snapchat:
        return 'https://snapchat.com';
      case SocialMediaPlatform.youtube:
        return 'https://youtube.com';
      case SocialMediaPlatform.whatsapp:
        return 'https://wa.me/?text=Hello';
      case SocialMediaPlatform.tiktok:
        return 'https://tiktok.com';
    }
  }
}

enum SocialMediaPlatform {
  facebook,
  twitter,
  instagram,
  snapchat,
  youtube,
  whatsapp,
  tiktok,
}