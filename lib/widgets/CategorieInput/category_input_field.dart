import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class CategoryInputField extends StatefulWidget {
  final String category;
  final String letter;
  final ValueChanged<int> onIncrementScore;

  const CategoryInputField({
    super.key,
    required this.category,
    required this.letter,
    required this.onIncrementScore,
  });

  @override
  CategoryInputFieldState createState() => CategoryInputFieldState();
}

class CategoryInputFieldState extends State<CategoryInputField> {
  final TextEditingController _controller = TextEditingController();
  String? _errorMessage;
  bool isSatisfiedIconClicked = false;
  bool isDissatisfiedIconClicked = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_validateInput);
  }

  void _validateInput() {
    final input = _controller.text;
    if (input.isNotEmpty && input[0].toUpperCase() != widget.letter.toUpperCase()) {
      setState(() {
        _errorMessage = 'Le mot doit commencer par la lettre ${widget.letter}.';
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
    }
  }

  void _onSatisfiedIconTap() {
    if (!isSatisfiedIconClicked && !isDissatisfiedIconClicked) {
      setState(() {
        isSatisfiedIconClicked = true;
      });
      widget.onIncrementScore(2);
    }
  }

  void _onDissatisfiedIconTap() {
    if (!isSatisfiedIconClicked && !isDissatisfiedIconClicked) {
      setState(() {
        isDissatisfiedIconClicked = true;
      });
      widget.onIncrementScore(1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: widget.category,
                    hintText: '${widget.letter}...',
                    border: const OutlineInputBorder(),
                    errorText: _errorMessage,
                  ),
                  autocorrect: false,
                  autofillHints: const [],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _onSatisfiedIconTap,
            child: isSatisfiedIconClicked
                ? const Icon(
                    Icons.thumb_up,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.sentiment_satisfied,
                    color: isDissatisfiedIconClicked ? Colors.grey : Colors.green,
                  ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _onDissatisfiedIconTap,
            child: isDissatisfiedIconClicked
                ? const Icon(
                    Icons.thumb_down,
                    color: ColorsConstant.primaryYellow,
                  )
                : Icon(
                    Icons.sentiment_dissatisfied,
                    color: isSatisfiedIconClicked ? Colors.grey : ColorsConstant.primaryYellow,
                  ),
          ),
        ],
      ),
    );
  }
}
