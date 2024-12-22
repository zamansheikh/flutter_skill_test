import 'package:flutter/material.dart';
import 'package:flutter_skill_test/core/utils/app_colors.dart';
import 'package:flutter_skill_test/features/home/domain/entities/house.dart';
import 'package:flutter_skill_test/features/home/presentation/pages/maps_view_screen.dart';
import 'package:flutter_skill_test/features/home/presentation/widgets/see_more_widget.dart';

class HouseDetailPage extends StatefulWidget {
  final House house;
  const HouseDetailPage({super.key, required this.house});

  @override
  State<HouseDetailPage> createState() => _HouseDetailPageState();
}

class _HouseDetailPageState extends State<HouseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //House Card
                Stack(
                  children: [
                    Container(
                      height: 325,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(widget.house.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .24),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .24),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              debugPrint('Bookmarked');
                            },
                            icon: Icon(
                              Icons.bookmark_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.house.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              shadows: [
                                Shadow(
                                  offset: Offset(2.0, 2.0), // X and Y offsets
                                  blurRadius: 4.0, // Blur intensity
                                  color: Colors.grey.withValues(
                                    red: 0,
                                    green: 0,
                                    blue: 0,
                                    alpha: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.house.address,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                  offset: Offset(2.0, 2.0), // X and Y offsets
                                  blurRadius: 4.0, // Blur intensity
                                  color: Colors.grey.withValues(
                                    red: 0,
                                    green: 0,
                                    blue: 0,
                                    alpha: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        children: [
                          //bedrooms and bathrooms
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: .20),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.hotel,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            "${widget.house.bedrooms} Bedroom",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.83,
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: .20),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.bathtub,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            "${widget.house.bathrooms} Bathroom",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.83,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //House Details
                SizedBox(height: 20),
                Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                SeeMoreWidget(
                  widget.house.description,
                  trimLength: 80,
                  textStyle: TextStyle(
                    fontSize: 12.83,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  seeMoreStyle: TextStyle(
                      fontSize: 12.83,
                      fontWeight: FontWeight.w600,
                      color: AppColors.backgroundColor),
                  seeLessStyle: TextStyle(
                      fontSize: 12.83,
                      fontWeight: FontWeight.w600,
                      color: AppColors.backgroundColor),
                ),
                SizedBox(height: 20),
                //Owner Details
                //Circle Avatar
                Row(
                  children: [
                    CircleAvatar(
                      radius: 21,
                      backgroundImage: NetworkImage(widget.house.ownerAvatar),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.house.ownerName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Owner',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.83,
                          ),
                        ),
                      ],
                    ),
                    //call and message buttons with 26px height and width
                    Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        gradient: AppColors.blueOceanLinearGradient,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 17),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        gradient: AppColors.blueOceanLinearGradient,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    //Gallery
                  ],
                ),
                SizedBox(height: 20),
                //Gallery
                Text(
                  'Gallery',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.house.galleryImages.length > 3)
                        ? 3
                        : widget.house.galleryImages.length,
                    itemBuilder: (context, index) {
                      if (index == 2 && widget.house.galleryImages.length > 3) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        widget.house.galleryImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withValues(alpha: .24),
                                ),
                                child: Center(
                                  child: Text(
                                    '+${widget.house.galleryImages.length - 3}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.house.galleryImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //Location
                SizedBox(height: 20),
                //show map on a container
                Stack(
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            22), // Apply the same radius as the container
                        child: MapsViewScreen(
                          placeName: "Gronausestraat 710, Enschede",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      right: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.83,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 4.0,
                                      color: Colors.grey.withValues(
                                        red: 0,
                                        green: 0,
                                        blue: 0,
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Rp.${widget.house.price}/ Year',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 4.0,
                                      color: Colors.grey.withValues(
                                        red: 0,
                                        green: 0,
                                        blue: 0,
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 46,
                            width: 131,
                            decoration: BoxDecoration(
                              gradient: AppColors.blueOceanLinearGradient,
                              borderRadius: BorderRadius.circular(10.6),
                            ),
                            child: Center(
                              child: Text(
                                'Rent Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
