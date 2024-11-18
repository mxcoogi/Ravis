import 'package:flutter/material.dart';

class DropDown2 extends StatefulWidget {
  const DropDown2({super.key});

  @override
  State<DropDown2> createState() => _DropDown2State();
}

class _DropDown2State extends State<DropDown2> {
  final _coupons = ['미국', '일본', '중국' , '태국'];
  String? _selectedCity;

  bool _isDropDown2Open = false;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _selectedCity = _coupons[0]; // 초기 값 설정
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isDropDown2Open) {
          _overlayEntry?.remove();
        } else {
          _overlayEntry = _createOverlayEntry(context);
          Overlay.of(context).insert(_overlayEntry!);
        }
        setState(() {
          _isDropDown2Open = !_isDropDown2Open;
        });
      },
      child: Expanded(child: Container(
        padding: EdgeInsets.all(5),
        width: 295,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9), // 클릭되지 않았을 때 배경색
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFEDEDED),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 20,),
            Expanded(
              child: Text(
                _selectedCity!,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF444444),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ],
        ),
      ),
    ));
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + renderBox.size.height,
        left: offset.dx,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(5),
            width: 370,
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFDDDDDD),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: _coupons.map((city) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCity = city;
                      _isDropDown2Open = false;
                    });
                    _overlayEntry?.remove();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Text(
                      city,
                      style: TextStyle(
                  color: Color(0xFF444444),
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}