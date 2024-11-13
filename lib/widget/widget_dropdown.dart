import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final _coupons = ['첫 기념 할인쿠폰', '그냥 할인쿠폰', '그냥있는 쿠폰'];
  String? _selectedCity;

  bool _isDropdownOpen = false;
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
        if (_isDropdownOpen) {
          _overlayEntry?.remove();
        } else {
          _overlayEntry = _createOverlayEntry(context);
          Overlay.of(context).insert(_overlayEntry!);
        }
        setState(() {
          _isDropdownOpen = !_isDropdownOpen;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: 370,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9), // 클릭되지 않았을 때 배경색
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFDDDDDD),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 20,),
            Expanded(
              child: Text(
                _selectedCity!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
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
    );
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
                      _isDropdownOpen = false;
                    });
                    _overlayEntry?.remove();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Text(
                      city,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
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