// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:math';

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question(
      {required this.text, required this.options, required this.correctIndex});
}

class B737TypeRatingExam extends StatefulWidget {
  final double? width;
  final double? height;

  const B737TypeRatingExam({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _B737TypeRatingExamState createState() => _B737TypeRatingExamState();
}

class _B737TypeRatingExamState extends State<B737TypeRatingExam> {
  List<Question> _questions = [];
  List<Question> _shuffledQuestions = [];
  int _currentIndex = 0;
  int? _selectedOptionIndex;
  bool _isAnsweredCorrectly = false;
  int _correctAnswersCount = 0;
  int _wrongAttemptsCount = 0;

  bool _examStarted = false;
  bool _examFinished = false;
  bool _isTimerEnabled = false;

  Timer? _timer;
  int _remainingSeconds = 5400; // 90 Minutes default for 100 questions

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    _questions = [
      Question(
          text: "The Maximum Engine Start EGT limit for B737 NG is",
          options: ["725C", "925C", "950C", "975C"],
          correctIndex: 0),
      Question(
          text:
              "The water pressure for the lavatories is normally provided by the",
          options: [
            "pneumatic system",
            "hydraulic system",
            "electrical system"
          ],
          correctIndex: 0),
      Question(
          text: "The Maximum Continuous EGT limit for B737 NG is",
          options: ["725C", "925C", "950C", "975C"],
          correctIndex: 1),
      Question(
          text: "The fuel for APU is normally supplied by the",
          options: ["left tank", "center tank", "right tank"],
          correctIndex: 0),
      Question(
          text:
              "The cargo compartment doors are plug type, hinged at the open and",
          options: [
            "top inward",
            "bottom; inward",
            "top outward",
            "side: inward"
          ],
          correctIndex: 0),
      Question(
          text: "APU fuel consumption is about",
          options: ["30KG/H", "50KG/H", "100KG/H", "300KG/H"],
          correctIndex: 2),
      Question(
          text:
              "The maximum nose wheel steering angle is controlled by the tiller. when",
          options: ["78 degrees", "70 degrees", "45 degrees", "72 degrees"],
          correctIndex: 0),
      Question(
          text:
              "With an inoperative engine driven generator, the aircraft can dispatch with the APU as the second source of electrical power.",
          options: ["True", "False"],
          correctIndex: 0),
      Question(
          text:
              "If PM is the Captain sitting on the left and PF is first officer sitting on the right, who makes the GO/NO GO decision during takeoff?",
          options: ["Captain", "First officer", "PF", "PM"],
          correctIndex: 0),
      Question(
          text: "Rudder pedal steering provides a maximum steering angle of",
          options: ["7 degrees", "10 degrees", "5 degrees", "12 degrees"],
          correctIndex: 0),
      Question(
          text:
              "The Flight Spoilers augment the Aileron operation when the control wheel is rotated more than degrees.",
          options: ["ten", "fifteen", "five", "eight"],
          correctIndex: 0),
      Question(
          text:
              "The aircraft is equipped with an Air Data Inertial Reference Unit (ADIRU) and is therefore limited to operate from degrees North Latitude to degrees South Latitude.",
          options: ["82,82", "82:70", "70:70", "80:80"],
          correctIndex: 0),
      Question(
          text: "On the ground, the packs can receive compressed air from",
          options: [
            "all of these",
            "a ground source",
            "the APU",
            "the engines"
          ],
          correctIndex: 0),
      Question(
          text:
              "The PANEL knob on the F/O s panel can adjust the integral lights in the First Officer s instruments and the AFDS mode control panel edge lighting.",
          options: ["False", "True"],
          correctIndex: 1),
      Question(
          text:
              "A flight deck switch and a switch on the Attendant station control the Emergency Light system.",
          options: ["aft", "forward"],
          correctIndex: 1),
      Question(
          text:
              "PM is the Captain sitting on the left and PF is first officer sitting on the right. If a rejected takeoff before V1 is necessary, who makes the decision and takes actions?",
          options: ["Captain", "First officer", "PF", "PM"],
          correctIndex: 0),
      Question(
          text: "The Map lights are adjusted by the knob on the",
          options: ["sidewall panels", "overhead panel", "pedestal"],
          correctIndex: 0),
      Question(
          text: "The fully charged batteries should last for about minutes.",
          options: ["20", "30", "45"],
          correctIndex: 1),
      Question(
          text:
              "With Switch in AUTO position, the taxi light will automatically turn off when the gear are retracted for safety purposes.",
          options: ["False", "True"],
          correctIndex: 0),
      Question(
          text:
              "IF BAT SWITCH is in OFF and STANDBY POWER SWITCH is in BAT, is battery bus powered?",
          options: ["Yes", "No"],
          correctIndex: 0),
      Question(
          text:
              "When the FASTEN SEAT BELTS switch is selected to AUTO, the FASTEN SEAT BELT and RETURN TO YOUR SEAT signs illuminate with",
          options: [
            "gear extension",
            "gear or flap extension",
            "flap extension"
          ],
          correctIndex: 1),
      Question(
          text:
              "What is approximately the wingspan of a Boeing 737-800 (without winglets)?",
          options: ["28.9 m.", "34.4 m.", "36.2 m.", "29.8 m."],
          correctIndex: 1),
      Question(
          text:
              "With the FASTEN BELT switch in AUTO, when will the FASTEN BELT signs illuminate?",
          options: [
            "Only when gear is DOWN",
            "When gear is DOWN or FLAPS NOT UP",
            "Only when flaps NOT UP"
          ],
          correctIndex: 1),
      Question(
          text:
              "Which statement concerning circuit breaker panels P6 and P18 is true?",
          options: [
            "P6 behind Capt, P18 behind F/O",
            "P6 behind F/O, P18 behind Capt",
            "P6 and P18 on aft overhead"
          ],
          correctIndex: 1),
      Question(
          text: "A fire axe is located in:",
          options: ["The forward galley", "The flight deck", "The aft galley"],
          correctIndex: 1),
      Question(
          text:
              "What is the minimum pavement width for a 180 turn for B737-800?",
          options: ["20 m", "24 m", "30 m", "33 m"],
          correctIndex: 1),
      Question(
          text: "What is the location of the logo lights?",
          options: [
            "In the wing tips",
            "On top of each horizontal stabilizer",
            "In the inner flap track fairings"
          ],
          correctIndex: 1),
      Question(
          text: "Select the correct statement regarding the taxi light.",
          options: [
            "Extinguishes automatically",
            "Recommended not for T/O and Landing",
            "Shines forward fixed position"
          ],
          correctIndex: 1),
      Question(
          text: "The aircraft water system is supplied by:",
          options: [
            "Separate tanks",
            "Single tank behind aft cargo",
            "Two water tanks side by side"
          ],
          correctIndex: 1),
      Question(
          text:
              "Each passenger oxygen generator activation produces oxygen for approximately:",
          options: ["7 mins", "12 mins", "17 mins", "20 mins"],
          correctIndex: 1),
      Question(
          text:
              "The system pressure of the flight crew oxygen system may be as high as:",
          options: ["1500 PSI", "1850 PSI", "2000 PSI"],
          correctIndex: 1),
      Question(
          text: "What is the maximum flight altitude?",
          options: ["35.000 ft", "41.000 ft", "37.000 ft"],
          correctIndex: 1),
      Question(
          text:
              "What is the speed limit to extend the retractable landing lights?",
          options: ["280 kt", "No limitations", "270 kt", "250 kt"],
          correctIndex: 2),
      Question(
          text: "What is the location of the runway turnoff lights?",
          options: [
            "Airplane fuselage",
            "In the wing-root",
            "On the nose gear"
          ],
          correctIndex: 1),
      Question(
          text: "When do the emergency overwing exits lock?",
          options: [
            "Either engine running",
            "Airplane in air or thrust advanced with engine running",
            "Thrust levers advanced"
          ],
          correctIndex: 1),
      Question(
          text:
              "The passenger oxygen system is activated automatically when cabin reaches:",
          options: ["10,000 Ft", "14,000 Ft", "12,000 Ft"],
          correctIndex: 1),
      Question(
          text: "What sources of air may be used to supply the pack?",
          options: ["Engine", "APU", "Ground source", "All of these"],
          correctIndex: 3),
      Question(
          text: "How many equipment cooling fans are installed?",
          options: ["Two", "Four", "Six"],
          correctIndex: 1),
      Question(
          text: "Which pack normally delivers conditioned air to the cabin?",
          options: ["Right", "Left", "Both"],
          correctIndex: 0),
      Question(
          text: "The maximum operating FL altitude of the APU?",
          options: ["FL350", "FL410", "FL250"],
          correctIndex: 1),
      Question(
          text: "Minimum oil pressure for B737NG is PSI",
          options: ["4", "10", "13", "19"],
          correctIndex: 2),
      Question(
          text: "Successful APU starts are not assured above FL",
          options: ["250", "280", "170"],
          correctIndex: 0),
      Question(
          text: "Maximum N1 limit for B737 NG is",
          options: ["99%", "100%", "104%", "105%"],
          correctIndex: 2),
      Question(
          text: "Maximum N2 limit for B737 NG is",
          options: ["99%", "100%", "104%", "105%"],
          correctIndex: 3),
      // ... more questions can be added here following the same pattern
    ];
  }

  void _startExam(bool withTimer) {
    setState(() {
      _shuffledQuestions = List.from(_questions);
      _shuffledQuestions.shuffle(Random());
      _isTimerEnabled = withTimer;
      _examStarted = true;
      _currentIndex = 0;
      _correctAnswersCount = 0;
      _wrongAttemptsCount = 0;
      _isAnsweredCorrectly = false;
      _selectedOptionIndex = null;
      if (_isTimerEnabled) {
        _startTimer();
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _finishExam();
      }
    });
  }

  void _finishExam() {
    _timer?.cancel();
    setState(() {
      _examFinished = true;
    });
  }

  void _handleOptionTap(int index) {
    if (_isAnsweredCorrectly) return; // Prevent changing after correct answer

    setState(() {
      _selectedOptionIndex = index;
      if (index == _shuffledQuestions[_currentIndex].correctIndex) {
        _isAnsweredCorrectly = true;
        _correctAnswersCount++;
      } else {
        _wrongAttemptsCount++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _shuffledQuestions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOptionIndex = null;
        _isAnsweredCorrectly = false;
      });
    } else {
      _finishExam();
    }
  }

  void _prevQuestion() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _selectedOptionIndex = _shuffledQuestions[_currentIndex].correctIndex;
        _isAnsweredCorrectly = true; // Since we already solved it
      });
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF0F172A), // Premium Dark Slate
      ),
      child: !_examStarted
          ? _buildWelcomeScreen()
          : _examFinished
              ? _buildResultScreen()
              : _buildQuestionScreen(),
    );
  }

  Widget _buildWelcomeScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.flight_takeoff, size: 80, color: Color(0xFF38BDF8)),
        SizedBox(height: 20),
        Text(
          "B737 NG TYPE RATING",
          style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
        Text(
          "EXAM SIMULATOR",
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
        ),
        SizedBox(height: 50),
        _buildMenuButton(
            "PRACTICE MODE", "Unlimited time, review questions", false),
        SizedBox(height: 15),
        _buildMenuButton(
            "TIMED EXAM", "90 Minutes - Realistic simulation", true),
      ],
    );
  }

  Widget _buildMenuButton(String title, String subtitle, bool timer) {
    return InkWell(
      onTap: () => _startExam(timer),
      child: Container(
        width: 320,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
          color: Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFF334155), width: 1),
        ),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(subtitle,
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionScreen() {
    final question = _shuffledQuestions[_currentIndex];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Question ${_currentIndex + 1}/${_shuffledQuestions.length}",
                        style: TextStyle(
                            color: Color(0xFF38BDF8),
                            fontWeight: FontWeight.bold)),
                    Container(
                      width: 150,
                      height: 4,
                      margin: EdgeInsets.only(top: 5),
                      child: LinearProgressIndicator(
                        value: (_currentIndex + 1) / _shuffledQuestions.length,
                        backgroundColor: Color(0xFF1E293B),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF38BDF8)),
                      ),
                    ),
                  ],
                ),
                if (_isTimerEnabled)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _remainingSeconds < 300
                          ? Colors.red.withOpacity(0.2)
                          : Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.timer,
                            color: _remainingSeconds < 300
                                ? Colors.red
                                : Colors.white,
                            size: 18),
                        SizedBox(width: 5),
                        Text(_formatTime(_remainingSeconds),
                            style: TextStyle(
                                color: _remainingSeconds < 300
                                    ? Colors.red
                                    : Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
              ],
            ),

            SizedBox(height: 40),

            // Question Text
            Text(
              question.text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.4),
            ),

            SizedBox(height: 30),

            // Options
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedOptionIndex == index;
                  bool isCorrect = index == question.correctIndex;

                  Color bgColor = Color(0xFF1E293B);
                  Color borderColor = Color(0xFF334155);

                  if (isSelected) {
                    if (isCorrect) {
                      bgColor = Color(0xFF059669).withOpacity(0.2);
                      borderColor = Color(0xFF10B981);
                    } else {
                      bgColor = Color(0xFFDC2626).withOpacity(0.2);
                      borderColor = Color(0xFFEF4444);
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () => _handleOptionTap(index),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? borderColor
                                    : Color(0xFF0F172A),
                                border: Border.all(color: borderColor),
                              ),
                              child: Center(
                                child: Text(String.fromCharCode(65 + index),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(question.options[index],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            if (isSelected && isCorrect)
                              Icon(Icons.check_circle,
                                  color: Color(0xFF10B981)),
                            if (isSelected && !isCorrect)
                              Icon(Icons.cancel, color: Color(0xFFEF4444)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentIndex > 0)
                  TextButton.icon(
                    onPressed: _prevQuestion,
                    icon: Icon(Icons.arrow_back, color: Colors.white54),
                    label:
                        Text("BACK", style: TextStyle(color: Colors.white54)),
                  )
                else
                  SizedBox(width: 100),
                ElevatedButton(
                  onPressed: _isAnsweredCorrectly ? _nextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF38BDF8),
                    disabledBackgroundColor: Color(0xFF1E293B),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    _currentIndex == _shuffledQuestions.length - 1
                        ? "FINISH"
                        : "NEXT",
                    style: TextStyle(
                        color: _isAnsweredCorrectly
                            ? Colors.white
                            : Color(0xFF64748B),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    double percentage =
        (_correctAnswersCount / _shuffledQuestions.length) * 100;
    bool passed = percentage >= 75; // Passing score for pilots

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("EXAM COMPLETED",
                style: TextStyle(
                    color: Color(0xFF94A3B8), fontSize: 14, letterSpacing: 2)),
            SizedBox(height: 30),

            // Circular Result
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: percentage / 100,
                    strokeWidth: 15,
                    backgroundColor: Color(0xFF1E293B),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        passed ? Color(0xFF10B981) : Color(0xFFEF4444)),
                  ),
                ),
                Column(
                  children: [
                    Text("${percentage.toInt()}%",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold)),
                    Text(passed ? "PASSED" : "FAILED",
                        style: TextStyle(
                            color:
                                passed ? Color(0xFF10B981) : Color(0xFFEF4444),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 50),

            // Stats Grid
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem("Correct", _correctAnswersCount.toString(),
                    Color(0xFF10B981)),
                _buildStatItem("Wrong Attempts", _wrongAttemptsCount.toString(),
                    Color(0xFFEF4444)),
              ],
            ),

            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _examStarted = false;
                  _examFinished = false;
                  _remainingSeconds = 5400;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1E293B),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Color(0xFF334155)),
                ),
              ),
              child: Text("RETAKE EXAM",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
        Container(
            height: 3,
            width: 30,
            margin: EdgeInsets.only(top: 5),
            color: color),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
