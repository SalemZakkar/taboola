class TypeRoleUser {
  static const NormalCustomer = TypeRoleUser._('NormalCustomer');
  static const RestaurantCustomer = TypeRoleUser._('RestaurantCustomer');
  static const SuperMarketCustomer = TypeRoleUser._('SuperMarketCustomer');
  static const AgentCustomer = TypeRoleUser._('AgentCustomer');
  static const CompanyCustomer = TypeRoleUser._('CompanyCustomer');

  final String value;

  const TypeRoleUser._(this.value);

  const TypeRoleUser.get(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeRoleUser &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
///simple ex to use
// TaboolaUserSDK.tokenAllData?.customerData?.role== TypeRoleUser.AgentCustomer?