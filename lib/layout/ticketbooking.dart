
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TicketBooking extends StatefulWidget {


  const TicketBooking({Key? key}) : super(key: key);

  @override
  _BusseatsState createState() => _BusseatsState();



}


class _BusseatsState extends State<TicketBooking> {


  List<int> searid = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21];

  List<int> testsearid = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21];
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  TextEditingController ScheduleEditingController = TextEditingController();


  FocusNode scheduleFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode timeFocusNode = FocusNode();


  List<String> selectedSeats=List.filled(0,"",growable: true);
  @override
  Widget build(BuildContext context) {

    return


      BlocProvider(
          create: (BuildContext context) => AppCubit()..createDatabase(),
          child: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {


              },
              builder: (context, state) {
                AppCubit cubit = AppCubit.get(context);
                return
                  Scaffold(
                      body:


                      SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                              children: <Widget>[
                                GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(bottom: 5.0, right: 10,left: 10,top: 30),
                                  crossAxisCount: 3,
                                  shrinkWrap: true,
                                  mainAxisSpacing: 30,
                                  childAspectRatio: 1.5,
                                  crossAxisSpacing: 90,
                                  children: List.generate(
                                    searid.length > 6 ? searid.length : searid.length,
                                        (index) {

                                      return InkWell(
                                          onTap: () {



                                            print(searid[index]);


                                            setState(() {



                                              if(!AppCubit.BookedSeats.contains(searid[index].toString())) {
                                                if (selectedSeats.contains(searid[index].toString())) {
                                                  selectedSeats.remove(searid[index].toString());
                                                } else {
                                                  selectedSeats.add(searid[index].toString());
                                                }


                                              }


                                            });




                                          },
                                          child: AppCubit.BookedSeats.contains(searid[index].toString())?
                                          Container(
                                            height: 40.0,
                                            width: 10.0,
                                            decoration: BoxDecoration(
                                                color: Colors.orange, borderRadius: BorderRadius.circular(3.0)),
                                          )
                                              :


                                          selectedSeats.contains(searid[index].toString())?Container(
                                            height: 40.0,
                                            width: 10.0,
                                            decoration: BoxDecoration(
                                                color: Colors.green, borderRadius: BorderRadius.circular(3.0)),
                                          ):Container(
                                            height: 40.0,
                                            width: 10.0,
                                            decoration: BoxDecoration(
                                                color: Colors.blue, borderRadius: BorderRadius.circular(3.0)),
                                          )
                                      );
                                    },
                                  ),
                                ),


                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width * 0.24,
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    padding: const EdgeInsets.only(left: 20.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.deepPurpleAccent,
                                      boxShadow: const [
                                        BoxShadow(color: Colors.deepPurpleAccent, spreadRadius: 3),
                                      ],
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          InkWell(
                                              onTap: ()
                                              {



                                      if(selectedSeats.length>0) {
                                        dateController.text = "";
                                        timeController.text = "";
                                        ScheduleEditingController.text = "";

                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          // user must tap button for close dialog!
                                          builder: (BuildContext context) {
                                            return Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: EdgeInsets.all(15.0),

                                                  child: Container(
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width,
                                                    height: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height * 0.60,
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius
                                                            .circular(15)),
                                                    child:
                                                    Material(

                                                      child: Column(
                                                        mainAxisSize: MainAxisSize
                                                            .min,
                                                        children: [

                                                          _entryField_dateTime(
                                                              dobFocusNode),

                                                          _entryField_Time(
                                                              timeFocusNode),

                                                          _entryField(
                                                              "Remind{hours}before",
                                                              ScheduleEditingController,
                                                              scheduleFocusNode),


                                                          Container(
                                                              width: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .width * 0.35,
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height *
                                                                  0.08,
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                  left: 20.0),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    10),
                                                                color: Colors
                                                                    .deepPurpleAccent,
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      spreadRadius: 3),
                                                                ],
                                                              ),
                                                              child:
                                                              InkWell(
                                                                  onTap: () {
                                                                    if (ScheduleEditingController
                                                                        .text
                                                                        .toString()
                                                                        .trim()
                                                                        .length >
                                                                        0) {
                                                                      for (int i = 0; i <
                                                                          selectedSeats
                                                                              .length; i++) {
                                                                        cubit
                                                                            .inserToDatabase(
                                                                            seatid: selectedSeats[i],
                                                                            time: timeController
                                                                                .text,
                                                                            date: dateController
                                                                                .text);
                                                                      }
                                                                      selectedSeats =
                                                                      [];
                                                                      String messge = "Your bus will leave at {" +
                                                                          timeController
                                                                              .text
                                                                              .toString()
                                                                              .trim() +
                                                                          "} please leave now to make it in time";
                                                                      Notify(
                                                                          dateController
                                                                              .text
                                                                              .toString()
                                                                              .trim(),
                                                                          timeController
                                                                              .text
                                                                              .toString()
                                                                              .trim(),
                                                                          messge);


                                                                      Navigator
                                                                          .pop(
                                                                          context);
                                                                    }
                                                                  },
                                                                  child:
                                                                  Container(
                                                                      child: const Center(
                                                                          child: Text(
                                                                            "CONFORM",
                                                                            style: TextStyle(
                                                                              color: Colors
                                                                                  .white,
                                                                              fontSize: 18.0,
                                                                            ),
                                                                          )
                                                                      )


                                                                  )
                                                              )

                                                          )

                                                        ],
                                                      ),
                                                      //),
                                                    ),
                                                  )
                                              ),
                                            );
                                          },
                                        );
                                      }else
                                        {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            // user must tap button for close dialog!
                                            builder: (BuildContext context) {
                                              return Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                    padding: EdgeInsets.all(15.0),

                                                    child: Container(
                                                      width: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width,
                                                      height: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .height * 0.20,
                                                      padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius
                                                              .circular(15)),
                                                      child:
                                                      Material(

                                                        child: Column(
                                                          mainAxisSize: MainAxisSize
                                                              .min,
                                                          children: [


                                                            _entryField_dialog(),

                                                            Container(
                                                                width: MediaQuery
                                                                    .of(context)
                                                                    .size
                                                                    .width * 0.35,
                                                                height: MediaQuery
                                                                    .of(context)
                                                                    .size
                                                                    .height *
                                                                    0.08,
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    left: 20.0),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      10),
                                                                  color: Colors
                                                                      .deepPurpleAccent,
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .deepPurpleAccent,
                                                                        spreadRadius: 3),
                                                                  ],
                                                                ),
                                                                child:
                                                                InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child:
                                                                    Container(
                                                                        child: const Center(
                                                                            child: Text(
                                                                              "OK",
                                                                              style: TextStyle(
                                                                                color: Colors
                                                                                    .white,
                                                                                fontSize: 18.0,
                                                                              ),
                                                                            )
                                                                        )


                                                                    )
                                                                )

                                                            )

                                                          ],
                                                        ),
                                                        //),
                                                      ),
                                                    )
                                                ),
                                              );
                                            },
                                          );
                                        }

                                                //print("booked");
                                              },
                                              child:
                                              Container(
                                                  child: const Text(
                                                    "BOOK",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                    ),
                                                  ))
                                          )
                                        ]
                                    )
                                )
                              ]
                          )
                      )
                  );
              }
          )
      );



  }



  Widget _entryField_dialog() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[


          Text(
            "Please Select atleast one seat",
            maxLines: 1,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 16),
          ),

        ],
      ),
    );
  }

  Widget _entryField(
      String title, TextEditingController controller, FocusNode focusNode,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              obscureText: isPassword,
              controller: controller,
              focusNode: focusNode,
              textAlign: TextAlign.center,
              maxLength: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: title,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: TextStyle(color: Colors.black)))
        ],
      ),
    );
  }

  Widget _entryField_dateTime(FocusNode focusNode) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            obscureText: false,
            readOnly: true,
            focusNode: focusNode,
            controller: dateController,
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(
                hintText: "DATE",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                fillColor: Colors.white,
                filled: true,
                errorStyle: TextStyle(color: Colors.black, fontSize: 15.0)),
            onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  helpText: '',
                  // initialDatePickerMode: DatePickerMode.year,
                  lastDate: DateTime(2100));
              dateController.text = date.toString().substring(0, 10);
            },
          )
        ],
      ),
    );
  }


  Widget _entryField_Time(FocusNode focusNode) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            obscureText: false,
            readOnly: true,
            focusNode: focusNode,
            controller: timeController,
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(
                hintText: "TIME",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                fillColor: Colors.white,
                filled: true,
                errorStyle: TextStyle(color: Colors.black, fontSize: 15.0)),
            onTap: () async {
              var date = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              String minute="";
              if(date!.minute.toString().trim().length==1) {
                minute="0"+date.minute.toString();
              } else {
                minute = date.minute.toString();
              }
              timeController.text = date!.hour.toString()+":"+minute;
            },
          )
        ],
      ),
    );
  }

  Widget _entryTextField(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.yellow,
                fontSize: MediaQuery.of(context).size.width * 0.046,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }}


void Notify(date,time,message)  async{


  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: DateTime.now().millisecond,
      channelKey: 'key1',
      title: 'Bus Arrival Notification',
      body: message,
    ),
    //schedule: NotificationInterval(interval: 2,timeZone: timezom,repeats: false),


    schedule: NotificationCalendar(
      year: int. parse(date.toString().split("-")[0]),
      month:int. parse(date.toString().split("-")[1]),
      day: int. parse(date.toString().split("-")[2]),
      hour: int. parse(time.toString().split(":")[0])-1,
      minute: int. parse(time.toString().split(":")[1]),
    ),
  );


}