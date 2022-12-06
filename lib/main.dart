import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const My_Clock(),
      },
    ),
  );
}

class My_Clock extends StatefulWidget {
  const My_Clock({Key? key}) : super(key: key);

  @override
  State<My_Clock> createState() => _My_ClockState();
}

class _My_ClockState extends State<My_Clock> {
  final CustomTimerController _controller = CustomTimerController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: h,
            width: w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox.expand(
                  child: Image(
                    image: AssetImage("images/colck.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
                const Align(
                  alignment: Alignment(0, -0.85),
                  child: Text(
                    "MY COLCK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Center(
                        child: CustomTimer(
                            controller: _controller,
                            begin: Duration(),
                            end: Duration(days: 1),
                            builder: (remaining) {
                              return Text(
                                "${remaining.hours}:${remaining.minutes}:${remaining.seconds}.${remaining.milliseconds}",
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            onPressed: () => _controller.start(),
                            child: const Text(
                              "Start",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            onPressed: () => _controller.pause(),
                            child: Text(
                              "Pause",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            onPressed: () => _controller.reset(),
                            child: const Text(
                              "Reset",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
