import 'package:amadeo/pages/export.dart';
import 'package:amadeo/widgets/paragraph_widget.dart';
import 'package:amadeo/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class SubSectionWidget extends StatelessWidget {
  final SectionPageWidget sectionPage;
  final String title;
  final String subtitle;
  final EdgeInsetsGeometry externalPadding;

  const SubSectionWidget({
    @required this.sectionPage,
    @required this.title,
    this.subtitle,
    this.externalPadding = const EdgeInsets.symmetric(vertical: 7.0),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(sectionPage.routeName),
      child: Padding(
        padding: externalPadding,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(0.0, 1.0),
                blurRadius: 1.0,
              ),
            ],
            borderRadius: BorderRadius.circular(13.0),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: const [0.18, 0.93],
              colors: const [
                Color(0xFF38BA8C),
                Color(0xFF22c4b9),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
