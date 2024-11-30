import 'dart:async';
import 'dart:io';

extension ErrorHandler on Object {
  String get errorTitle {
    if (this is HttpException) {
      return 'Network Error';
    } else if (this is FormatException) {
      return 'Format Exception';
    } else if (this is TimeoutException) {
      return 'Connection timed out';
    } else {
      return 'Unexpected error';
    }
  }

    String get errorMessage {
    if (this is HttpException) {
      return (this as HttpException).message;
    } else if (this is FormatException) {
      return (this as FormatException).message;
    } else if (this is TimeoutException) {
      return "The operation timed out. Please try again.";
    } else {
      return this.toString();
    }
  }
}

