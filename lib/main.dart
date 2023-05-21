import 'package:flutter/material.dart';
import 'package:galaxy_planet/pagenew.dart';
import 'detailpage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const homepage(),
        'second': (context) => const newpage(),
      },
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    super.initState();
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Galaxy Planet"),
      ),
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/21.png'),
              opacity: 0.8,
              fit: BoxFit.cover),
        ),
        child: ListView.builder(
            itemCount: Variable.planets.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, top: 150),
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          Positioned(
                            top : 280,
                            child: Container(
                              width: w / 1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white38,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                child: RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(_controller),
                                  child: Image.asset(
                                      Variable.planets[index]['img']),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                Variable.planets[index]['name'],
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'second',
                                      arguments: index);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Text('know more',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
