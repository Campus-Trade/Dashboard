import 'package:dashboard/Constants/Color_Manager.dart';
import 'package:dashboard/Features/Home/Presentation/cubit/Approved_products_count.dart';
import 'package:dashboard/Features/Home/Presentation/cubit/get_pending_product_cubit.dart';
import 'package:dashboard/Features/Home/Presentation/cubit/get_pending_product_state.dart';
import 'package:dashboard/Features/Home/Presentation/widgets/AppBar_Upload.dart';
import 'package:dashboard/Features/Home/Presentation/widgets/State_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../widgets/Custom_Row.dart';
import '../widgets/ExpansionPanel_List.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ApprovedProductsCountProvider>(
        context,
        listen: false,
      ).startListening();
    });
  }

  Widget build(BuildContext context) {
    final countProvider = Provider.of<ApprovedProductsCountProvider>(context);
    return Scaffold(
      appBar: AppBarUpload(isvisible: true),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 10.5.w, right: 10.5.w),
        child: Column(
          children: [
            Row(
              children: [
                BlocBuilder<PendingProductCubit, GetProductState>(
                  builder: (context, state) {
                    String pendingCount = "0";
                    if (state is GetProductSuccessState) {
                      pendingCount = state.products.length.toString();
                    }
                    return ContainerState(
                      colorIcon: ColorManager.SecondaryColor,
                      color: ColorManager.lightBlue,
                      contentContainer: "pending",
                      iconContainer: Icons.more_horiz,
                      titleContainer: pendingCount,
                    );
                  },
                ),
                SizedBox(width: 12.w),
                ContainerState(
                  colorIcon: ColorManager.greencolor,
                  color: ColorManager.lightGreen,
                  contentContainer: "Approved",
                  iconContainer: Icons.grading,
                  titleContainer: "${countProvider.count}",
                ),
              ],
            ),
            SizedBox(height: 30.5.h),
            CustomRow(),

            CustomExpansionTileList(),
          ],
        ),
      ),
    );
  }
}
