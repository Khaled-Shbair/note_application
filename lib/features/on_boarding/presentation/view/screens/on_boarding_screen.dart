import 'package:get/get.dart';
import '/config/all_imports.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.white,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: ManagerColors.white,
            automaticallyImplyLeading: false,
            actions: [
              Visibility(
                visible: !controller.isFirstPage(),
                child: MainButton(
                  onPressed: controller.backButton,
                  child: Text(
                    ManagerStrings.back,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              const Spacer(),
              Visibility(
                visible: !controller.isLastPage(),
                child: MainButton(
                  onPressed: controller.skipButton,
                  child: Text(
                    ManagerStrings.skip,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  controller.image,
                  // fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                Container(
                  height: ManagerHeight.h398,
                  padding: EdgeInsetsDirectional.only(
                    top: ManagerHeight.h32,
                    start: ManagerWidth.w26,
                    end: ManagerWidth.w26,
                  ),
                  decoration: BoxDecoration(
                    color: ManagerColors.whiteLightColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ManagerRadius.r20),
                      topRight: Radius.circular(ManagerRadius.r20),
                    ),
                    boxShadow: [
                      const BoxShadow(
                        color: ManagerColors.white,
                        offset: Offset(
                          Constants
                              .xOffsetOfBoxShadow1ToBottomContainerInOnBoardingScreen,
                          Constants
                              .yOffsetOfBoxShadow1ToBottomContainerInOnBoardingScreen,
                        ),
                        blurRadius: Constants
                            .blurRadiusOfBoxShadowToBottomContainerInOnBoardingScreen,
                        spreadRadius: Constants.spreadRadius,
                      ),
                      BoxShadow(
                        color: ManagerColors.shadowColor,
                        offset: const Offset(
                          Constants
                              .xOffsetOfBoxShadow2ToBottomContainerInOnBoardingScreen,
                          Constants
                              .yOffsetOfBoxShadow2ToBottomContainerInOnBoardingScreen,
                        ),
                        blurRadius: Constants
                            .blurRadiusOfBoxShadowToBottomContainerInOnBoardingScreen,
                        spreadRadius: Constants.spreadRadius,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      MyLinearProgressIndicator(
                        pageOne: controller.isFirstPage(),
                        pageTwo: controller.isSecondPage(),
                        pageThree: controller.isLastPage(),
                      ),
                      Container(
                        height: ManagerHeight.h90,
                        width: double.infinity,
                        alignment: AlignmentDirectional.center,
                        margin: EdgeInsetsDirectional.only(
                          start: ManagerWidth.w24,
                          end: ManagerWidth.w24,
                          bottom: ManagerHeight.h6,
                          top: ManagerHeight.h60,
                        ),
                        child: Text(
                          controller.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        height: ManagerHeight.h62,
                        width: double.infinity,
                        alignment: AlignmentDirectional.center,
                        margin: EdgeInsetsDirectional.only(
                          start: ManagerWidth.w2,
                          end: ManagerWidth.w2,
                          bottom: ManagerHeight.h24,
                        ),
                        child: Text(
                          controller.subTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Visibility(
                        visible: !controller.isLastPage(),
                        replacement: OnBoardingButton(
                          text: ManagerStrings.getStarted,
                          onPressed: controller.getStartedButton,
                        ),
                        child: OnBoardingButton(
                          text: ManagerStrings.next,
                          onPressed: controller.nextButton,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
