import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:list_it/provider/radio_provider.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({
    super.key, required this.titleText, required this.valueText, required this.icon, required this.onTapPicker
  });

  final String titleText;
  final String valueText;
  final IconData icon;
  final VoidCallback onTapPicker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const Gap(5),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {onTapPicker;},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                      Icon(icon),
                      const Gap(12),
                      Text(valueText),
                      ],),
                    ),
                ),
              ),
            ),
            ])
          ,
        );
  }
}