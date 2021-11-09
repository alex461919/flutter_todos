import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_state_model.g.dart';

@HiveType(typeId: 31, adapterName: 'StateHiveModelAdapter')
class HiveStateModel {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final IconData icon;
  @HiveField(2)
  final Color color;
  @HiveField(3)
  final double opacity;
  const HiveStateModel({
    required this.description,
    required this.icon,
    required this.color,
    required this.opacity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HiveStateModel &&
        other.description == description &&
        other.icon == icon &&
        other.color == color &&
        other.opacity == opacity;
  }

  @override
  int get hashCode {
    return description.hashCode ^ icon.hashCode ^ color.hashCode ^ opacity.hashCode;
  }

  @override
  String toString() {
    return 'HiveStateModel(description: $description, icon: $icon, color: $color, opacity: $opacity)';
  }
}

class ColorAdapter extends TypeAdapter<Color> {
  @override
  final int typeId = 34;

  @override
  Color read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Color(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ColorAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

class IconDataAdapter extends TypeAdapter<IconData> {
  @override
  final int typeId = 33;

  @override
  IconData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IconData(
      fields[0] as int,
      fontFamily: fields[1] as String?,
      fontPackage: fields[2] as String?,
      matchTextDirection: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, IconData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.codePoint)
      ..writeByte(1)
      ..write(obj.fontFamily)
      ..writeByte(2)
      ..write(obj.fontPackage)
      ..writeByte(3)
      ..write(obj.matchTextDirection);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is IconDataAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

/*

@HiveType(typeId: 34)
class Color {
  @HiveField(0)
  final int value;
  const Color(this.value);
}



@HiveType(typeId: 33)
class IconData {
  const IconData(
    this.codePoint, {
    this.fontFamily,
    this.fontPackage,
    this.matchTextDirection = false,
  });
  @HiveField(0)
  final int codePoint;
  @HiveField(1)
  final String? fontFamily;
  @HiveField(2)
  final String? fontPackage;
  @HiveField(3)
  final bool matchTextDirection;
}
*/
/*
class IconDataAdapter extends TypeAdapter<IconData> {
  @override
  IconData read(BinaryReader reader) {
    return const IconData()
      ..id = reader.read()
      ..name = reader.read();
  }

  void write(BinaryWriter writer, IconData obj) {
    writer.write(obj.id);
    writer.write(obj.name);
  }
}
*/
