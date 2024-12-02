import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paging_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagingEntity<E extends ToModel<M>, M> implements ToModel<PagingList<M>> {
  PagingEntity({
    this.result,
    this.pageInfo,
  });

  factory PagingEntity.fromJson(
    Map<String, dynamic> json,
    E Function(Object?) fromJsonE,
  ) =>
      _$PagingEntityFromJson(
        json,
        fromJsonE,
        (e) => 'null' as M, // Type M is just for inference, never used
      );

  factory PagingEntity.fromModel(
    PagingList<M> model,
    E Function(Object?) fromModelE,
  ) =>
      PagingEntity(
        result: model.items.map(fromModelE).toList(),
        pageInfo: PageEntity.fromModel(model.page),
      );

  final List<E>? result;
  final PageEntity? pageInfo;

  Map<String, dynamic> toJson(
    Object? Function(E value) toJsonE,
  ) =>
      _$PagingEntityToJson(this, toJsonE, (e) => 'null');

  @override
  PagingList<M> toModel() => PagingList(
        items: result?.map((e) => e.toModel()).toList() ?? [],
        page: pageInfo?.toModel(),
      );
}

@JsonSerializable()
class PageEntity implements ToModel<PageInfo> {
  PageEntity({
    this.current,
    this.size,
    this.totalItems,
  });

  factory PageEntity.fromJson(Map<String, dynamic> json) =>
      _$PageEntityFromJson(json);

  factory PageEntity.fromModel(PageInfo model) => PageEntity(
        current: model.current,
        size: model.size,
        totalItems: model.totalItems,
      );

  final int? current;
  final int? size;
  final int? totalItems;

  Map<String, dynamic> toJson() => _$PageEntityToJson(this);

  @override
  PageInfo toModel() => PageInfo(
        current: current ?? 0,
        size: size ?? 0,
        totalItems: totalItems ?? 0,
      );
}
