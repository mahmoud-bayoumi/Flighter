import 'dart:convert';
import 'dart:ui';

import 'package:flighter/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:qr_flutter/qr_flutter.dart' as qr;

import '../../../constants.dart';
import '../secure_storage.dart';

// Convert QR to an image to insert into PDF
Future<Uint8List> generateQrCodeImage(String data) async {
  final qrValidationResult = qr.QrValidator.validate(
    data: data,
    version: qr.QrVersions.auto,
    errorCorrectionLevel: qr.QrErrorCorrectLevel.Q,
  );
  final qrCode = qrValidationResult.qrCode!;
  final painter = qr.QrPainter.withQr(
    qr: qrCode,
    gapless: true,
    color: Colors.black,
    emptyColor: Colors.white,
  );

  final picData = await painter.toImageData(300, format: ImageByteFormat.png);
  return picData!.buffer.asUint8List();
}

Future<void> generateTicketPDF(
    {required String bookingDate,
    required String guestName,
    required String from,
    required String to,
    required String airline,
    required String flightNumber,
    required String gate,
    required String departureDate,
    required String arrivalDate,
    required String duration,
    required String bookingStatus,
    required String seatClass,
    required String ticketType,
    required String ticketCode,
    String? returnDepartureDate,
    required String baggageAllowance,
    required String seatNumber,
    required String totalCost,
    required String imageP}) async {
  final pdf = pw.Document();
  final img = await rootBundle.load(AssetsData.kLogo);
  final imageBytes = img.buffer.asUint8List();
  final image = pw.MemoryImage(imageBytes);

  Future<pw.MemoryImage> loadPdfImageFromAsset(String imagePath) async {
    final byteData = await rootBundle.load(imagePath);
    final imageBytes = byteData.buffer.asUint8List();
    return pw.MemoryImage(imageBytes);
  }

  final pw.MemoryImage mImage = await loadPdfImageFromAsset(imageP);
/*
  final egyImg = await rootBundle.load('assets/images/egyAir.png');
  final egyImageBytes = egyImg.buffer.asUint8List();
  final egyImage =
      pw.MemoryImage(egyImageBytes); // assets/images/flyEmeraites.png
 */
  String userId = (await const SecureStorageService().getWithKey(userIdKey))!;

  final qrDataString =
      jsonEncode(base64Encode(utf8.encode(userId + ticketCode + guestName)));

  final qrImageData = await generateQrCodeImage(qrDataString);

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(mImage,
                        width: 220.w, height: 70.h, fit: pw.BoxFit.cover),
                    pw.Image(image, width: 120.w, height: 120.h),
                  ]),
              pw.SizedBox(height: 7.h),
              pw.Text('Flighter Ticket Purchase Confirmation',
                  style: pw.TextStyle(
                    fontSize: 22.sp,
                    fontWeight: pw.FontWeight.bold,
                  )),
              pw.Divider(),
              pw.SizedBox(height: 7.h),
              pw.Text('Booking Date: $bookingDate',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Guest Name: $guestName',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Flight Details',
                  style: pw.TextStyle(
                      fontSize: 22.sp, fontWeight: pw.FontWeight.bold)),
              pw.Divider(),
              pw.SizedBox(height: 7.h),
              pw.Text('From  :  $from', style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('To  :  $to', style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Ai..001rline  :  $airline',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Flight Number  :  $flightNumber',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Gate  :  $gate', style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Departure Date  :  $departureDate',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Arrival Date  :  $arrivalDate',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              returnDepartureDate != null
                  ? pw.SizedBox(height: 7.h)
                  : pw.SizedBox.shrink(),
              returnDepartureDate != null
                  ? pw.Text('Return Departure Date  :  $returnDepartureDate',
                      style: pw.TextStyle(fontSize: 18.sp))
                  : pw.SizedBox.shrink(),
              returnDepartureDate != null
                  ? pw.SizedBox(height: 7.h)
                  : pw.SizedBox.shrink(),
              pw.Text('Duration  :  $duration',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Booking Status  :  $bookingStatus',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Seat Class  :  $seatClass',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Ticket Type  :  $ticketType',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Ticket Code  :  $ticketCode',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Baggage allowance  :  $baggageAllowance',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Seat Number  :  $seatNumber',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 7.h),
              pw.Text('Total Cost  :  $totalCost',
                  style: pw.TextStyle(fontSize: 18.sp)),
            ],
          ),
        );
      },
    ),
  );
  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Flight Ticket QR-Code',
                style: pw.TextStyle(
                  fontSize: 22.sp,
                  fontWeight: pw.FontWeight.bold,
                )),
            pw.Divider(),
            pw.SizedBox(height: 30.h),
            pw.Text('Scan this QR code at the gate',
                style: pw.TextStyle(
                  fontSize: 18.sp,
                )),
            pw.SizedBox(height: 90.h),
            pw.Center(
              child: pw.Image(pw.MemoryImage(qrImageData),
                  width: 250.h, height: 250.h),
            ),
            pw.SizedBox(height: 40.h),
            pw.SizedBox(height: 200.h),
            pw.Align(
                child: pw.Column(children: [
                  pw.Text('Thanks for booking using Flighter!',
                      style: pw.TextStyle(fontSize: 22.sp)),
                  pw.Text('We hope you have a pleasant journey.',
                      style: pw.TextStyle(fontSize: 16.sp)),
                ]),
                alignment: pw.Alignment.center),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
