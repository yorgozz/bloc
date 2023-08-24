import 'package:display_name/blocs/authenticationBloc/authentication_bloc.dart';
import 'package:display_name/blocs/homeBloc/home_bloc_state.dart';
import 'package:display_name/blocs/modalbloc/modal_bloc.dart';
import 'package:display_name/blocs/modalbloc/modal_event.dart';
import 'package:display_name/blocs/modalbloc/modal_state.dart';
import 'package:display_name/data/models/propertyModel.dart';
import 'package:display_name/data/models/spaceModel.dart';
import 'package:display_name/shared_widgets/BurgerDrawer.dart';
import 'package:display_name/shared_widgets/CarouselWidget.dart';
import 'package:display_name/shared_widgets/ChilCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../blocs/homeBloc/home_bloc.dart';
import '../blocs/homeBloc/home_bloc_event.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchprops();
    fetchuser();
  }

  void fetchprops() async {
    context.read<HomeBloc>().add(FetchPropertiesEvent());
  }

  void fetchuser() async {
    context.read<AuthenticationBlocBloc>().add(GetCurrentUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: Burger(),
          appBar: AppBar(
            backgroundColor: Color(0xFF3C4955),
            toolbarHeight: 160,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            title: Column(
              children: [
                SizedBox(height: 5),
                Row(children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: SvgPicture.asset(
                      'assets/Group 13892.svg',
                      color: Colors.white,
                      width: 20,
                    ),
                  ),
                  Container(
                    width: 310,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(178, 187, 202, 1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<PropertyModel>(
                      value: state.selectedProperty,
                      items: state.properties.map((property) {
                        return DropdownMenuItem<PropertyModel>(
                          value: property,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0, 24.0, 0),
                            child: Text(
                              property.propertyName,
                              style: TextStyle(
                                color: Color.fromRGBO(50, 62, 72, 1),
                                fontSize: 14.0,
                                fontFamily: 'MontserratRegular',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      icon: SvgPicture.asset(
                        'assets/Icon-16x-dropdown.svg',
                        color: Color.fromARGB(217, 13, 6, 18),
                        width: 20,
                      ),
                      onChanged: (value) {
                        context
                            .read<HomeBloc>()
                            .add(SelectPropertyEvent(value!));
                      },
                      hint: Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 160.0, 0),
                        child: Text(
                          'Select property',
                          style: TextStyle(
                            color: Color.fromRGBO(178, 187, 202, 1),
                            fontSize: 14.0,
                            fontFamily: 'MontserratRegular',
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5.0, 0),
                      child: Container(
                        width: 168,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(178, 187, 202, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<String>(
                          value: null,
                          items: [],
                          onChanged: (value) {},
                          hint: Row(
                            children: [
                              SizedBox(width: 8),
                              SvgPicture.asset(
                                'assets/Group 13884.svg',
                                color: Color.fromARGB(217, 13, 6, 18),
                                width: 20,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Select Dates',
                                style: TextStyle(
                                  color: Color.fromRGBO(178, 187, 202, 1),
                                  fontSize: 14.0,
                                  fontFamily: 'MontserratRegular',
                                ),
                              ),
                            ],
                          ),
                          icon: Row(
                            children: [
                              SizedBox(width: 16),
                              SvgPicture.asset(
                                'assets/Icon-16x-dropdown (1).svg',
                                color: Color.fromARGB(217, 13, 6, 18),
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 165.5,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromRGBO(178, 187, 202, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: GestureDetector(
                        onTap: _showBottomSheet,
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_add_outlined,
                              color: Color.fromARGB(217, 13, 6, 18),
                              size: 20,
                            ),
                            SizedBox(width: 3),
                            Text(
                              'Guests & Rooms',
                              style: TextStyle(
                                color: Color.fromRGBO(178, 187, 202, 1),
                                fontSize: 14.0,
                                fontFamily: 'MontserratRegular',
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            SvgPicture.asset(
                              'assets/Icon-16x-dropdown (1).svg',
                              color: Color.fromARGB(217, 13, 6, 18),
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Container(
            color: Color(0xFFF9F9F9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '    Available Spaces',
                    style: TextStyle(
                      color: Color.fromRGBO(17, 21, 27, 0.903),
                      fontSize: 16.0,
                      fontFamily: 'MontserratMedium',
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.selectedProperty.availableSpaces.length,
                    separatorBuilder: (context, index) => SizedBox(height: 40),
                    itemBuilder: (context, index) {
                      SpaceModel space =
                          state.selectedProperty.availableSpaces[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CarouselWidget(
                          carouselImages: space.spaceImages,
                          propertyName: state.selectedProperty.propertyName,
                          spaceTitle: space.spaceTitle,
                          spaceDescription: space.spaceDescription,
                          spaceRating: space.spaceRating,
                          spacePrice: space.spacePrice,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocBuilder<ModalBloc, ModalState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Who's coming?",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF323E48)),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<ModalBloc>().add(ClearEvent());
                          },
                          child: Text(
                            "Clear",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Adults",
                          style: TextStyle(
                              fontFamily: 'MontserratMedium',
                              color: Color(0XFF323E48)),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ModalBloc>()
                                    .add(DecrementAdultEvent());
                              },
                              icon: SvgPicture.asset(
                                'assets/vuesax-outline-info-circle (1).svg',
                                color: Color.fromARGB(192, 31, 34, 29),
                                width: 20,
                              ),
                            ),
                            Text(state.adultcount.toString()),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ModalBloc>()
                                    .add(IncrementAdultEvent());
                              },
                              icon: SvgPicture.asset(
                                'assets/vuesax-outline-info-circle.svg',
                                color: Color(0XFF297BE6),
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Children",
                          style: TextStyle(
                              fontFamily: 'MontserratMedium',
                              color: Color.fromARGB(202, 34, 39, 43)),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ModalBloc>()
                                    .add(DecrementChildrenEvent());
                              },
                              icon: SvgPicture.asset(
                                'assets/vuesax-outline-info-circle (1).svg',
                                color: Color.fromARGB(197, 36, 40, 34),
                                width: 20,
                              ),
                            ),
                            Text(state.childrencount.toString()),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ModalBloc>()
                                    .add(IncrementChildrenEvent());
                              },
                              icon: SvgPicture.asset(
                                'assets/vuesax-outline-info-circle.svg',
                                color: Color(0XFF297BE6),
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    state.childrencount > 0
                        ? Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: state.childrencount,
                              itemBuilder: (BuildContext context, int index) {
                                return ChildCard(
                                  ageList: state.childrenage,
                                  selectedAge:
                                      state.childrenSelectedAges[index],
                                  onAgeChanged: (newAge) {
                                    context.read<ModalBloc>().add(
                                        UpdateChildAgeEvent(index, newAge));
                                  },
                                );
                              },
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFFF8AE56),
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
