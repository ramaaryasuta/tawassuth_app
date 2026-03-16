import 'package:equatable/equatable.dart';

class Timezone extends Equatable {
  final String name;
  final String utcOffset;
  final String abbreviation;

  const Timezone({
    required this.name,
    required this.utcOffset,
    required this.abbreviation,
  });

  @override
  List<Object?> get props => [name, utcOffset, abbreviation];
}
