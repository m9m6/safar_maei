import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Core imports
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

// Feature imports
import '../../../reusable_buttons/custom_bottom_sheet.dart';
import '../../../reusable_buttons/outlined_circler_button.dart';
import '../../../reusable_buttons/rectangular_fill_button.dart';
import '../../../reusable_buttons/reusable_others/driver_car_on_map.dart';
import '../../../reusable_buttons/reusable_others/location_field.dart';
import '../../../reusable_buttons/reusable_others/my_current_location.dart';
import '../../../reusable_buttons/type_of_ride_button.dart';
import '../../profile/main_profile_screen.dart';
import '../../profile/profile_tabs.dart';
import 'driver_card.dart';

class HomeScreenRide extends StatefulWidget {
  static const String routeName = 'HomeScreenRide';

  const HomeScreenRide({super.key});

  @override
  State<HomeScreenRide> createState() => _HomeScreenRideState();
}

class _HomeScreenRideState extends State<HomeScreenRide> {
  //Properties
  late GoogleMapController _mapController;
  String _mapStyle = '';
  bool _isFareButtonEnabled = false;
  bool _showTotalPriceButton = false;
  String _totalPrice = '67 EGP';

  // Initial map position
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 12,
  );

  //Lifecycle Method
  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  //Private Methods
  /// Loads custom map style from assets
  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Google Map
          _buildMapView(),

          // Nearby Driver
          _buildDriverMarkers(),

          // Current User Location
          MyCurrentLocation(top: 288.h, left: 166.w),

          // Top Action Buttons (Notification & Settings)
          _buildTopActionButtons(),

          // Bottom Ride Selection Sheet
          _buildBottomRideSheet(),

          // Total Price Button
          if (_showTotalPriceButton) _buildTotalPriceButton(),
        ],
      ),
    );
  }

  //Widget Builders

  /// Builds the main Google Map view
  Widget _buildMapView() {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      onMapCreated: (controller) {
        _mapController = controller;
        _mapController.setMapStyle(_mapStyle);
      },
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
    );
  }

  /// Builds nearby driver markers on the map
  Widget _buildDriverMarkers() {
    return Stack(
      children: [
        DriverCarOnMap(top: 99.h, left: 117.w),
        DriverCarOnMap(top: 186.h, left: 249.w),
        DriverCarOnMap(top: 316.h, left: 66.w),
        DriverCarOnMap(top: 344.h, left: 244.w),
      ],
    );
  }

  /// Builds top notification and settings buttons
  Widget _buildTopActionButtons() {
    return Positioned(
      top: 20.h,
      left: 20.w,
      right: 20.w,
      child: Row(
        children: [
          // Notification Button
          OutlinedCircularButton(
            width: 40.w,
            height: 40.h,
            onTap: _navigateToProfile,
            child: Image.asset(
              AppAssets.notificationIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),

          const Spacer(),

          // Settings Button
          OutlinedCircularButton(
            width: 40.w,
            height: 40.h,
            onTap: _navigateToProfile,
            child: Image.asset(
              AppAssets.settingIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds bottom ride selection sheet
  Widget _buildBottomRideSheet() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: CustomBottomSheet(
        height: 398.h,
        child: Column(
          children: [
            // Ride Type Selection Buttons
            _buildRideTypeButtons(),
            SizedBox(height: 24.h),

            // Destination Input Fields
            _buildDestinationInputs(),
            SizedBox(height: 24.h),

            // Action Buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  /// Builds buttons (Ride, Transfer, Travel)
  Widget _buildRideTypeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TypeOfRideButton(
          onTap: _showRideDetailsBottomSheet,
          imagePath: AppAssets.rideIcon,
          text: 'Ride',
          containerSize: 64.w,
        ),
        TypeOfRideButton(
          onTap: _showRideDetailsBottomSheet,
          imagePath: AppAssets.transferIcon,
          text: 'Transfer',
          containerSize: 64.w,
        ),
        TypeOfRideButton(
          onTap: _showRideDetailsBottomSheet,
          imagePath: AppAssets.travelIcon,
          text: 'Travel',
          containerSize: 64.w,
        ),
      ],
    );
  }

  /// Builds input fields
  Widget _buildDestinationInputs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Where are you going today?',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 8.h),
        LocationField(
          height: 48.h,
          hintText: 'Current address',
          prefixIconPath: AppAssets.locationCurrent,
        ),
        SizedBox(height: 20.h),
        LocationField(
          height: 48.h,
          hintText: 'Enter destination',
          prefixIconPath: AppAssets.locationDestnation,
        ),
      ],
    );
  }

  /// Builds action buttons at the bottom
  Widget _buildActionButtons() {
    return Column(
      children: [
        RectangularFillButton(
          text: 'Offer your fare',
          onTap: () {}, // Would be connected to bloc in real implementation
          backgroundColor: AppColors.noColor,
          borderColor: _isFareButtonEnabled
              ? AppColors.secondaryColor
              : AppColors.blackGray,
          textColor: _isFareButtonEnabled
              ? AppColors.secondaryColor
              : AppColors.blackGray,
          height: 48.h,
        ),
        SizedBox(height: 8.h),
        RectangularFillButton(
          text: 'Find a driver',
          onTap: () {}, // Would be connected to bloc in real implementation
          height: 48.h,
        ),
      ],
    );
  }

  /// Builds the total price button that appears
  Widget _buildTotalPriceButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 68, left: 73),
      child: RectangularFillButton(
        text: 'Total Price: $_totalPrice',
        onTap: _showTotalPriceDetailsBottomSheet,
        height: 40.h,
        width: 230.w,
      ),
    );
  }

  // MARK: - Navigation Methods

  /// Navigates to the profile screen
  void _navigateToProfile() {
    Navigator.of(context).pushNamed(MainProfileScreen.routeName);
  }

  //Bottom Sheet Methods

  /// Shows ride details bottom sheet
  void _showRideDetailsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent.withOpacity(0.9),
      builder: (context) => _buildRideDetailsSheetContent(),
    ).whenComplete(() {
      setState(() {
        _isFareButtonEnabled = true;
        _showTotalPriceButton = true;
      });
    });
  }


  Widget _buildRideDetailsSheetContent() {
    return CustomBottomSheet(
      height: 650.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saved Location', style: AppStyles.bodyMM.copyWith(fontSize: 16)),
          SizedBox(height: 8.h),
          _buildSavedLocationsRow(),
          SizedBox(height: 20.h),
          LocationField(
            height: 48.h,
            hintText: 'Current address',
            prefixIconPath: AppAssets.locationCurrent,
          ),
          SizedBox(height: 20.h),
          LocationField(
            height: 48.h,
            hintText: 'Enter destination',
            prefixIconPath: AppAssets.locationDestnation,
          ),
          SizedBox(height: 20.h),
          ProfileTabs(text: ' Chalotte St', iconColor: AppColors.noColor),
          ProfileTabs(text: ' Chalot Coffee shop', iconColor: AppColors.noColor),
          ProfileTabs(text: ' Chalotte University', iconColor: AppColors.noColor),
        ],
      ),
    );
  }

  Widget _buildSavedLocationsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSavedLocationButton('Home'),
        _buildSavedLocationButton('Office'),
        _buildSavedLocationButton('School'),
        _buildAddNewLocationButton(),
      ],
    );
  }

  Widget _buildSavedLocationButton(String label) {
    return Column(
      children: [
        OutlinedCircularButton(
          width: 32.w,
          height: 32.h,
          onTap: () {}, // Would connect to location selection in real implementation
          backgroundColor: AppColors.secondaryColor,
          borderColor: Colors.white,
          child: const Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(height: 4.h),
        Text(label, style: AppStyles.welcomeButtonText2.copyWith(fontSize: 12.sp)),
      ],
    );
  }

  /// Add New location button
  Widget _buildAddNewLocationButton() {
    return Column(
      children: [
        OutlinedCircularButton(
          width: 32.w,
          height: 32.h,
          onTap: () {}, // Would connect to add location flow in real implementation
          backgroundColor: AppColors.noColor,
          borderColor: AppColors.secondaryColor,
          child: Icon(
            Icons.add_circle,
            color: AppColors.secondaryColor,
            size: 30,
          ),
        ),
        SizedBox(height: 4.h),
        Text('Add New', style: AppStyles.welcomeButtonText2.copyWith(fontSize: 12.sp)),
      ],
    );
  }


  void _showTotalPriceDetailsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent.withOpacity(0.9),
      builder: (context) => _buildTotalPriceSheetContent(),
    );
  }

  /// Builds the content for the total price bottom sheet
  Widget _buildTotalPriceSheetContent() {
    return CustomBottomSheet(
      height: 375.h,
      child: Center(
        child: Column(
          children: [
            Text('Offer your fare', style: AppStyles.title.copyWith(fontSize: 24.sp)),
            SizedBox(height: 24.h),
            _buildPriceInputField(),
            SizedBox(height: 8.h),
            _buildLowestPriceText(),
            SizedBox(height: 40.h),
            RectangularFillButton(
              text: 'Apply',
              onTap: _showDriverSelectionBottomSheet,
            ),
          ],
        ),
      ),
    );
  }

  /// price input field with EGP label
  Widget _buildPriceInputField() {
    return SizedBox(
      width: 219.w,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            cursorColor: AppColors.black,
            textAlign: TextAlign.center,
            style: AppStyles.title.copyWith(fontSize: 32.sp, color: AppColors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              contentPadding: EdgeInsets.only(right: 40),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 80),
            child: Text(
              'Egp',
              style: AppStyles.bodyMM.copyWith(fontSize: 16.sp, color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLowestPriceText() {
    return RichText(
      text: TextSpan(
        style: AppStyles.bodySmallRegular,
        children: [
          const TextSpan(text: 'Lowest price for the trip:'),
          TextSpan(
            text: '55 Egp',
            style: AppStyles.bodySmallRegular.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// driver selection bottom sheet
  void _showDriverSelectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent.withOpacity(0.9),
      builder: (context) => _buildDriverSelectionSheetContent(),
    );
  }

  /// Builds the content for the driver bottom sheet
  Widget _buildDriverSelectionSheetContent() {
    return CustomBottomSheet(
      height: 650.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Looking for a driver', style: AppStyles.title.copyWith(fontSize: 24.sp)),
              const Spacer(),
              _buildCountdownTimer(),
            ],
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDriverList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the countdown timer widget
  Widget _buildCountdownTimer() {
    return StreamBuilder<int>(
      stream: Stream.periodic(const Duration(seconds: 1), (sec) => sec).take(60),
      builder: (context, snapshot) {
        final totalSeconds = 60 - (snapshot.data ?? 0);
        final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
        final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
        return Text(
          '$minutes:$seconds',
          style: AppStyles.welcomeButtonText2.copyWith(
            color: totalSeconds <= 10 ? Colors.red : AppColors.secondaryColor,
          ),
        );
      },
    );
  }

  /// Builds the list of available drivers
  Widget _buildDriverList() {
    return Column(
      children: [
        DriverCard(
          driverName: 'Sergio Ramasis',
          distance: '5mins away',
          carInfo: 'Type of car | number of car',
          rating: 4.9,
          price: '60 EGP',
          onAccept: () {}, // Would connect to driver acceptance in real implementation
        ),
        SizedBox(height: 20.h),
        DriverCard(
          driverName: 'Sergio Ramasis',
          distance: '5mins away',
          carInfo: 'Type of car | number of car',
          rating: 4.9,
          price: '60 EGP',
          onAccept: () {},
        ),
        SizedBox(height: 20.h),
        DriverCard(
          driverName: 'Sergio Ramasis',
          distance: '5mins away',
          carInfo: 'Type of car | number of car',
          rating: 4.9,
          price: '60 EGP',
          onAccept: () {},
        ),
        SizedBox(height: 20.h),
        DriverCard(
          driverName: 'Sergio Ramasis',
          distance: '5mins away',
          carInfo: 'Type of car | number of car',
          rating: 4.9,
          price: '60 EGP',
          onAccept: () {},
        ),
      ],
    );
  }
}