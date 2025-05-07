import 'package:dashboard/Constants/Color_Manager.dart';
import 'package:dashboard/Features/Home/Data/Model/product_Model.dart';
import 'package:dashboard/Features/Home/Presentation/cubit/change_product_cubit.dart';
import 'package:dashboard/Features/Home/Presentation/widgets/Selected_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Constants/Text_Style_Manger.dart';
import '../cubit/get_pending_product_cubit.dart';
import '../cubit/get_pending_product_state.dart';

class CustomExpansionTileList extends StatelessWidget {
  const CustomExpansionTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PendingProductCubit, GetProductState>(
      listener: (context, state) {
        if (state is GetProductErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is GetProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetProductSuccessState) {
          final products = state.products;
          print("====================================$products");
          return Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CustomExpansionTile(product: products[index]);
              },
            ),
          );
        } else {
          return const Center(child: Text("No data available."));
        }
      },
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final ProductModel product;
  const CustomExpansionTile({required this.product, super.key});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.SecondaryColor,
        ),
        padding: const EdgeInsets.all(6),
        child: Icon(
          _isExpanded ? Icons.expand_less : Icons.expand_more,
          size: 30,
          color: ColorManager.PrimaryColor,
        ),
      ),
      trailing: SizedBox(),
      title: Text("${widget.product.name}", style: TextStyles.black14Bold),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "${widget.product.imageUrl}",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.SecondaryColor,
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Author", style: TextStyles.black16Bold),
                  Text(
                    "${widget.product.user?.firstName}${widget.product.user?.lastName}",
                    style: TextStyles.black14Regular,
                  ),
                ],
              ),
              Text("Description", style: TextStyles.black16Bold),
              Text("${widget.product.description}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price", style: TextStyles.black16Bold),
                  Text(
                    "${widget.product.price}",
                    style: TextStyles.black14Regular,
                  ),
                ],
              ),
              Text("Address", style: TextStyles.black16Bold),
              Text("${widget.product.address}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone", style: TextStyles.black16Bold),
                  Text(
                    "${widget.product.user?.mobileNumber}",
                    style: TextStyles.black14Regular,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectedButton(
                    text: "Decline",
                    color: ColorManager.redColor,
                    onPressed: () {
                      context.read<ChangeProductCubit>().deleteProduct(
                        widget.product.productId!,
                      );
                    },
                  ),
                  SelectedButton(
                    text: "Approved",
                    color: ColorManager.green,
                    onPressed: () {
                      context.read<ChangeProductCubit>().ChangeProductState(
                        widget.product.productId!,
                      );
                      context
                          .read<PendingProductCubit>()
                          .fetchPendingProducts();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],

      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
    );
  }
}
