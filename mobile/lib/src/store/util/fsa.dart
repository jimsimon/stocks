abstract class FluxStandardAction<T> {
  final T payload;
  final bool error;

  FluxStandardAction({this.payload})
      : error = (payload is Error || payload is Exception);
}
