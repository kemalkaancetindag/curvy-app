 class Utils {
  static String getMimetype(String fileName) {
    return fileName.split('/').last.split('.').last;
  }
 }