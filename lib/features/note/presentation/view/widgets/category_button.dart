import 'package:get/get.dart';

import '/config/all_imports.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    required this.color,
    required this.text,
    required this.isHomeScreen,
    required this.route,
    this.image,
    this.isClick = false,
    this.icon,
    super.key,
  });

  final IconData? icon;
  final String? image;
  final Color color;
  final String text;
  final bool isClick;
  final String route;
  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
        onTap: () async {
          isHomeScreen ? await Get.toNamed(route) : await Get.offNamed(route);
        },
        child: Container(
          height: ManagerHeight.h50,
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w16,
          ),
          decoration: BoxDecoration(
            color: isClick ? color : ManagerColors.white,
            borderRadius: BorderRadius.circular(ManagerRadius.r10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: ManagerColors.shadowColors,
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: ManagerHeight.h32,
                width: ManagerWidth.w32,
                alignment: AlignmentDirectional.center,
                margin: EdgeInsetsDirectional.only(
                  end: ManagerWidth.w10,
                ),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: image != null
                      ? SvgPicture.asset(
                          image!,
                          alignment: AlignmentDirectional.bottomCenter,
                        )
                      : Icon(
                          icon,
                          color: ManagerColors.white,
                        ),
                ),
              ),
              Text(
                text,
                style: isClick
                    ? Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: ManagerColors.white)
                    : Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
