class SholatHelper {
  static String currentSholatName = "";

  static String getSholatStatus(List<Map<String, String>> sholatTimes) {
    DateTime now = DateTime.now();

    for (int i = 0; i < sholatTimes.length; i++) {
      List<String> parts = sholatTimes[i]["time"]!.split(":");

      DateTime sholatTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      // SHOLAT BERIKUTNYA
      if (sholatTime.isAfter(now)) {
        currentSholatName = sholatTimes[i]["name"]!;

        Duration difference = sholatTime.difference(now);

        String hours = difference.inHours.toString().padLeft(2, '0');

        String minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');

        String seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');

        return "$hours:$minutes:$seconds";
      }
    }

    // JIKA SUDAH LEWAT ISYA
    List<String> fajrParts = sholatTimes[0]["time"]!.split(":");

    DateTime nextFajr = DateTime(
      now.year,
      now.month,
      now.day + 1,
      int.parse(fajrParts[0]),
      int.parse(fajrParts[1]),
    );

    currentSholatName = sholatTimes[0]["name"]!;

    Duration difference = nextFajr.difference(now);

    String hours = difference.inHours.toString().padLeft(2, '0');

    String minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');

    String seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }
}
