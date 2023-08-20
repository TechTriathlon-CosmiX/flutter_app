class DateFormat {
  String dateFormatter(DateTime date) {
    String day = date.day.toString();
    String monthAbbreviation = _getMonthAbbreviation(date.month);
    String year = date.year.toString();

    String dayWithSuffix = _getDayWithSuffix(day);

    return "$dayWithSuffix $monthAbbreviation $year";
  }

  String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }

  String _getDayWithSuffix(String day) {
    if (day.endsWith("1") && day != "11") {
      return "${day}st";
    } else if (day.endsWith("2") && day != "12") {
      return "${day}nd";
    } else if (day.endsWith("3") && day != "13") {
      return "${day}rd";
    } else {
      return "${day}th";
    }
  }

  String timeFormatter(DateTime dateTime) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
