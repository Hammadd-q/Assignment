// To parse this JSON data, do
//
//     final productListingModel = productListingModelFromJson(jsonString);

import 'dart:convert';

ProductListingModel productListingModelFromJson(String str) => ProductListingModel.fromJson(json.decode(str));

String productListingModelToJson(ProductListingModel data) => json.encode(data.toJson());

class ProductListingModel {
  final String? searchTerm;
  final String? categoryName;
  final num? itemCount;
  final String? redirectUrl;
  final List<Product>? products;
  final Diagnostics? diagnostics;
  final SearchPassMeta? searchPassMeta;
  final dynamic queryId;
  final List<dynamic>? discoverSearchProductTypes;
  final Campaigns? campaigns;

  ProductListingModel({
    this.searchTerm,
    this.categoryName,
    this.itemCount,
    this.redirectUrl,
    this.products,
    this.diagnostics,
    this.searchPassMeta,
    this.queryId,
    this.discoverSearchProductTypes,
    this.campaigns,
  });

  factory ProductListingModel.fromJson(Map<String, dynamic> json) => ProductListingModel(
    searchTerm: json["searchTerm"],
    categoryName: json["categoryName"],
    itemCount: json["itemCount"],
    redirectUrl: json["redirectUrl"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    diagnostics: json["diagnostics"] == null ? null : Diagnostics.fromJson(json["diagnostics"]),
    searchPassMeta: json["searchPassMeta"] == null ? null : SearchPassMeta.fromJson(json["searchPassMeta"]),
    queryId: json["queryId"],
    discoverSearchProductTypes: json["discoverSearchProductTypes"] == null ? [] : List<dynamic>.from(json["discoverSearchProductTypes"]!.map((x) => x)),
    campaigns: json["campaigns"] == null ? null : Campaigns.fromJson(json["campaigns"]),
  );

  Map<String, dynamic> toJson() => {
    "searchTerm": searchTerm,
    "categoryName": categoryName,
    "itemCount": itemCount,
    "redirectUrl": redirectUrl,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "diagnostics": diagnostics?.toJson(),
    "searchPassMeta": searchPassMeta?.toJson(),
    "queryId": queryId,
    "discoverSearchProductTypes": discoverSearchProductTypes == null ? [] : List<dynamic>.from(discoverSearchProductTypes!.map((x) => x)),
    "campaigns": campaigns?.toJson(),
  };
}

class Campaigns {
  final List<dynamic>? imageTiles;
  final List<dynamic>? promoBanners;
  final List<dynamic>? sponsoredProducts;

  Campaigns({
    this.imageTiles,
    this.promoBanners,
    this.sponsoredProducts,
  });

