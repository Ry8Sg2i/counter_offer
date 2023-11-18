abstract class Validator<T> {
  bool validate(T value);

  String getMessage();
}