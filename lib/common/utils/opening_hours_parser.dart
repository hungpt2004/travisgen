/// Utility class to parse binary opening hours string into readable time slots
/// Each bit represents a 30-minute slot starting from 00:00
/// Example: "100000..." means open from 00:00-00:30
class OpeningHoursParser {
  static const int slotDurationMinutes = 30;
  static const int slotsPerDay = 48; // 24 hours * 2 (30-minute slots)

  static const List<String> _weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  /// Parses the binary string and returns a list of opening hours for each day
  static List<DayOpeningHours> parseOpeningHours(String binaryString) {
    if (binaryString.isEmpty) {
      return _getDefaultClosedHours();
    }

    try {
      // Ensure the binary string is valid
      if (!_isValidBinaryString(binaryString)) {
        return _getDefaultClosedHours();
      }

      // Pad the string to ensure it has enough bits for 7 days
      final paddedString = binaryString.padRight(slotsPerDay * 7, '0');

      final openingHours = <DayOpeningHours>[];

      for (var dayIndex = 0; dayIndex < 7; dayIndex++) {
        final dayStartIndex = dayIndex * slotsPerDay;

        openingHours.add(
          DayOpeningHours(
            dayName: _weekDays[dayIndex],
            timeSlots: _parseDaySlots(paddedString.substring(dayStartIndex, dayStartIndex + slotsPerDay)),
          ),
        );
      }

      return openingHours;
    } catch (e) {
      return _getDefaultClosedHours();
    }
  }

  /// Parses binary string for a single day and returns time slots
  static List<TimeSlot> _parseDaySlots(String dayBinary) {
    final slots = <TimeSlot>[];
    var isOpen = false;
    int? startSlot;

    for (var i = 0; i < dayBinary.length; i++) {
      final isCurrentlyOpen = dayBinary[i] == '1';

      if (isCurrentlyOpen && !isOpen) {
        // Starting a new open period
        startSlot = i;
        isOpen = true;
      } else if (!isCurrentlyOpen && isOpen) {
        // Ending an open period
        if (startSlot != null) {
          slots.add(
            TimeSlot(
              startTime: _slotIndexToTime(startSlot),
              endTime: _slotIndexToTime(i),
            ),
          );
        }
        isOpen = false;
        startSlot = null;
      }
    }

    // Handle case where the day ends while still open
    if (isOpen && startSlot != null) {
      slots.add(
        TimeSlot(
          startTime: _slotIndexToTime(startSlot),
          endTime: _slotIndexToTime(dayBinary.length),
        ),
      );
    }

    return slots;
  }

  /// Converts slot index to time string (HH:MM format)
  static String _slotIndexToTime(int slotIndex) {
    final totalMinutes = slotIndex * slotDurationMinutes;
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  /// Validates if the string contains only 0s and 1s
  static bool _isValidBinaryString(String str) {
    return RegExp(r'^[01]*$').hasMatch(str);
  }

  /// Returns default closed hours for all days
  static List<DayOpeningHours> _getDefaultClosedHours() {
    return _weekDays
        .map(
          (day) => DayOpeningHours(
            dayName: day,
            timeSlots: [],
          ),
        )
        .toList();
  }

  /// Formats time slots for display
  static String formatTimeSlots(List<TimeSlot> slots) {
    if (slots.isEmpty) {
      return 'Closed';
    }

    String formatTime(String time) {
      final parts = time.split(':');
      final hour = int.parse(parts[0]);
      final minute = parts[1];
      return '$hour:$minute';
    }

    return slots.map((slot) => '${formatTime(slot.startTime)} - ${formatTime(slot.endTime)}').join(', ');
  }

  /// Groups consecutive days with same opening hours
  static List<GroupedOpeningHours> groupConsecutiveDays(List<DayOpeningHours> openingHours) {
    if (openingHours.isEmpty) return [];

    final grouped = <GroupedOpeningHours>[];
    DayOpeningHours? currentGroup;
    String? currentTimeSlots;

    for (final day in openingHours) {
      final timeSlotsString = formatTimeSlots(day.timeSlots);

      if (currentTimeSlots == timeSlotsString && currentGroup != null) {
        // Extend current group
        currentGroup = DayOpeningHours(
          dayName: '${currentGroup.dayName.split(' - ')[0]} - ${day.dayName}',
          timeSlots: day.timeSlots,
        );
      } else {
        // Start new group
        if (currentGroup != null) {
          grouped.add(
            GroupedOpeningHours(
              dayRange: currentGroup.dayName,
              timeSlots: currentGroup.timeSlots,
            ),
          );
        }

        currentGroup = day;
        currentTimeSlots = timeSlotsString;
      }
    }

    // Add the last group
    if (currentGroup != null) {
      grouped.add(
        GroupedOpeningHours(
          dayRange: currentGroup.dayName,
          timeSlots: currentGroup.timeSlots,
        ),
      );
    }

    return grouped;
  }

  static (int, int) slotIndexToTime(int slotIndex) {
    final totalMinutes = slotIndex * slotDurationMinutes;
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    return (hours, minutes);
  }
}

class DayOpeningHours {
  final String dayName;
  final List<TimeSlot> timeSlots;

  const DayOpeningHours({
    required this.dayName,
    required this.timeSlots,
  });
}

class TimeSlot {
  final String startTime;
  final String endTime;

  const TimeSlot({
    required this.startTime,
    required this.endTime,
  });
}

class GroupedOpeningHours {
  final String dayRange;
  final List<TimeSlot> timeSlots;

  const GroupedOpeningHours({
    required this.dayRange,
    required this.timeSlots,
  });
}
