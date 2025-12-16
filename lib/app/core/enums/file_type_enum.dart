enum DocumentType {
  unknown('Unknown'),
  pdf('PDF'),
  image('Image');

  static DocumentType? fromString(String? value) {
    if (value == null) return unknown;
    try {
      return DocumentType.values.firstWhere(
        (e) => e.name.toLowerCase() == value.toLowerCase(),
      );
    } catch (e) {
      return unknown;
    }
  }

  final String displayName;
  const DocumentType(this.displayName);

  static DocumentType? fromName(String val) {
    try {
      return DocumentType.values.byName(val);
    } catch (e) {
      return DocumentType.unknown;
    }
  }

  static DocumentType fromExtension(String extension) {
    switch (extension.toLowerCase()) {
      case '.pdf':
        return DocumentType.pdf;
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
        return DocumentType.image;
      default:
        return DocumentType.unknown;
    }
  }
}
