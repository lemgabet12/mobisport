class GetDate {
  String finalDate = '';

  String getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate =
        "${dateParse.year}-${dateParse.month}-${dateParse.day + 1}";

    return finalDate = formattedDate.toString();
  }

  String getSpecificDate(int day) {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate =
        "${dateParse.year}-${dateParse.month}-${1 + dateParse.day - day}";

    return finalDate = formattedDate.toString();
  }
}
