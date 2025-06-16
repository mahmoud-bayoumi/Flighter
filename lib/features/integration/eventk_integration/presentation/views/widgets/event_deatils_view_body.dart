// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flighter/constants.dart';
import 'package:flighter/features/integration/eventk_integration/data/models/event_model/about_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/utils/styles.dart';

class EventDetailsViewBody extends StatelessWidget {
  final String eventName;
  final String description;
  final String startDate;
  final String endDate;
  final String imageUrl;
  final String organizationName;
  final List<AboutCategory> categories;

  const EventDetailsViewBody({
    super.key,
    required this.eventName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.organizationName,
    required this.categories,
  });

  String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    return DateFormat('EEE, MMM d, yyyy – h:mm a').format(date);
  }

  Future<void> _showDirectDialog(BuildContext context) async {
    final url = Uri.parse(
      'https://drive.google.com/drive/folders/1Wy6raV5lGkkuF07faTzLX8JSJ1Lly6Jv?usp=sharing',
    );

    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Redirect to Download'),
        content: Text(
          'You are about to be redirected to download the Eventk app from Google Drive:\n\n$url',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Could not open the link')),
                );
              }
            },
            child: const Text('Proceed'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
        title: Text(
          eventName,
          style: Styles.textStyle22.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image Banner with rounded corners and shadow
            Container(
              margin: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 250.h,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 250.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250.h,
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image,
                      size: 64, color: Colors.grey),
                ),
              ),
            ),

            // Content Padding
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    eventName,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Date Row
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 20, color: kPrimaryColor),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Text(
                          '${formatDate(startDate)} - ${formatDate(endDate)}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  // Organizer Row
                  Row(
                    children: [
                      const Icon(Icons.apartment,
                          size: 20, color: kPrimaryColor),
                      SizedBox(width: 8.w),
                      Text(
                        'Organized by $organizationName',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  const Divider(),

                  SizedBox(height: 20.h),

                  // About Section
                  Text(
                    'About the Event',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 30.h),
                  const Divider(),

                  SizedBox(height: 20.h),

                  // Categories Section
                  Text(
                    'Categories',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: categories
                        .map(
                          (cat) => ActionChip(
                            label: Text(
                              cat.categoryName ?? 'Unknown',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            backgroundColor: kPrimaryColor.withOpacity(0.15),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            onPressed: () {
                              // Optional: Implement action on category tap
                            },
                          ),
                        )
                        .toList(),
                  ),

                  SizedBox(height: 30.h),

                  // Direct Button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      onPressed: () => _showDirectDialog(context),
                      child: Text(
                        'Direct',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
