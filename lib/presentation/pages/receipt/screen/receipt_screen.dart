import 'package:core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ionicons/ionicons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

class ReceiptScreen extends StatelessWidget {
  ReceiptScreen({Key? key}) : super(key: key);

  final GlobalKey genKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Struk"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RepaintBoundary(
                key: genKey,
                child: Container(
                  // alignment: Alignment.center,
                  padding: EdgeInsets.only(left: AppSpacings.x4l, right: AppSpacings.x4l, top: 40.sp, bottom: 20.sp),
                  width: 90.w,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 0.2, blurRadius: 0.1)],
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "ALASTORE INC.",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                      Text(
                        "Jl. Imam Bonjol Talangagung, Kepanjen",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: AppSpacings.x2l.sp),
                      SizedBox(
                        height: 50.sp,
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tanggal",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "12-Juni-2022",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "No. Struk",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "TR20220809-001",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ]),
                      ),
                      Divider(),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                            child: Text("Qty"),
                          ),
                          Expanded(
                            child: Text(
                              "Nama Item",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                            child: Text("Harga"),
                          ),
                        ],
                      ),
                      Divider(),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(bottom: AppSpacings.s.sp),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                    child: Text("1"),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Sapu lidi jepang",
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                    child: Text("1.000",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            );
                          }),
                      Divider(),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subotal",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                "50.000",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                "0",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "50.000",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        "Terimakasih Sudah Berbelanja",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text("Made with Alapos")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 100.w,
        height: 70.sp,
        padding: EdgeInsets.symmetric(vertical: AppSpacings.l.sp, horizontal: AppSpacings.m),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, boxShadow: [
          BoxShadow(color: Theme.of(context).shadowColor),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromWidth(30.w),
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () {
                save("TR20220201-0001");
              },
              child: Row(
                children: [
                  Icon(
                    Ionicons.save_outline,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: AppSpacings.s.sp,
                  ),
                  Text(
                    "Simpan",
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromWidth(30.w),
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () async {
                var path = await save("TR20220201-0001");
                Share.shareFiles([path], text: "Bukti Pembelian");
              },
              child: Row(
                children: [
                  Icon(
                    Ionicons.share_social,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: AppSpacings.s.sp,
                  ),
                  Text(
                    "Bagikan",
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                minimumSize: Size.fromWidth(30.w),
              ),
              onPressed: () {
                // context.router.pushNamed(RouteName.receiptScreen);
              },
              child: Row(
                children: [
                  Icon(
                    Ionicons.receipt_outline,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: AppSpacings.s.sp,
                  ),
                  Text("Print"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  save(String fileName) async {
    RenderRepaintBoundary boundary = genKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = File('$directory/$fileName.png');
    imgFile.writeAsBytes(pngBytes);
    print(imgFile.path);
    return imgFile.path;
  }
}