  factory Campaigns.fromJson(Map<String, dynamic> json) => Campaigns(
    imageTiles: json["imageTiles"] == null ? [] : List<dynamic>.from(json["imageTiles"]!.map((x) => x)),
    promoBanners: json["promoBanners"] == null ? [] : List<dynamic>.from(json["promoBanners"]!.map((x) => x)),
    sponsoredProducts: json["sponsoredProducts"] == null ? [] : List<dynamic>.from(json["sponsoredProducts"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "imageTiles": imageTiles == null ? [] : List<dynamic>.from(imageTiles!.map((x) => x)),
    "promoBanners": promoBanners == null ? [] : List<dynamic>.from(promoBanners!.map((x) => x)),
    "sponsoredProducts": sponsoredProducts == null ? [] : List<dynamic>.from(sponsoredProducts!.map((x) => x)),
  };
}

class Diagnostics {
  final String? requestId;
  final num? processingTime;
  final num? queryTime;
  final bool? recommendationsEnabled;
  final RecommendationsAnalytics? recommendationsAnalytics;
  final bool? advertisementsEnabled;
  final AdvertisementsAnalytics? advertisementsAnalytics;
  final CurationAnalytics? curationAnalytics;

  Diagnostics({
    this.requestId,
    this.processingTime,
    this.queryTime,
    this.recommendationsEnabled,
    this.recommendationsAnalytics,
    this.advertisementsEnabled,
    this.advertisementsAnalytics,
    this.curationAnalytics,
  });

  factory Diagnostics.fromJson(Map<String, dynamic> json) => Diagnostics(
    requestId: json["requestId"],
    processingTime: json["processingTime"],
    queryTime: json["queryTime"],
    recommendationsEnabled: json["recommendationsEnabled"],
    recommendationsAnalytics: json["recommendationsAnalytics"] == null ? null : RecommendationsAnalytics.fromJson(json["recommendationsAnalytics"]),
    advertisementsEnabled: json["advertisementsEnabled"],
    advertisementsAnalytics: json["advertisementsAnalytics"] == null ? null : AdvertisementsAnalytics.fromJson(json["advertisementsAnalytics"]),
    curationAnalytics: json["curationAnalytics"] == null ? null : CurationAnalytics.fromJson(json["curationAnalytics"]),
  );

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "processingTime": processingTime,
    "queryTime": queryTime,
    "recommendationsEnabled": recommendationsEnabled,
    "recommendationsAnalytics": recommendationsAnalytics?.toJson(),
    "advertisementsEnabled": advertisementsEnabled,
    "advertisementsAnalytics": advertisementsAnalytics?.toJson(),
    "curationAnalytics": curationAnalytics?.toJson(),
  };
}

class AdvertisementsAnalytics {
  final num? status;
  final bool? customerOptIn;
  final num? numberOfItemsFromPartner;
  final List<dynamic>? items;
  final List<dynamic>? itemsFromPartner;
  final PlacementBeacons? placementBeacons;

  AdvertisementsAnalytics({
    this.status,
    this.customerOptIn,
    this.numberOfItemsFromPartner,
    this.items,
    this.itemsFromPartner,
    this.placementBeacons,
  });

