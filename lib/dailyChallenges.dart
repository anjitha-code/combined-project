import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'challenges.dart';
import 'nav_bar.dart';

class DailyChallenge extends StatefulWidget {
  const DailyChallenge({Key? key});

  @override
  State<DailyChallenge> createState() => _DailyChallengeState();
}

class _DailyChallengeState extends State<DailyChallenge> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Daily",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 33, 113, 1.0),
                          Color.fromRGBO(101, 40, 247, 1.0),
                        ],
                      ).createShader(bounds);
                    },
                    child: const Text(
                      " Challenges",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 350,
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 45,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Montserrat",
                  ),
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: Colors.white),
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2023, DateTime.monday),
                lastDay: DateTime.utc(2030),
                weekendDays: const [DateTime.saturday, DateTime.sunday],
                onDaySelected: _onDaySelected,
                calendarStyle: const CalendarStyle(
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle:
                      TextStyle(color: Color.fromRGBO(101, 40, 247, 1.0)),
                  outsideTextStyle: TextStyle(color: Colors.grey),
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 33, 113, 1.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VocabularyCarousel()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(160, 50),
                  backgroundColor: const Color.fromARGB(70, 109, 109, 109),
                  elevation: 10,
                  shadowColor: const Color.fromARGB(255, 0, 0, 0),
                  side: const BorderSide(
                      color: Color.fromARGB(33, 255, 255, 255), width: 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                child: const Text(
                  'Do Challenge',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: CommonNavigation(
        initialIndex: 0, // Set the initial index as needed
        onItemSelected: (index) {
          // Handle navigation when an item is selected
          // For example, you can use Navigator or any other navigation logic
        },
        onNavigateToDailyChallenges: () {
          // Handle navigation to DailyChallenge page
          Navigator.pushNamed(context, '/event');
          
        },
      ),
    );
  }
}
