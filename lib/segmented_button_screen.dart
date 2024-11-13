import 'package:flutter/material.dart';

class MySegmentedButtonScreen extends StatefulWidget {
  const MySegmentedButtonScreen({super.key});

  @override
  State<MySegmentedButtonScreen> createState() =>
      _MySegmentedButtonScreenState();
}

class _MySegmentedButtonScreenState extends State<MySegmentedButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segmented Button Screen'),
      ),
      body: const Column(
        children: [
          Spacer(),
          Text('Single choice'),
          SingleChoice(),
          SizedBox(height: 20),
          Text('Multiple choice'),
          MultipleChoice(),
          Spacer(),
        ],
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      selected: {calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        print(newSelection);
        setState(() {
          calendarView = newSelection.first;
        });
      },
      segments: const [
        ButtonSegment(
          value: Calendar.day,
          label: Text('Day'),
          icon: Icon(Icons.calendar_view_day),
        ),
        ButtonSegment(
          value: Calendar.week,
          label: Text('Week'),
          icon: Icon(Icons.calendar_view_week),
        ),
        ButtonSegment(
          value: Calendar.month,
          label: Text('Month'),
          icon: Icon(Icons.calendar_view_month),
        ),
        ButtonSegment(
          value: Calendar.year,
          label: Text('Year'),
          icon: Icon(Icons.calendar_today),
        ),
      ],
    );
  }
}

enum SizesEnum { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set selectionObject = {
    SizesEnum.large,
    SizesEnum.extraLarge,
    SizesEnum.small
  };

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: const [
        ButtonSegment(
          value: SizesEnum.extraSmall,
          label: Text('XS'),
        ),
        ButtonSegment(
          value: SizesEnum.small,
          label: Text('S'),
        ),
        ButtonSegment(
          value: SizesEnum.medium,
          label: Text('M'),
        ),
        ButtonSegment(
          value: SizesEnum.large,
          label: Text('L'),
        ),
        ButtonSegment(
          value: SizesEnum.extraLarge,
          label: Text('XL'),
        ),
      ],
      selected: selectionObject,
      multiSelectionEnabled: true,
      onSelectionChanged: (Set newSelection) {
        setState(() {
          selectionObject = newSelection;
        });
        print(selectionObject);
      },
    );
  }
}
