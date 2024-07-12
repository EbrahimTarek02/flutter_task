import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/data/models/get_products_response/get_products_response.dart';
import 'package:flutter_task/domain/di/di.dart';
import 'package:flutter_task/ui/screens/products/products_states.dart';
import 'package:flutter_task/ui/screens/products/products_view_model.dart';
import 'package:flutter_task/ui/screens/products/widgets/product_item.dart';
import 'package:flutter_task/ui/utils/app_assets.dart';
import 'package:flutter_task/ui/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatefulWidget {

  static const String routeName = "products_screen";

  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductsViewModel viewModel = getIt<ProductsViewModel>();

  @override
  void initState() {
    viewModel.getProducts();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.appLogo,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: viewModel.searchController,
                    keyboardType: TextInputType.text,

                    style: const TextStyle(
                        height: 1.0
                    ),

                    onChanged: (_) {
                      viewModel.searchForProducts();
                    },

                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        focusColor: AppColors.white,
                        hintText: "What do you search for?",
                        hintStyle: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const ImageIcon(
                            AssetImage(AppAssets.searchIcon)
                        ),
                        prefixIconColor: AppColors.primaryColor
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                        AssetImage(AppAssets.cartIcon)
                    )
                )
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03,),

            Expanded(
              child: BlocBuilder<ProductsViewModel, ProductsStates>(
                bloc: viewModel,
                builder: (context, state) {
                  if (state is ProductsErrorState) {
                    return Center(
                      child: Text(state.errorMessage)
                    );
                  }

                  else if (state is ProductsSuccessState<GetProductsResponse>) {
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: state.data.products!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: MediaQuery.sizeOf(context).width * 0.03,
                        mainAxisSpacing: MediaQuery.sizeOf(context).width * 0.03,
                        childAspectRatio: 0.7
                      ),
                      itemBuilder: (context, index) => ProductItem(product: state.data.products![index])
                    );
                  }

                  else {
                    return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
