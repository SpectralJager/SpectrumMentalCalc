part of 'widgets.dart';

class NumPadBtn extends StatelessWidget {
  const NumPadBtn({
    Key? key,
    required this.txt_edit_controller,
    required this.buttons_text_style,
    required this.text,
  }) : super(key: key);

  final TextEditingController txt_edit_controller;
  final TextStyle buttons_text_style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          this.txt_edit_controller.text += text;
        },
        child: Text(
          text,
          style: buttons_text_style,
        ));
  }
}
