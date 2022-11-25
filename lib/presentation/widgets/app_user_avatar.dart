import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';

class AppUserAvatar extends StatelessWidget {
  const AppUserAvatar({
    Key? key,
    required this.url,
    this.withNicname = false,
    this.width = 32,
    this.height = 32,
    this.action,
    required this.userName,
  }) : super(key: key);

  final String? url;
  final String userName;
  final bool withNicname;
  final double width;
  final double height;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: action,
      child: Row(
        children: [
          if (url != null && url!.isNotEmpty)
            SizedBox(
              width: width,
              height: height,
              child: CachedNetworkImage(
                imageUrl: url!,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    const AppLoading(selected: LoadingVariants.v2),
                errorWidget: (_, __, ___) =>
                    const AppLoading(selected: LoadingVariants.v2),
              ),
            )
          else
            SizedBox(
              width: width,
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: ColoredBox(
                  color: ColorName.grey,
                  child: Center(
                    child: Text(
                      userName[0].toUpperCase(),
                      style: AppTypography.sf.w500.s18.black,
                    ),
                  ),
                ),
              ),
            ),
          if (withNicname) ...[
            const SizedBox(width: 8),
            Text(
              userName,
              style: AppTypography.sf.w500.s18.black,
            ),
          ],
        ],
      ),
    );
  }
}
