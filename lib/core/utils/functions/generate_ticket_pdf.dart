import 'package:flighter/core/utils/assets_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> generateTicketPDF({
  required String bookingDate,
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
  required String baggageAllowance,
  required String seatNumber,
  required String totalCost 
}) async {
  final pdf = pw.Document();
  final img = await rootBundle.load(AssetsData.kLogo);
  final imageBytes = img.buffer.asUint8List();
  final image = pw.MemoryImage(imageBytes);
  final egyImg = await rootBundle.load('assets/images/egyAir.png');
  final egyImageBytes = egyImg.buffer.asUint8List();
  final egyImage =
      pw.MemoryImage(egyImageBytes); // assets/images/flyEmeraites.png
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
                    pw.Image(egyImage,
                        width: 220.w, height: 70.h, fit: pw.BoxFit.cover),
                    pw.Image(image, width: 120.w, height: 120.h),
                  ]),
              pw.SizedBox(height: 10.h),
              pw.Text('Flighter Ticket Purchase Confirmation',
                  style: pw.TextStyle(
                    fontSize: 22.sp,
                    fontWeight: pw.FontWeight.bold,
                  )),
              pw.Divider(),
              pw.SizedBox(height: 20.h),
              pw.Text('Booking Date: $bookingDate',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Guest Name: $guestName',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 15.h),
              pw.Text('Flight Details',
                  style: pw.TextStyle(
                      fontSize: 22.sp, fontWeight: pw.FontWeight.bold)),
              pw.Divider(),
              pw.SizedBox(height: 20.h),
              pw.Text('From  :  $from', style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('To  :  $to', style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Airline  :  $airline',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Flight Number  :  $flightNumber',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Gate  :  $gate', style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Departure Date  :  $departureDate',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Arrival Date  :  $arrivalDate',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Duration  :  $duration',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Booking Status  :  $bookingStatus',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Seat Class  :  $seatClass',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Baggage allowance  :  $baggageAllowance',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
              pw.Text('Seat Number  :  $seatNumber',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.SizedBox(height: 10.h),
               pw.Text('Total Cost  :  $totalCost',
                  style: pw.TextStyle(fontSize: 18.sp)),
              pw.Align(
                  child: pw.Column(children: [
                    pw.Text('Thanks for booking using Flighter!',
                        style: pw.TextStyle(fontSize: 16.sp)),
                    pw.Text('We hope you have a pleasant journey.',
                        style: pw.TextStyle(fontSize: 12.sp)),
                  ]),
                  alignment: pw.Alignment.topRight),
            ],
          ),
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
