import 'package:flutter/material.dart';
import 'package:flutter_task/ui/utils/app_colors.dart';
import 'package:flutter_task/ui/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class FailureWidget extends StatelessWidget {

  final String errorMessage;
  final Function tryAgainFunction;

  const FailureWidget({required this.errorMessage, required this.tryAgainFunction, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tryAgainFunction(),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            errorMessage == Constants.networkErrorMessage
                ?
            const CircleAvatar(
                maxRadius: 22.0,
                backgroundColor: AppColors.red,
                child: Icon(
                  Icons.wifi_off,
                  color: AppColors.white,
                  size: 30,
                )
            )
                :
            const Icon(
              Icons.error,
              color: AppColors.red,
              size: 45,
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
            Text(
              errorMessage,
              style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.refresh,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
                Text(
                  "Try Again",
                  style: GoogleFonts.poppins(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
