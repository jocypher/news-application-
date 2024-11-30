// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_class_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsClassAdapter extends TypeAdapter<NewsClass> {
  @override
  final int typeId = 0;

  @override
  NewsClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsClass(
      author: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      url: fields[3] as String?,
      content: fields[5] as String?,
      urlToImage: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsClass obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.urlToImage)
      ..writeByte(5)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
