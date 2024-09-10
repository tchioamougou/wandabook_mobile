class Book {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  /*final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;*/

  Book({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
  /*  this.saleInfo,
    this.accessInfo,
    this.searchInfo,*/
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      kind: json['kind'] ?? "",
      id: json['id'] ?? "",
      etag: json['etag'] ?? "",
      selfLink: json['selfLink'] ?? "",
     volumeInfo:
            VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      /*
        saleInfo: SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo:
            AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
        searchInfo:
            SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),*/
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJson(),
        /*'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
        'searchInfo': searchInfo?.toJson(),*/
      };
}

class VolumeInfo {
  final String title;
  final String publishedDate;
  final String description;
  final List<IndustryIdentifier> industryIdentifiers;
  final ReadingModes readingModes;
  final int pageCount;
  final String printType;
  final List<String> categories;
  final List<String> authors;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.authors
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] ?? "",
        publishedDate: json['publishedDate'] ?? "",
        description: json['description'] ?? "",
        industryIdentifiers: ((json['industryIdentifiers']??[]) as List)
            .map((dynamic identifier) =>
                IndustryIdentifier.fromJson(identifier as Map<String, dynamic>))
            .toList(),
        readingModes:
            ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>),
        pageCount: json['pageCount'] as int,
        printType: json['printType'] ?? "",
        categories: ((json['categories']??[]) as List).cast<String>(),
    authors: ((json['authors']??[]) as List).cast<String>(),
        maturityRating: json['maturityRating'] ?? "",
        allowAnonLogging: json['allowAnonLogging'] as bool,
        contentVersion: json['contentVersion'] ?? "",
        imageLinks:
            ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
        language: json['language'] ?? "",
        previewLink: json['previewLink'] ?? "",
        infoLink: json['infoLink'] ?? "",
        canonicalVolumeLink: json['canonicalVolumeLink'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'publishedDate': publishedDate,
        'description': description,
        'industryIdentifiers': industryIdentifiers
      };
}

class IndustryIdentifier {
  final String type;
  final String identifier;

  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json['type'] ?? "",
        identifier: json['identifier'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'identifier': identifier,
      };
}

class ReadingModes {
  final bool text;
  final bool image;

  ReadingModes({
    required this.text,
    required this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json['text'] as bool,
        image: json['image'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'image': image,
      };
}

class PanelizationSummary {
  final bool containsEpubBubbles;
  final bool containsImageBubbles;

  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json['containsEpubBubbles'] as bool,
        containsImageBubbles: json['containsImageBubbles'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'containsEpubBubbles': containsEpubBubbles,
        'containsImageBubbles': containsImageBubbles,
      };
}

class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json['smallThumbnail'] ?? "",
        thumbnail: json['thumbnail'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
      };
}

class SaleInfo {
  final String country;
  final String saleability;
  final bool isEbook;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] ?? "",
        saleability: json['saleability'] ?? "",
        isEbook: json['isEbook'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
      };
}

class AccessInfo {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final EpubInfo epub;
  final PdfInfo pdf;
  final String webReaderLink;
  final String accessViewStatus;
  final bool quoteSharingAllowed;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json['country'] ?? "",
        viewability: json['viewability'] ?? "",
        embeddable: json['embeddable'] as bool,
        publicDomain: json['publicDomain'] as bool,
        textToSpeechPermission: json['textToSpeechPermission'] ?? "",
        epub: EpubInfo.fromJson(json['epub'] as Map<String, dynamic>),
        pdf: PdfInfo.fromJson(json['pdf'] as Map<String, dynamic>),
        webReaderLink: json['webReaderLink'] ?? "",
        accessViewStatus: json['accessViewStatus'] ?? "",
        quoteSharingAllowed: json['quoteSharingAllowed'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'viewability': viewability,
        'embeddable': embeddable,
        'publicDomain': publicDomain,
        'textToSpeechPermission': textToSpeechPermission,
        'epub': epub.toJson(),
        'pdf': pdf.toJson(),
        'webReaderLink': webReaderLink,
        'accessViewStatus': accessViewStatus,
        'quoteSharingAllowed': quoteSharingAllowed,
      };
}

class EpubInfo {
  final bool isAvailable;

  EpubInfo({
    required this.isAvailable,
  });

  factory EpubInfo.fromJson(Map<String, dynamic> json) => EpubInfo(
        isAvailable: json['isAvailable'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
      };
}

class PdfInfo {
  final bool isAvailable;

  PdfInfo({
    required this.isAvailable,
  });

  factory PdfInfo.fromJson(Map<String, dynamic> json) => PdfInfo(
        isAvailable: json['isAvailable'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
      };
}

class SearchInfo {
  final String textSnippet;

  SearchInfo({
    required this.textSnippet,
  });

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json['textSnippet'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        'textSnippet': textSnippet,
      };
}
