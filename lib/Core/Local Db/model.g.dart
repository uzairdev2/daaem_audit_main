// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelHiveAdapter extends TypeAdapter<ModelHive> {
  @override
  final int typeId = 0;

  @override
  ModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelHive(
      barcode: fields[0] as String,
      quamtitiy: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.barcode)
      ..writeByte(1)
      ..write(obj.quamtitiy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
