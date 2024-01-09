import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextFormField extends StatelessWidget {
  final String hintText;
  final double radius;
  final String? labelText;
  final bool enabled;
  final void Function(String)? onChanged;

  const BuildTextFormField(
      {super.key,
      required this.hintText,
      required this.radius,
      this.labelText,
      required this.enabled,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      onChanged: onChanged,
      enabled: enabled,
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          hintText: hintText,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius))),
    );
  }
}

class BuildPasswordTextFormField extends StatefulWidget {
  final String hintText;
  final double radius;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const BuildPasswordTextFormField(
      {super.key,
      required this.hintText,
      required this.radius,
      this.labelText,
      this.validator,
      this.controller});

  @override
  State<BuildPasswordTextFormField> createState() =>
      _BuildPasswordTextFormFieldState();
}

class _BuildPasswordTextFormFieldState
    extends State<BuildPasswordTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscure,
      validator: widget.validator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: isObscure
                  ? const Icon(Icons.visibility_off_rounded)
                  : const Icon(Icons.visibility_rounded)),
          hintText: widget.hintText,
          labelText: 'Password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius))),
    );
  }
}

class BuildEmailTextFormField extends StatefulWidget {
  final String hintText;
  final double radius;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const BuildEmailTextFormField(
      {super.key,
      required this.hintText,
      required this.radius,
      this.labelText,
      this.validator,
      this.controller});

  @override
  State<BuildEmailTextFormField> createState() =>
      _BuildEmailTextFormFieldState();
}

class _BuildEmailTextFormFieldState extends State<BuildEmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText ?? '',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius))),
    );
  }
}
