// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dhikr {
  const Dhikr({
    required this.id,
    required this.imageUrl,
    required this.description,
    this.counter1,
    this.counter2,
    this.counter3,
    this.counter4,
    this.counter5,
    this.counter6,
    this.counter7,
  });
  final String id;
  final String imageUrl;
  final String description;
  final int? counter1;
  final int? counter2;
  final int? counter3;
  final int? counter4;
  final int? counter5;
  final int? counter6;
  final int? counter7;

  @override
  bool operator ==(covariant Dhikr other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.counter1 == counter1 &&
        other.counter2 == counter2 &&
        other.counter3 == counter3 &&
        other.counter4 == counter4 &&
        other.counter5 == counter5 &&
        other.counter6 == counter6 &&
        other.counter7 == counter7;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        counter1.hashCode ^
        counter2.hashCode ^
        counter3.hashCode ^
        counter4.hashCode ^
        counter5.hashCode ^
        counter6.hashCode ^
        counter7.hashCode;
  }

  @override
  String toString() {
    return 'Dhikr(id: $id, imageUrl: $imageUrl, description: $description, counter1: $counter1, counter2: $counter2, counter3: $counter3, counter4: $counter4, counter5: $counter5, counter6: $counter6, counter7: $counter7)';
  }

  Dhikr copyWith({
    String? id,
    String? imageUrl,
    String? description,
    int? counter1,
    int? counter2,
    int? counter3,
    int? counter4,
    int? counter5,
    int? counter6,
    int? counter7,
  }) {
    return Dhikr(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      counter1: counter1 ?? this.counter1,
      counter2: counter2 ?? this.counter2,
      counter3: counter3 ?? this.counter3,
      counter4: counter4 ?? this.counter4,
      counter5: counter5 ?? this.counter5,
      counter6: counter6 ?? this.counter6,
      counter7: counter7 ?? this.counter7,
    );
  }
}
