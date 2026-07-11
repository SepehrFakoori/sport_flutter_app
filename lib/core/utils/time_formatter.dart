class TimeFormatter {
  static String mmss(int sec) {
    final String minutes = (sec ~/ 60).toString().padLeft(2, '0');
    final String seconds = (sec % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
