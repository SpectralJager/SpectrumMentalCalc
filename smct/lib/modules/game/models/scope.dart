class Scope {
  final int max, min;

  const Scope(this.max, this.min);

  Scope copyWith({int? max, int? min}) {
    return Scope(max ?? this.max, min ?? this.min);
  }
}
