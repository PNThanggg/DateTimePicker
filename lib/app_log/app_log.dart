import 'log/logger.dart';

class AppLog {
  static Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  static Logger loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  static debug(dynamic message) {
    logger.d(message);
  }

  static info(dynamic message) {
    // logger.i(message);

    loggerNoStack.i(message);
  }

  static warning(dynamic message) {
    loggerNoStack.w(message);
  }

  static error(dynamic message) {
    logger.e(message, 'Error');
  }

  static verbose(dynamic message) {
    logger.v(message);
  }

  static logWtf(dynamic message) {
    // logger.wtf(message);

    loggerNoStack.wtf(message);
  }
}
