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
      retailerId: fields[0] as String?,
      branchId: fields[1] as String?,
      custmoreId: fields[2] as String?,
      categoryId: fields[3] as String?,
      productId: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ModelHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.retailerId)
      ..writeByte(1)
      ..write(obj.branchId)
      ..writeByte(2)
      ..write(obj.custmoreId)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.productId);
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
