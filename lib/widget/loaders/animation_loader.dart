import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoader extends StatelessWidget {
  const TAnimationLoader(
      {super.key,
      required this.animation,
      this.showAction = false,
      this.onActionpressed,
      this.Actiontext});
// final String text;
  final String animation;
  final bool showAction;
  final String? Actiontext;
  final VoidCallback? onActionpressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          // SizedBox(
          //   height: 50,
          // ),
          // Text(
          //   text,
          //   style: Theme.of(context).textTheme.bodyMedium,
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(
            height: 50,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionpressed,
                      child: Text(
                        Actiontext!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.grey),
                      )),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
