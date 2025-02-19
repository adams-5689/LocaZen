import 'package:flutter/material.dart';

class AmenitiesUi extends StatefulWidget {
  String type;
  int startValue;
  Function decreaseValue;
  Function increaseValue;
  AmenitiesUi(
      {super.key,
      required this.type,
      required this.startValue,
      required this.decreaseValue,
      required this.increaseValue});

  @override
  State<AmenitiesUi> createState() => _AmenitiesUiState();
}

class _AmenitiesUiState extends State<AmenitiesUi> {
  int? _valueDigit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _valueDigit = widget.startValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.type,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                widget.decreaseValue;
                _valueDigit = _valueDigit! - 1;
                if (_valueDigit! < 0) {
                  _valueDigit = 0;
                }
                setState(() {});
              },
            ),
            Text(
              _valueDigit.toString(),
              style: TextStyle(fontSize: 20.0),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                widget.increaseValue;
                _valueDigit = _valueDigit! + 1;

                setState(() {});
              },
            ),
          ],
        )
      ],
    );
  }
}
