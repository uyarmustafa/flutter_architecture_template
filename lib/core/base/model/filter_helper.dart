import 'package:json_annotation/json_annotation.dart';

import '../../../serializeable.dart';
import 'data_paging_options.dart';

@JsonSerializable()
class FilterHelper<T extends ISerializeable> {
  T? veri;
  String? aranacakKelime;
  String? baslangicTarih;
  String? bitisTarih;
  List<String>? includes;
  List<String>? nullFiltrelemeYapilacaklar;
  DataPagingOptions? pagingOptions;
  String? tarihSutunAdi;
  String? orderBy;
  bool? desc;
  List<String>? aranacakKelimeIncludes;

  FilterHelper(this.veri);

  FilterHelper.fromJson(Map<String, dynamic> json)
      : veri = ISerializeable.create(T, json['veri']!),
        aranacakKelime = json['aranacakKelime'],
        baslangicTarih = json['baslangicTarih'],
        bitisTarih = json['bitisTarih'],
        includes = json['includes'],
        nullFiltrelemeYapilacaklar = json['nullFiltrelemeYapilacaklar'],
        pagingOptions = json['pagingOptions'],
        tarihSutunAdi = json['tarihSutunAdi'],
        orderBy = json['orderBy'],
        desc = json['desc'],
        aranacakKelimeIncludes = json['aranacakKelimeIncludes'];

  Map<String, dynamic> toJson() => {
        'veri': veri,
        'aranacakKelime': aranacakKelime,
        'baslangicTarih': baslangicTarih,
        'bitisTarih': bitisTarih,
        'includes': includes,
        'nullFiltrelemeYapilacaklar': nullFiltrelemeYapilacaklar,
        'pagingOptions': pagingOptions,
        'tarihSutunAdi': tarihSutunAdi,
        'orderBy': orderBy,
        if (desc != null) 'desc': desc,
        'aranacakKelimeIncludes': aranacakKelimeIncludes,
      };
}
