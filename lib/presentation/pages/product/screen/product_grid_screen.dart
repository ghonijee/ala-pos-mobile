import 'package:ala_pos/presentation/pages/product/cubit/form/form_product_cubit.dart';
import 'package:ala_pos/presentation/widgets/side_menu/widgets/side_menu_widget.dart';
import 'package:ala_pos/routes/route_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import '../cubit/master/master_product_cubit.dart';
import '../widgets/product_item_widget.dart';

class ProductGridScreen extends HookWidget {
  const ProductGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final scrollController = useScrollController();
    var searchHasValue = useState<bool>(false);

    var masterProductCubit = context.read<MasterProductCubit>();

    masterProductCubit.getProductList(initialData: true);

    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        masterProductCubit.getProductList(nextPage: true, initialData: false);
      }
      // if (scrollController.offset <= (scrollController.position.maxScrollExtent / -5)) {
      //   masterProductCubit.getProductList(initialData: true);
      // }
    });

    return BlocConsumer<MasterProductCubit, MasterProductState>(
      listener: (context, state) {
        //
      },
      builder: (context, state) {
        return Scaffold(
          drawer: SideMenuWidget(),
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text(
              "Daftar Produk",
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await context.read<FormProductCubit>().createProduct();
                  context.router.navigateNamed(RouteName.productForm);
                },
                icon: Icon(
                  Ionicons.bag_add_sharp,
                  size: 15.sp,
                ),
              )
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              masterProductCubit.getProductList(initialData: true);
            },
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSpacings.m.sp),
                    height: 100.h,
                    color: Theme.of(context).colorScheme.surface,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: searchController,
                          style: Theme.of(context).textTheme.bodyText1,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              searchHasValue.value = true;
                            } else {
                              searchHasValue.value = false;
                            }
                          },
                          textAlignVertical: TextAlignVertical.center,
                          onEditingComplete: () {
                            if (searchController.text.isNotEmpty) {
                              masterProductCubit.getProductList(value: searchController.text, initialData: true);
                            } else {
                              masterProductCubit.getProductList(value: '', initialData: true);
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: Icon(
                                searchHasValue.value ? Ionicons.close_outline : Ionicons.search_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () {
                                if (searchHasValue.value) {
                                  searchController.clear();
                                  searchHasValue.value = false;
                                  masterProductCubit.getProductList(value: '', initialData: true);
                                }
                              },
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Ionicons.barcode_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () async {
                                String barcodeScanRes;

                                try {
                                  barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                    '#ff6666',
                                    'Cancel',
                                    true,
                                    ScanMode.BARCODE,
                                  );

                                  searchController.text = barcodeScanRes;
                                } on PlatformException {
                                  barcodeScanRes = 'Failed to get platform version.';
                                }
                                if (searchController.text.isNotEmpty) {
                                  masterProductCubit.getProductList(value: searchController.text, initialData: true);
                                }
                              },
                            ),
                            hintText: "Nama/Kode Barang",
                          ),
                        ),
                        SizedBox(
                          height: AppSpacings.m.sp,
                        ),
                        state.maybeWhen(
                          empty: () {
                            return Expanded(
                                child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/empty/product_empty.png"),
                                  Text("Belum ada produk"),
                                  SizedBox(
                                    height: AppSpacings.xl.sp,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(fixedSize: Size(60.w, 35.sp)),
                                    onPressed: () async {
                                      await context.read<FormProductCubit>().createProduct();

                                      context.router.pushNamed(RouteName.productForm);
                                    },
                                    child: Text("Buat Sekarang"),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ));
                          },
                          notFound: () {
                            return Expanded(
                                child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/empty/search_empty_state.png"),
                                  Text("Produk tidak ditemukan"),
                                  SizedBox(
                                    height: AppSpacings.xl.sp,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ));
                          },
                          loading: () {
                            return Expanded(
                                child: Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ),
                            ));
                          },
                          loaded: (data, nextPage) {
                            return Expanded(
                              child: ListView.separated(
                                  separatorBuilder: (_, index) => Divider(),
                                  controller: scrollController,
                                  itemCount: nextPage ? data.length + 1 : data.length,
                                  itemBuilder: (context, index) {
                                    return index >= data.length
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              context.read<FormProductCubit>().showProduct(data[index]);
                                              context.router.pushNamed(RouteName.productForm);
                                            },
                                            child: ProductItemWidget(data[index]),
                                          );
                                  }),
                            );
                          },
                          orElse: () {
                            return Expanded(
                                child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Produk Belum Tersedia"),
                                  IconButton(
                                    onPressed: () async {
                                      // await masterProductCubit.getProductList(initialData: true);
                                    },
                                    icon: Icon(Ionicons.reload),
                                  )
                                ],
                              ),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
