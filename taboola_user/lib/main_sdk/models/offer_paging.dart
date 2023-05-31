class OfferPaging {
  List<ResultsOffer>? results;

  OfferPaging({this.results});

  OfferPaging.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ResultsOffer>[];
      json['results'].forEach((v) {
        results!.add(ResultsOffer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultsOffer {
  String? offerId;
  String? offerName;
  String? offerNameAr;
  num? normalCustomerOfferPrice;
  num? supermarketCustomerOfferPrice;
  num? agentCustomerOfferPrice;
  num? companyCustomerOfferPrice;
  num? restuarantCustomerOfferPrice;
  String? normalCustomerOfferDescription;
  String? supermarketCustomerOfferDescription;
  String? agentCustomerOfferDescription;
  String? companyCustomerOfferDescription;
  String? restuarantCustomerOfferDescription;
  String? normalCustomerOfferDescriptionAr;
  String? supermarketCustomerOfferDescriptionAr;
  String? agentCustomerOfferDescriptionAr;
  String? companyCustomerOfferDescriptionAr;
  String? restuarantCustomerOfferDescriptionAr;
  String? offerImage;
  String? createdAt;
  String? meal;

  ResultsOffer(
      {this.offerId,
      this.offerName,
      this.offerNameAr,
      this.normalCustomerOfferPrice,
      this.supermarketCustomerOfferPrice,
      this.agentCustomerOfferPrice,
      this.companyCustomerOfferPrice,
      this.restuarantCustomerOfferPrice,
      this.normalCustomerOfferDescription,
      this.supermarketCustomerOfferDescription,
      this.agentCustomerOfferDescription,
      this.companyCustomerOfferDescription,
      this.restuarantCustomerOfferDescription,
      this.normalCustomerOfferDescriptionAr,
      this.supermarketCustomerOfferDescriptionAr,
      this.agentCustomerOfferDescriptionAr,
      this.companyCustomerOfferDescriptionAr,
      this.restuarantCustomerOfferDescriptionAr,
      this.offerImage,
      this.createdAt,
      this.meal});

  ResultsOffer.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    offerName = json['offer_name'];
    offerNameAr = json['offer_name_ar'];
    normalCustomerOfferPrice = json['normal_customer_offer_price'];
    supermarketCustomerOfferPrice = json['supermarket_customer_offer_price'];
    agentCustomerOfferPrice = json['agent_customer_offer_price'];
    companyCustomerOfferPrice = json['company_customer_offer_price'];
    restuarantCustomerOfferPrice = json['restuarant_customer_offer_price'];
    normalCustomerOfferDescription = json['normal_customer_offer_description'];
    supermarketCustomerOfferDescription =
        json['supermarket_customer_offer_description'];
    agentCustomerOfferDescription = json['agent_customer_offer_description'];
    companyCustomerOfferDescription =
        json['company_customer_offer_description'];
    restuarantCustomerOfferDescription =
        json['restuarant_customer_offer_description'];
    normalCustomerOfferDescriptionAr =
        json['normal_customer_offer_description_ar'];
    supermarketCustomerOfferDescriptionAr =
        json['supermarket_customer_offer_description_ar'];
    agentCustomerOfferDescriptionAr =
        json['agent_customer_offer_description_ar'];
    companyCustomerOfferDescriptionAr =
        json['company_customer_offer_description_ar'];
    restuarantCustomerOfferDescriptionAr =
        json['restuarant_customer_offer_description_ar'];
    offerImage = json['offer_image'];
    createdAt = json['created_at'];
    meal = json['meal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offer_id'] = offerId;
    data['offer_name'] = offerName;
    data['offer_name_ar'] = offerNameAr;
    data['normal_customer_offer_price'] = normalCustomerOfferPrice;
    data['supermarket_customer_offer_price'] = supermarketCustomerOfferPrice;
    data['agent_customer_offer_price'] = agentCustomerOfferPrice;
    data['company_customer_offer_price'] = companyCustomerOfferPrice;
    data['restuarant_customer_offer_price'] = restuarantCustomerOfferPrice;
    data['normal_customer_offer_description'] = normalCustomerOfferDescription;
    data['supermarket_customer_offer_description'] =
        supermarketCustomerOfferDescription;
    data['agent_customer_offer_description'] = agentCustomerOfferDescription;
    data['company_customer_offer_description'] =
        companyCustomerOfferDescription;
    data['restuarant_customer_offer_description'] =
        restuarantCustomerOfferDescription;
    data['normal_customer_offer_description_ar'] =
        normalCustomerOfferDescriptionAr;
    data['supermarket_customer_offer_description_ar'] =
        supermarketCustomerOfferDescriptionAr;
    data['agent_customer_offer_description_ar'] =
        agentCustomerOfferDescriptionAr;
    data['company_customer_offer_description_ar'] =
        companyCustomerOfferDescriptionAr;
    data['restuarant_customer_offer_description_ar'] =
        restuarantCustomerOfferDescriptionAr;
    data['offer_image'] = offerImage;
    data['created_at'] = createdAt;
    data['meal'] = meal;
    return data;
  }
}
