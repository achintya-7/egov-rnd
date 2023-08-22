import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/controllers/trip_tracker_controllers.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/home/info_page_widget.dart';
import 'package:vehicle_tracker_app/widgets/home/start_trip_button.dart';

import 'status_info_widget.dart';

class TripInfoCardWidget extends StatelessWidget {
  TripInfoCardWidget({super.key, required this.data});
  final Rx<HomeTripModel> data;
  final textTheme = DigitTheme.instance.mobileTheme.textTheme;

  @override
  Widget build(BuildContext context) {
    return DigitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Heading
          GetBuilder<TripControllers>(
            id: data.value.id,
            builder: (tripControllers) => statusInfoWidget(data.value.status),
          ),

          //  Locality Heading
          Text(
            data.value.routeId.toUpperCase(),
            style: textTheme.headlineMedium,
          ),

          homeTextColumnWidget(data.value.operator.name, data.value.operator.contactNumber),

          DigitIconButton(
            iconText: AppTranslation.VIEW_DETAILS.tr,
            icon: Icons.arrow_forward,
            onPressed: () => Get.toNamed(INFO, arguments: data),
          ),

          StartTripButton(data: data)
        ],
      ),
    );
  }
}

Widget homeTextColumnWidget(String name, String phoneNumber) => Padding(
      padding: DigitTheme.instance.verticalMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddedText("Name", bold: true),
              paddedText("Mobile Number", bold: true),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddedText(name),
              paddedText(phoneNumber),
            ],
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
