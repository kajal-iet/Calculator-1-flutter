import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String op;
  late num d,m,k, f, se;
  late String r, t = "";
  void btnClicked(String btnTxt) {
    if (btnTxt == "C") {
      print("case 1");
      //  reset all values
      r = "";
      t = "";
      f = 0;
      se = 0;
      d=0;
      m=0;
      k=0;

    }
    else if (btnTxt == "'" ){
       m=double.parse(t);
      r="";
      op=btnTxt;
    }
    else if (btnTxt == "''"){
      k=double.parse(t);
      r="";
      op=btnTxt;
    }



    else if (btnTxt == "+" ||
        btnTxt == "-" ||
        btnTxt == "x" ||
        btnTxt == "/" ||
        btnTxt == "°" ||
        btnTxt == "pow") {
      print("case 2");
      //  Save value first
      f = double.parse(t);
      r = "";
      op = btnTxt;

    } else if (btnTxt == "sin" ||
        btnTxt == "cos" ||
        btnTxt == "tan" ||
        btnTxt == "ln" ||
        btnTxt == "√" ||
        btnTxt == "1/x" ||
        btnTxt == "asin" ||
        btnTxt == "acos" ||
        btnTxt == "atan" ||
        btnTxt == "atan" ||
        btnTxt == "to_DMS" ||
        btnTxt == "x!") {
      r = "";
      op = btnTxt;
    }

  else if (btnTxt == "=") {
      print("case 3");
      // calculate first and second value
     if(op=="''"){
      r=(f+(m/60)+(k/3600)).toString();
    }
     else {
       se = double.parse(t);
    if (op == "+") {
      r = (f + se).toString();
    } else if (op == "-") {
      r = (f - se).toString();
    } else if (op == "x") {
      r = (f * se).toString();
    } else if (op == "/") {
      num l = f / se;
      r = l.toString();
    }
    else if (op == "sin") {
      double l = sin(se * 0.0174532925);
      r = l.toString();
    } else if (op == "cos") {
      double l = cos(se * 0.0174532925);
      r = l.toString();
    } else if (op == "tan") {
      double l = tan(se * 0.0174532925);
      r = l.toString();
    } else if (op == "ln") {
      r = log(se).toString();
    } else if (op == "pow") {
      r = pow(f, se).toString();
    } else if (op == "√") {
      double l = sqrt(se);
      r = l.toString();
    } else if (op == "1/x") {
      num l = 1 / se;
      r = l.toString();
    }
    else if (op == "to_DMS") {
      num q=se;
      int w=se.toInt();
      num a=(q-w)*60;
      int z=a.toInt();
      num x=((a-z)*60).toInt();
      r=w.toString() + "°" + z.toString() + "'" + x.toString() + "''";
    }
    else if (op == "asin") {
      double l = asin(se) * 57.2957796;
      r = l.toString();
    } else if (op == "acos") {
      double l = acos(se) * 57.2957796;
      r = l.toString();
    } else if (op == "atan") {
      double l = atan(se) * 57.2957796;
      r = l.toString();
    } else if (op == "x!") {
      num l = 1;
      while (se != 0) {
        l = l * se;
        se--;
      }
      r = l.toString();
    }
    else if (btnTxt == ".") {
      r = (t + btnTxt);
    }
  }
    } else {
      print("case 4");
      //  when number is pressed(press 9 and 8=> result 98)
      r = (t + btnTxt);
    }
    setState(() {
      t = r;
    });
  }

  Widget customOutlineButton(String s) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black12,
        ),
        onPressed: () => btnClicked(s),
        // padding: EdgeInsets.all(25),
        child: Text(
          s,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Calculator',
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600),)),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: Colors.grey,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    t,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                )),
            Row(
              children: [
                customOutlineButton("°"),
                customOutlineButton("'"),
                customOutlineButton("''"),
                customOutlineButton("to_DMS"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("asin"),
                customOutlineButton("acos"),
                customOutlineButton("atan"),
                customOutlineButton("x!"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("pow"),
                customOutlineButton("√"),
                customOutlineButton("1/x"),
                customOutlineButton("."),
              ],
            ),
            Row(
              children: [
                customOutlineButton("sin"),
                customOutlineButton("cos"),
                customOutlineButton("tan"),
                customOutlineButton("ln"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("9"),
                customOutlineButton("8"),
                customOutlineButton("7"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("6"),
                customOutlineButton("5"),
                customOutlineButton("4"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("3"),
                customOutlineButton("2"),
                customOutlineButton("1"),
                customOutlineButton("x"),
              ],
            ),
            Row(
              children: [
                customOutlineButton("C"),
                customOutlineButton("0"),
                customOutlineButton("="),
                customOutlineButton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}