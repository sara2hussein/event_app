import 'package:event_app/UI/home/tabs/app_event/event_tap_icon.dart';
import 'package:event_app/UI/home/tabs/floting_button/custom_elevated_button.dart';
import 'package:event_app/UI/home/tabs/floting_button/event_date_or_time.dart';
import 'package:event_app/UI/home/tabs/love/custom_text_feild.dart';
import 'package:event_app/model/event.dart';
import 'package:event_app/provider/event_list_provide.dart';
import 'package:event_app/utels/app_colors.dart';
import 'package:event_app/utels/assets_manager.dart';
import 'package:event_app/utels/app_styles.dart';
import 'package:event_app/utels/firebase_utels.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  static const String routeName = '/add-event';

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;
  DateTime? selectedDate;
  String formatedDate = '';
  String? formatedTime;
  TimeOfDay? selectedTime;
  String selectedImage = '';
  String selectedEventName = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late EventListProvide eventListprovider;
  void initState() {
    super.initState();
    eventListprovider = Provider.of<EventListProvide>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<String> eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    List<String> imageSelectedEvent = [
      AssetsManager.sportEvent,
      AssetsManager.birthdayEvent,
      AssetsManager.meetEvent,
      AssetsManager.gamingEvent,
      AssetsManager.workEvent,
      AssetsManager.bookEvent,
      AssetsManager.exEvent,
      AssetsManager.holidayEvent,
      AssetsManager.ettingEvent,
    ];
    selectedImage = imageSelectedEvent[selectedIndex];
    selectedEventName = eventsNameList[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyles.meduim20Primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(selectedImage),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: EventTapIcon(
                        borderColor: AppColors.primaryLight,
                        selectedBackgroundColor: AppColors.primaryLight,
                        selectedTextStyle: AppStyles.medium16White,
                        unSelectedTextStyle:
                            Theme.of(context).textTheme.headlineSmall,
                        eventName: eventsNameList[index],
                        isSelected: selectedIndex == index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width * 0.02);
                  },
                  itemCount: eventsNameList.length,
                ),
              ),
              SizedBox(height: height * 0.02),

              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: AppStyles.medium16Black,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFeild(
                      hintText: AppLocalizations.of(context)!.event_title,
                      controller: titleController,
                      prefixIcon: Image.asset(AssetsManager.Note_Edit),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.enter_event_title;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      AppLocalizations.of(context)!.describtion,
                      style: AppStyles.medium16Black,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextFeild(
                      hintText: AppLocalizations.of(context)!.event_describtion,
                      controller: descriptionController,
                      maxLines: 4,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.enter_event_description;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    EventDateOrTime(
                      iconDataOrTime: AssetsManager.Calendar_Days,
                      eventDateOrTime: AppLocalizations.of(context)!.event_date,
                      ChooseDateOrTime:
                          selectedDate == null
                              ? AppLocalizations.of(context)!.choose_date
                              : formatedDate,
                      //'${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}'
                      onChooseDateOrTime: chooseDate,
                    ),

                    EventDateOrTime(
                      iconDataOrTime: AssetsManager.Clock,
                      eventDateOrTime: AppLocalizations.of(context)!.event_time,
                      ChooseDateOrTime:
                          selectedTime == null
                              ? AppLocalizations.of(context)!.choose_time
                              : formatedTime!,
                      onChooseDateOrTime: chooseTime,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: AppStyles.medium16Black,
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.primaryLight,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.primaryLight,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(AssetsManager.Iconlocation),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            AppLocalizations.of(context)!.choose_event_location,
                            style: AppStyles.medium16Primary,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColors.primaryLight,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    CustomElevatedButton(
                      onButtonClick: addEvent,
                      text: AppLocalizations.of(context)!.add_event,
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    formatedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
    setState(() {});
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    formatedTime = selectedTime!.format(context);
    setState(() {});
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      if (selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.please_choose_date),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.please_choose_time),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      Event event = Event(
        image: selectedImage,
        title: titleController.text,
        time: formatedTime!,
        dateTime: selectedDate!,
        description: descriptionController.text,
        eventName: selectedEventName,
      );
      FirebaseUtels.addEventToFireStore(event).timeout(
        Duration(milliseconds: 500),
        onTimeout: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text(AppLocalizations.of(context)!.success),
                  content: Text(
                    AppLocalizations.of(context)!.event_added_successfully,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        eventListprovider.getAllEvent();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)!.ok),
                    ),
                  ],
                ),
          );
        },
      );
    }
  }
}
