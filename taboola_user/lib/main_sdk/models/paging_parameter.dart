class PagingParameters {
  int pageSize;

  PagingParameters({
    this.pageSize = 10,
  });

  PagingParameters.model(PagingParameters pagingParameters)
      : pageSize = pagingParameters.pageSize;

  Map<String, dynamic> toMap() {
    return {
      'page': pageSize,
    }..removeWhere((key, value) => value == null);
  }
}
