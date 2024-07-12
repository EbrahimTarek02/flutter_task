import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';
import 'package:flutter_task/domain/di/di.dart';
import 'package:flutter_task/ui/screens/products/products_view_model.dart';
import 'package:flutter_task/ui/utils/app_assets.dart';
import 'package:flutter_task/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  final Products product;
  final ProductsViewModel viewModel = getIt<ProductsViewModel>();

  ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 1.2),
        borderRadius: BorderRadius.circular(15.0),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                    imageUrl: product.images?.first ?? "",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14.0),
                            topRight: Radius.circular(14.0)),
                      ),
                    ),
                    progressIndicatorBuilder: (_, __, ___) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (_, __, ___) => const Center(
                      child: Icon(Icons.error, color: AppColors.red,),
                    )),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    maxRadius: 15.0,
                    child: IconButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          shadowColor: AppColors.primaryColor,
                          padding: EdgeInsets.zero,
                          elevation: 3.0),
                      icon: const ImageIcon(
                        AssetImage(AppAssets.wishListIcon),
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              product.title ?? "Product Title",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              product.description ?? "Product Description",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  child: Text(
                    "EGP ${product.price?.toStringAsFixed(2)}",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.13,
                  child: Text(
                    "${viewModel.calculateProductPriceBeforeDiscount(product.price, product.discountPercentage)} EGP",
                    style: GoogleFonts.poppins(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor.withOpacity(0.7),
                        decoration: TextDecoration.lineThrough,
                        letterSpacing: -0.3
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Text(
                  "Review (${product.rating?.toStringAsFixed(2)})",
                  style: GoogleFonts.poppins(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

                const Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.yellow,
                  size: 20,
                ),

                const Spacer(),

                InkWell(
                  onTap: () {},

                  child: const ImageIcon(
                    AssetImage(AppAssets.plusIcon),
                    color: AppColors.primaryColor,
                    size: 20.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