  factory AdvertisementsAnalytics.fromJson(Map<String, dynamic> json) => AdvertisementsAnalytics(
    status: json["status"],
    customerOptIn: json["customerOptIn"],
    numberOfItemsFromPartner: json["numberOfItemsFromPartner"],
    items: json["items"] == null ? [] : List<dynamic>.from(json["items"]!.map((x) => x)),
    itemsFromPartner: json["itemsFromPartner"] == null ? [] : List<dynamic>.from(json["itemsFromPartner"]!.map((x) => x)),
    placementBeacons: json["placementBeacons"] == null ? null : PlacementBeacons.fromJson(json["placementBeacons"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "customerOptIn": customerOptIn,
    "numberOfItemsFromPartner": numberOfItemsFromPartner,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
    "itemsFromPartner": itemsFromPartner == null ? [] : List<dynamic>.from(itemsFromPartner!.map((x) => x)),
    "placementBeacons": placementBeacons?.toJson(),
  };
}

class PlacementBeacons {
  final dynamic onLoadBeacon;
  final dynamic onViewBeacon;

  PlacementBeacons({
    this.onLoadBeacon,
    this.onViewBeacon,
  });

  factory PlacementBeacons.fromJson(Map<String, dynamic> json) => PlacementBeacons(
    onLoadBeacon: json["onLoadBeacon"],
    onViewBeacon: json["onViewBeacon"],
  );

  Map<String, dynamic> toJson() => {
    "onLoadBeacon": onLoadBeacon,
    "onViewBeacon": onViewBeacon,
  };
}

class CurationAnalytics {
  final num? status;
  final num? numberOfCuratedItems;
  final List<dynamic>? elevatedItems;
  final List<dynamic>? fixedItems;
  final List<dynamic>? comingSoonItems;
  final List<dynamic>? advertisementPositions;
  final List<dynamic>? marketingItems;

  CurationAnalytics({
    this.status,
    this.numberOfCuratedItems,
    this.elevatedItems,
    this.fixedItems,
    this.comingSoonItems,
    this.advertisementPositions,
    this.marketingItems,
  });

  factory CurationAnalytics.fromJson(Map<String, dynamic> json) => CurationAnalytics(
    status: json["status"],
    numberOfCuratedItems: json["numberOfCuratedItems"],
    elevatedItems: json["elevatedItems"] == null ? [] : List<dynamic>.from(json["elevatedItems"]!.map((x) => x)),
    fixedItems: json["fixedItems"] == null ? [] : List<dynamic>.from(json["fixedItems"]!.map((x) => x)),
    comingSoonItems: json["comingSoonItems"] == null ? [] : List<dynamic>.from(json["comingSoonItems"]!.map((x) => x)),
    advertisementPositions: json["advertisementPositions"] == null ? [] : List<dynamic>.from(json["advertisementPositions"]!.map((x) => x)),
    marketingItems: json["marketingItems"] == null ? [] : List<dynamic>.from(json["marketingItems"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "numberOfCuratedItems": numberOfCuratedItems,
    "elevatedItems": elevatedItems == null ? [] : List<dynamic>.from(elevatedItems!.map((x) => x)),
    "fixedItems": fixedItems == null ? [] : List<dynamic>.from(fixedItems!.map((x) => x)),
    "comingSoonItems": comingSoonItems == null ? [] : List<dynamic>.from(comingSoonItems!.map((x) => x)),
    "advertisementPositions": advertisementPositions == null ? [] : List<dynamic>.from(advertisementPositions!.map((x) => x)),
    "marketingItems": marketingItems == null ? [] : List<dynamic>.from(marketingItems!.map((x) => x)),
  };
}

class RecommendationsAnalytics {
  final num? personalisationStatus;
  final num? numberOfItems;
  final num? numberOfRecs;
  final String? personalisationType;
  final String? experimentTrackerkey;
  final List<dynamic>? items;

  RecommendationsAnalytics({
    this.personalisationStatus,
    this.numberOfItems,
    this.numberOfRecs,
    this.personalisationType,
    this.experimentTrackerkey,
    this.items,
  });

  factory RecommendationsAnalytics.fromJson(Map<String, dynamic> json) => RecommendationsAnalytics(
    personalisationStatus: json["personalisationStatus"],
    numberOfItems: json["numberOfItems"],
    numberOfRecs: json["numberOfRecs"],
    personalisationType: json["personalisationType"],
    experimentTrackerkey: json["experimentTrackerkey"],
    items: json["items"] == null ? [] : List<dynamic>.from(json["items"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "personalisationStatus": personalisationStatus,
    "numberOfItems": numberOfItems,
    "numberOfRecs": numberOfRecs,
    "personalisationType": personalisationType,
    "experimentTrackerkey": experimentTrackerkey,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
  };
}

class Product {
  final num? id;
  final String? name;
  final Price? price;
  final String? colour;
  final num? colourWayId;
  final String? brandName;
  final bool? hasVariantColours;
  final bool? hasMultiplePrices;
  final dynamic groupId;
  final num? productCode;
  final String? productType;
  final String? url;
  final String? imageUrl;
  final List<String>? additionalImageUrls;
  final dynamic videoUrl;
  final bool? showVideo;
  final bool? isSellingFast;
  final bool? isRestockingSoon;
  final bool? isPromotion;
  final dynamic sponsoredCampaignId;
  final List<dynamic>? facetGroupings;
  final dynamic advertisement;

  Product({
    this.id,
    this.name,
    this.price,
    this.colour,
    this.colourWayId,
    this.brandName,
    this.hasVariantColours,
    this.hasMultiplePrices,
    this.groupId,
    this.productCode,
    this.productType,
    this.url,
    this.imageUrl,
    this.additionalImageUrls,
    this.videoUrl,
    this.showVideo,
    this.isSellingFast,
    this.isRestockingSoon,
    this.isPromotion,
    this.sponsoredCampaignId,
    this.facetGroupings,
    this.advertisement,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    colour: json["colour"],
    colourWayId: json["colourWayId"],
    brandName: json["brandName"],
    hasVariantColours: json["hasVariantColours"],
    hasMultiplePrices: json["hasMultiplePrices"],
    groupId: json["groupId"],
    productCode: json["productCode"],
    productType: json["productType"],
    url: json["url"],
    imageUrl: json["imageUrl"],
    additionalImageUrls: json["additionalImageUrls"] == null ? [] : List<String>.from(json["additionalImageUrls"]!.map((x) => x)),
    videoUrl: json["videoUrl"],
    showVideo: json["showVideo"],
    isSellingFast: json["isSellingFast"],
    isRestockingSoon: json["isRestockingSoon"],
    isPromotion: json["isPromotion"],
    sponsoredCampaignId: json["sponsoredCampaignId"],
    facetGroupings: json["facetGroupings"] == null ? [] : List<dynamic>.from(json["facetGroupings"]!.map((x) => x)),
    advertisement: json["advertisement"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price?.toJson(),
    "colour": colour,
    "colourWayId": colourWayId,
    "brandName": brandName,
    "hasVariantColours": hasVariantColours,
    "hasMultiplePrices": hasMultiplePrices,
    "groupId": groupId,
    "productCode": productCode,
    "productType": productType,
    "url": url,
    "imageUrl": imageUrl,
    "additionalImageUrls": additionalImageUrls == null ? [] : List<dynamic>.from(additionalImageUrls!.map((x) => x)),
    "videoUrl": videoUrl,
    "showVideo": showVideo,
    "isSellingFast": isSellingFast,
    "isRestockingSoon": isRestockingSoon,
    "isPromotion": isPromotion,
    "sponsoredCampaignId": sponsoredCampaignId,
    "facetGroupings": facetGroupings == null ? [] : List<dynamic>.from(facetGroupings!.map((x) => x)),
    "advertisement": advertisement,
  };
}

class Price {
  final Current? current;
  final Current? previous;
  final Current? rrp;
  final bool? isMarkedDown;
  final bool? isOutletPrice;
  final String? currency;

  Price({
    this.current,
    this.previous,
    this.rrp,
    this.isMarkedDown,
    this.isOutletPrice,
    this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
    previous: json["previous"] == null ? null : Current.fromJson(json["previous"]),
    rrp: json["rrp"] == null ? null : Current.fromJson(json["rrp"]),
    isMarkedDown: json["isMarkedDown"],
    isOutletPrice: json["isOutletPrice"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "current": current?.toJson(),
    "previous": previous?.toJson(),
    "rrp": rrp?.toJson(),
    "isMarkedDown": isMarkedDown,
    "isOutletPrice": isOutletPrice,
    "currency": currency,
  };
}

class Current {
  final num? value;
  final String? text;

  Current({
    this.value,
    this.text,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    value: json["value"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}

class SearchPassMeta {
  final bool? isPartial;
  final bool? isSpellcheck;
  final List<dynamic>? searchPass;
  final List<dynamic>? alternateSearchTerms;

  SearchPassMeta({
    this.isPartial,
    this.isSpellcheck,
    this.searchPass,
    this.alternateSearchTerms,
  });

  factory SearchPassMeta.fromJson(Map<String, dynamic> json) => SearchPassMeta(
    isPartial: json["isPartial"],
    isSpellcheck: json["isSpellcheck"],
    searchPass: json["searchPass"] == null ? [] : List<dynamic>.from(json["searchPass"]!.map((x) => x)),
    alternateSearchTerms: json["alternateSearchTerms"] == null ? [] : List<dynamic>.from(json["alternateSearchTerms"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "isPartial": isPartial,
    "isSpellcheck": isSpellcheck,
    "searchPass": searchPass == null ? [] : List<dynamic>.from(searchPass!.map((x) => x)),
    "alternateSearchTerms": alternateSearchTerms == null ? [] : List<dynamic>.from(alternateSearchTerms!.map((x) => x)),
  };
}
