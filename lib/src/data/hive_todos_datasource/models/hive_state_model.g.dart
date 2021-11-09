// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_state_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StateHiveModelAdapter extends TypeAdapter<HiveStateModel> {
  @override
  final int typeId = 31;

  @override
  HiveStateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStateModel(
      description: fields[0] as String,
      icon: fields[1] as IconData,
      color: fields[2] as Color,
      opacity: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HiveStateModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.opacity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
