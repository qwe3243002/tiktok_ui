extension MapWithIndex<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(int i, T t) callback) {
    List<R> result = [];
    for (int i = 0; i < length; i++) {
      R item = callback(i, this[i]);
      result.add(item);
    }
    return result;
  }
}
