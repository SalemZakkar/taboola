class About {
  int? id;
  List<CarouselImages>? carouselImages;
  String? companyName;
  String? companyNameAr;
  String? companySubtitle;
  String? companySubtitleAr;
  String? companyLocation;
  String? companyLocationAr;
  String? companyEmail;
  String? companyPhoneNumber;
  String? companyFacebookLink;
  String? companyInstagramLink;
  String? companyDescription;
  String? companyDescriptionAr;
  String? companyFeatures;
  String? companyFeaturesAr;

  About(
      {this.id,
      this.carouselImages,
      this.companyName,
      this.companyNameAr,
      this.companySubtitle,
      this.companySubtitleAr,
      this.companyLocation,
      this.companyLocationAr,
      this.companyEmail,
      this.companyPhoneNumber,
      this.companyFacebookLink,
      this.companyInstagramLink,
      this.companyDescription,
      this.companyDescriptionAr,
      this.companyFeatures,
      this.companyFeaturesAr});

  About.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['carousel_images'] != null) {
      carouselImages = <CarouselImages>[];
      json['carousel_images'].forEach((v) {
        carouselImages!.add(CarouselImages.fromJson(v));
      });
    }
    companyName = json['company_name'];
    companyNameAr = json['company_name_ar'];
    companySubtitle = json['company_subtitle'];
    companySubtitleAr = json['company_subtitle_ar'];
    companyLocation = json['company_location'];
    companyLocationAr = json['company_location_ar'];
    companyEmail = json['company_email'];
    companyPhoneNumber = json['company_phone_number'];
    companyFacebookLink = json['company_facebook_link'];
    companyInstagramLink = json['company_instagram_link'];
    companyDescription = json['company_description'];
    companyDescriptionAr = json['company_description_ar'];
    companyFeatures = json['company_features'];
    companyFeaturesAr = json['company_features_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (carouselImages != null) {
      data['carousel_images'] = carouselImages!.map((v) => v.toJson()).toList();
    }
    data['company_name'] = this.companyName;
    data['company_name_ar'] = this.companyNameAr;
    data['company_subtitle'] = this.companySubtitle;
    data['company_subtitle_ar'] = this.companySubtitleAr;
    data['company_location'] = this.companyLocation;
    data['company_location_ar'] = this.companyLocationAr;
    data['company_email'] = this.companyEmail;
    data['company_phone_number'] = this.companyPhoneNumber;
    data['company_facebook_link'] = this.companyFacebookLink;
    data['company_instagram_link'] = this.companyInstagramLink;
    data['company_description'] = this.companyDescription;
    data['company_description_ar'] = this.companyDescriptionAr;
    data['company_features'] = this.companyFeatures;
    data['company_features_ar'] = this.companyFeaturesAr;
    return data;
  }
}

class CarouselImages {
  String? carouselImage;

  CarouselImages({this.carouselImage});

  CarouselImages.fromJson(Map<String, dynamic> json) {
    carouselImage = json['carousel_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carousel_image'] = carouselImage;
    return data;
  }
}
