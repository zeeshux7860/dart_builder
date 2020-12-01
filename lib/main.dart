import 'package:firexcode/firexcode.dart';
import 'package:firexcode/xConvert.dart';
import 'package:firexcode/xServices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage().xMaterialApp(
        theme: ThemeData(primaryIconTheme: IconThemeData(color: Colors.black)));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return xListView.list([
      xColumn
          .list([
            "Json to Dart Builder"
                .h1TextBold(color: Colors.black)
                .xap(value: 10),
            Divider(),
            "Project path".xTF(controller: path),
            xRow.list([
              "Paste json here"
                  .xTFD(maxline: 20, controller: jsonCode)
                  .xExpanded(),
              xColumn
                  .list([
                    "FILL FORM".h1TextBold(color: Colors.black),
                    "Model name".xTF(controller: model),
                    "Generate".textMaterialColorWhite().toCenter().xContainer(
                        onTap: () {
                          if (path.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  "please enter your project path !!!".text(),
                            ));
                          } else if (jsonCode.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: "please enter your json code !!!".text(),
                            ));
                          } else if (model.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: "please enter your model !!!".text(),
                            ));
                          } else {
                            dartGenerate(model.text, jsonCode.text)
                                .then((value) {
                             // print(value.code);
                              fileCreate(path.text, value.code,
                                  model.text.toLowerCase() + '_model.dart');
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: "Generate successfull".text(),
                              ));
                            }).catchError((onError) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: "$onError".text(),
                              ));
                            });
                          }
                        },
                        color: Colors.blue,
                        rounded: 5),
                  ])
                  .xContainer(width: 400)
                  .xCard(
                      elevation: 0.7,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white)
                  .xtp(value: 45)
            ])
          ])
          .xContainer()
          .xCard(
            elevation: 1,
            borderRadius: BorderRadius.circular(5),
          )
          .xap(value: 15),
    ]).xScaffold(
        backgroundColor: Colors.white,
        key: scaf,
        drawer: Drawer(),
        appBar: "Dart Builder"
            .textMaterialColorBlack()
            .xAppBar(backgroundColor: Colors.white));
  }

  bool isSuccessfully = false;
  final scaf = GlobalKey<ScaffoldState>();
}

TextEditingController path = TextEditingController();
TextEditingController model = TextEditingController();
TextEditingController jsonCode = TextEditingController();
