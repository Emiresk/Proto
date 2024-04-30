class GoRouterPathCollector {
  static String _previousPage = '';
  static String _currentPage = '';

  static String GetPreviousPage() {
    return _previousPage;
  }

  static String GetCurrentPage() {
    return _currentPage;
  }

  static void SetPreviousPage ( String path ) {
    _previousPage = path;
  }

  static void SetCurrentPage( String path ) {
    _currentPage  = path;
  }
}
