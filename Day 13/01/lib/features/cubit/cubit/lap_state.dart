abstract class LaptopState {}

class LaptopInitial extends LaptopState {}

class LaptopLoading extends LaptopState {}

class LaptopSuccess extends LaptopState {
  final List laptops;
  LaptopSuccess(this.laptops);
}

class LaptopError extends LaptopState {
  final String message;
  LaptopError(this.message);
}
