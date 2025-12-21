// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $SupplierTable extends Supplier
    with TableInfo<$SupplierTable, SupplierData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyMeta = const VerificationMeta(
    'company',
  );
  @override
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
    'company',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _boothMeta = const VerificationMeta('booth');
  @override
  late final GeneratedColumn<String> booth = GeneratedColumn<String>(
    'booth',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weChatIDMeta = const VerificationMeta(
    'weChatID',
  );
  @override
  late final GeneratedColumn<String> weChatID = GeneratedColumn<String>(
    'we_chat_i_d',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _whatsAppNumberMeta = const VerificationMeta(
    'whatsAppNumber',
  );
  @override
  late final GeneratedColumn<String> whatsAppNumber = GeneratedColumn<String>(
    'whats_app_number',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _industryMeta = const VerificationMeta(
    'industry',
  );
  @override
  late final GeneratedColumn<String> industry = GeneratedColumn<String>(
    'industry',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _interestLevelMeta = const VerificationMeta(
    'interestLevel',
  );
  @override
  late final GeneratedColumn<String> interestLevel = GeneratedColumn<String>(
    'interest_level',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageLocalPathMeta = const VerificationMeta(
    'imageLocalPath',
  );
  @override
  late final GeneratedColumn<String> imageLocalPath = GeneratedColumn<String>(
    'image_local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>?, String>
  scores = GeneratedColumn<String>(
    'scores',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<Map<String, String>?>($SupplierTable.$converterscoresn);
  static const VerificationMeta _productTypeMeta = const VerificationMeta(
    'productType',
  );
  @override
  late final GeneratedColumn<String> productType = GeneratedColumn<String>(
    'product_type',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    company,
    booth,
    address,
    email,
    phone,
    weChatID,
    whatsAppNumber,
    notes,
    industry,
    interestLevel,
    imageUrl,
    imageLocalPath,
    createdAt,
    updatedAt,
    isSynced,
    scores,
    productType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('company')) {
      context.handle(
        _companyMeta,
        company.isAcceptableOrUnknown(data['company']!, _companyMeta),
      );
    } else if (isInserting) {
      context.missing(_companyMeta);
    }
    if (data.containsKey('booth')) {
      context.handle(
        _boothMeta,
        booth.isAcceptableOrUnknown(data['booth']!, _boothMeta),
      );
    } else if (isInserting) {
      context.missing(_boothMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('we_chat_i_d')) {
      context.handle(
        _weChatIDMeta,
        weChatID.isAcceptableOrUnknown(data['we_chat_i_d']!, _weChatIDMeta),
      );
    }
    if (data.containsKey('whats_app_number')) {
      context.handle(
        _whatsAppNumberMeta,
        whatsAppNumber.isAcceptableOrUnknown(
          data['whats_app_number']!,
          _whatsAppNumberMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('industry')) {
      context.handle(
        _industryMeta,
        industry.isAcceptableOrUnknown(data['industry']!, _industryMeta),
      );
    }
    if (data.containsKey('interest_level')) {
      context.handle(
        _interestLevelMeta,
        interestLevel.isAcceptableOrUnknown(
          data['interest_level']!,
          _interestLevelMeta,
        ),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('image_local_path')) {
      context.handle(
        _imageLocalPathMeta,
        imageLocalPath.isAcceptableOrUnknown(
          data['image_local_path']!,
          _imageLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('product_type')) {
      context.handle(
        _productTypeMeta,
        productType.isAcceptableOrUnknown(
          data['product_type']!,
          _productTypeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      company: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company'],
      )!,
      booth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}booth'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      weChatID: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}we_chat_i_d'],
      ),
      whatsAppNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}whats_app_number'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      industry: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}industry'],
      ),
      interestLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}interest_level'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      imageLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_local_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      scores: $SupplierTable.$converterscoresn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}scores'],
        ),
      ),
      productType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_type'],
      ),
    );
  }

  @override
  $SupplierTable createAlias(String alias) {
    return $SupplierTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $converterscores =
      const StringMapConverter();
  static TypeConverter<Map<String, String>?, String?> $converterscoresn =
      NullAwareTypeConverter.wrap($converterscores);
}

class SupplierData extends DataClass implements Insertable<SupplierData> {
  final int id;
  final String userId;
  final String name;
  final String company;
  final String booth;
  final String? address;
  final String? email;
  final String? phone;
  final String? weChatID;
  final String? whatsAppNumber;
  final String? notes;
  final String? industry;
  final String? interestLevel;
  final String? imageUrl;
  final String? imageLocalPath;
  final String? createdAt;
  final String? updatedAt;
  final bool isSynced;
  final Map<String, String>? scores;
  final String? productType;
  const SupplierData({
    required this.id,
    required this.userId,
    required this.name,
    required this.company,
    required this.booth,
    this.address,
    this.email,
    this.phone,
    this.weChatID,
    this.whatsAppNumber,
    this.notes,
    this.industry,
    this.interestLevel,
    this.imageUrl,
    this.imageLocalPath,
    this.createdAt,
    this.updatedAt,
    required this.isSynced,
    this.scores,
    this.productType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    map['company'] = Variable<String>(company);
    map['booth'] = Variable<String>(booth);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || weChatID != null) {
      map['we_chat_i_d'] = Variable<String>(weChatID);
    }
    if (!nullToAbsent || whatsAppNumber != null) {
      map['whats_app_number'] = Variable<String>(whatsAppNumber);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || industry != null) {
      map['industry'] = Variable<String>(industry);
    }
    if (!nullToAbsent || interestLevel != null) {
      map['interest_level'] = Variable<String>(interestLevel);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || imageLocalPath != null) {
      map['image_local_path'] = Variable<String>(imageLocalPath);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || scores != null) {
      map['scores'] = Variable<String>(
        $SupplierTable.$converterscoresn.toSql(scores),
      );
    }
    if (!nullToAbsent || productType != null) {
      map['product_type'] = Variable<String>(productType);
    }
    return map;
  }

  SupplierCompanion toCompanion(bool nullToAbsent) {
    return SupplierCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      company: Value(company),
      booth: Value(booth),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      weChatID: weChatID == null && nullToAbsent
          ? const Value.absent()
          : Value(weChatID),
      whatsAppNumber: whatsAppNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsAppNumber),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      industry: industry == null && nullToAbsent
          ? const Value.absent()
          : Value(industry),
      interestLevel: interestLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(interestLevel),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      imageLocalPath: imageLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(imageLocalPath),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isSynced: Value(isSynced),
      scores: scores == null && nullToAbsent
          ? const Value.absent()
          : Value(scores),
      productType: productType == null && nullToAbsent
          ? const Value.absent()
          : Value(productType),
    );
  }

  factory SupplierData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      company: serializer.fromJson<String>(json['company']),
      booth: serializer.fromJson<String>(json['booth']),
      address: serializer.fromJson<String?>(json['address']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      weChatID: serializer.fromJson<String?>(json['weChatID']),
      whatsAppNumber: serializer.fromJson<String?>(json['whatsAppNumber']),
      notes: serializer.fromJson<String?>(json['notes']),
      industry: serializer.fromJson<String?>(json['industry']),
      interestLevel: serializer.fromJson<String?>(json['interestLevel']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      imageLocalPath: serializer.fromJson<String?>(json['imageLocalPath']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      scores: serializer.fromJson<Map<String, String>?>(json['scores']),
      productType: serializer.fromJson<String?>(json['productType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'company': serializer.toJson<String>(company),
      'booth': serializer.toJson<String>(booth),
      'address': serializer.toJson<String?>(address),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'weChatID': serializer.toJson<String?>(weChatID),
      'whatsAppNumber': serializer.toJson<String?>(whatsAppNumber),
      'notes': serializer.toJson<String?>(notes),
      'industry': serializer.toJson<String?>(industry),
      'interestLevel': serializer.toJson<String?>(interestLevel),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'imageLocalPath': serializer.toJson<String?>(imageLocalPath),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'scores': serializer.toJson<Map<String, String>?>(scores),
      'productType': serializer.toJson<String?>(productType),
    };
  }

  SupplierData copyWith({
    int? id,
    String? userId,
    String? name,
    String? company,
    String? booth,
    Value<String?> address = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> weChatID = const Value.absent(),
    Value<String?> whatsAppNumber = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> industry = const Value.absent(),
    Value<String?> interestLevel = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> imageLocalPath = const Value.absent(),
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    bool? isSynced,
    Value<Map<String, String>?> scores = const Value.absent(),
    Value<String?> productType = const Value.absent(),
  }) => SupplierData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    company: company ?? this.company,
    booth: booth ?? this.booth,
    address: address.present ? address.value : this.address,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    weChatID: weChatID.present ? weChatID.value : this.weChatID,
    whatsAppNumber: whatsAppNumber.present
        ? whatsAppNumber.value
        : this.whatsAppNumber,
    notes: notes.present ? notes.value : this.notes,
    industry: industry.present ? industry.value : this.industry,
    interestLevel: interestLevel.present
        ? interestLevel.value
        : this.interestLevel,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    imageLocalPath: imageLocalPath.present
        ? imageLocalPath.value
        : this.imageLocalPath,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
    scores: scores.present ? scores.value : this.scores,
    productType: productType.present ? productType.value : this.productType,
  );
  SupplierData copyWithCompanion(SupplierCompanion data) {
    return SupplierData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      company: data.company.present ? data.company.value : this.company,
      booth: data.booth.present ? data.booth.value : this.booth,
      address: data.address.present ? data.address.value : this.address,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      weChatID: data.weChatID.present ? data.weChatID.value : this.weChatID,
      whatsAppNumber: data.whatsAppNumber.present
          ? data.whatsAppNumber.value
          : this.whatsAppNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
      industry: data.industry.present ? data.industry.value : this.industry,
      interestLevel: data.interestLevel.present
          ? data.interestLevel.value
          : this.interestLevel,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      imageLocalPath: data.imageLocalPath.present
          ? data.imageLocalPath.value
          : this.imageLocalPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      scores: data.scores.present ? data.scores.value : this.scores,
      productType: data.productType.present
          ? data.productType.value
          : this.productType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('company: $company, ')
          ..write('booth: $booth, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('weChatID: $weChatID, ')
          ..write('whatsAppNumber: $whatsAppNumber, ')
          ..write('notes: $notes, ')
          ..write('industry: $industry, ')
          ..write('interestLevel: $interestLevel, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('imageLocalPath: $imageLocalPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('scores: $scores, ')
          ..write('productType: $productType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    company,
    booth,
    address,
    email,
    phone,
    weChatID,
    whatsAppNumber,
    notes,
    industry,
    interestLevel,
    imageUrl,
    imageLocalPath,
    createdAt,
    updatedAt,
    isSynced,
    scores,
    productType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.company == this.company &&
          other.booth == this.booth &&
          other.address == this.address &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.weChatID == this.weChatID &&
          other.whatsAppNumber == this.whatsAppNumber &&
          other.notes == this.notes &&
          other.industry == this.industry &&
          other.interestLevel == this.interestLevel &&
          other.imageUrl == this.imageUrl &&
          other.imageLocalPath == this.imageLocalPath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.scores == this.scores &&
          other.productType == this.productType);
}

class SupplierCompanion extends UpdateCompanion<SupplierData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String> company;
  final Value<String> booth;
  final Value<String?> address;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> weChatID;
  final Value<String?> whatsAppNumber;
  final Value<String?> notes;
  final Value<String?> industry;
  final Value<String?> interestLevel;
  final Value<String?> imageUrl;
  final Value<String?> imageLocalPath;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<bool> isSynced;
  final Value<Map<String, String>?> scores;
  final Value<String?> productType;
  const SupplierCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.company = const Value.absent(),
    this.booth = const Value.absent(),
    this.address = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.weChatID = const Value.absent(),
    this.whatsAppNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.industry = const Value.absent(),
    this.interestLevel = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.imageLocalPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.scores = const Value.absent(),
    this.productType = const Value.absent(),
  });
  SupplierCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String name,
    required String company,
    required String booth,
    this.address = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.weChatID = const Value.absent(),
    this.whatsAppNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.industry = const Value.absent(),
    this.interestLevel = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.imageLocalPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.scores = const Value.absent(),
    this.productType = const Value.absent(),
  }) : userId = Value(userId),
       name = Value(name),
       company = Value(company),
       booth = Value(booth);
  static Insertable<SupplierData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? company,
    Expression<String>? booth,
    Expression<String>? address,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? weChatID,
    Expression<String>? whatsAppNumber,
    Expression<String>? notes,
    Expression<String>? industry,
    Expression<String>? interestLevel,
    Expression<String>? imageUrl,
    Expression<String>? imageLocalPath,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<bool>? isSynced,
    Expression<String>? scores,
    Expression<String>? productType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (company != null) 'company': company,
      if (booth != null) 'booth': booth,
      if (address != null) 'address': address,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (weChatID != null) 'we_chat_i_d': weChatID,
      if (whatsAppNumber != null) 'whats_app_number': whatsAppNumber,
      if (notes != null) 'notes': notes,
      if (industry != null) 'industry': industry,
      if (interestLevel != null) 'interest_level': interestLevel,
      if (imageUrl != null) 'image_url': imageUrl,
      if (imageLocalPath != null) 'image_local_path': imageLocalPath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (scores != null) 'scores': scores,
      if (productType != null) 'product_type': productType,
    });
  }

  SupplierCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? name,
    Value<String>? company,
    Value<String>? booth,
    Value<String?>? address,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? weChatID,
    Value<String?>? whatsAppNumber,
    Value<String?>? notes,
    Value<String?>? industry,
    Value<String?>? interestLevel,
    Value<String?>? imageUrl,
    Value<String?>? imageLocalPath,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
    Value<bool>? isSynced,
    Value<Map<String, String>?>? scores,
    Value<String?>? productType,
  }) {
    return SupplierCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      company: company ?? this.company,
      booth: booth ?? this.booth,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      weChatID: weChatID ?? this.weChatID,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      notes: notes ?? this.notes,
      industry: industry ?? this.industry,
      interestLevel: interestLevel ?? this.interestLevel,
      imageUrl: imageUrl ?? this.imageUrl,
      imageLocalPath: imageLocalPath ?? this.imageLocalPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      scores: scores ?? this.scores,
      productType: productType ?? this.productType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (booth.present) {
      map['booth'] = Variable<String>(booth.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (weChatID.present) {
      map['we_chat_i_d'] = Variable<String>(weChatID.value);
    }
    if (whatsAppNumber.present) {
      map['whats_app_number'] = Variable<String>(whatsAppNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (industry.present) {
      map['industry'] = Variable<String>(industry.value);
    }
    if (interestLevel.present) {
      map['interest_level'] = Variable<String>(interestLevel.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (imageLocalPath.present) {
      map['image_local_path'] = Variable<String>(imageLocalPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (scores.present) {
      map['scores'] = Variable<String>(
        $SupplierTable.$converterscoresn.toSql(scores.value),
      );
    }
    if (productType.present) {
      map['product_type'] = Variable<String>(productType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('company: $company, ')
          ..write('booth: $booth, ')
          ..write('address: $address, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('weChatID: $weChatID, ')
          ..write('whatsAppNumber: $whatsAppNumber, ')
          ..write('notes: $notes, ')
          ..write('industry: $industry, ')
          ..write('interestLevel: $interestLevel, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('imageLocalPath: $imageLocalPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('scores: $scores, ')
          ..write('productType: $productType')
          ..write(')'))
        .toString();
  }
}

class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specificationsMeta = const VerificationMeta(
    'specifications',
  );
  @override
  late final GeneratedColumn<String> specifications = GeneratedColumn<String>(
    'specifications',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _leadTimeDaysMeta = const VerificationMeta(
    'leadTimeDays',
  );
  @override
  late final GeneratedColumn<int> leadTimeDays = GeneratedColumn<int>(
    'lead_time_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES supplier(id) ON DELETE CASCADE NOT NULL',
  );
  static const VerificationMeta _moqMeta = const VerificationMeta('moq');
  @override
  late final GeneratedColumn<int> moq = GeneratedColumn<int>(
    'moq',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moqUnitMeta = const VerificationMeta(
    'moqUnit',
  );
  @override
  late final GeneratedColumn<String> moqUnit = GeneratedColumn<String>(
    'moq_unit',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  imageLocalPaths = GeneratedColumn<String>(
    'image_local_paths',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<String>?>($ProductTableTable.$converterimageLocalPathsn);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> imageUrls =
      GeneratedColumn<String>(
        'image_urls',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($ProductTableTable.$converterimageUrlsn);
  static const VerificationMeta _certificationsMeta = const VerificationMeta(
    'certifications',
  );
  @override
  late final GeneratedColumn<String> certifications = GeneratedColumn<String>(
    'certifications',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    price,
    specifications,
    notes,
    createdAt,
    category,
    leadTimeDays,
    supplierId,
    moq,
    moqUnit,
    imageLocalPaths,
    imageUrls,
    certifications,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('specifications')) {
      context.handle(
        _specificationsMeta,
        specifications.isAcceptableOrUnknown(
          data['specifications']!,
          _specificationsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('lead_time_days')) {
      context.handle(
        _leadTimeDaysMeta,
        leadTimeDays.isAcceptableOrUnknown(
          data['lead_time_days']!,
          _leadTimeDaysMeta,
        ),
      );
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    }
    if (data.containsKey('moq')) {
      context.handle(
        _moqMeta,
        moq.isAcceptableOrUnknown(data['moq']!, _moqMeta),
      );
    }
    if (data.containsKey('moq_unit')) {
      context.handle(
        _moqUnitMeta,
        moqUnit.isAcceptableOrUnknown(data['moq_unit']!, _moqUnitMeta),
      );
    }
    if (data.containsKey('certifications')) {
      context.handle(
        _certificationsMeta,
        certifications.isAcceptableOrUnknown(
          data['certifications']!,
          _certificationsMeta,
        ),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      specifications: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specifications'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      leadTimeDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lead_time_days'],
      ),
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      ),
      moq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}moq'],
      ),
      moqUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}moq_unit'],
      ),
      imageLocalPaths: $ProductTableTable.$converterimageLocalPathsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}image_local_paths'],
        ),
      ),
      imageUrls: $ProductTableTable.$converterimageUrlsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}image_urls'],
        ),
      ),
      certifications: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}certifications'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterimageLocalPaths =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterimageLocalPathsn =
      NullAwareTypeConverter.wrap($converterimageLocalPaths);
  static TypeConverter<List<String>, String> $converterimageUrls =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterimageUrlsn =
      NullAwareTypeConverter.wrap($converterimageUrls);
}

class ProductTableData extends DataClass
    implements Insertable<ProductTableData> {
  final int id;
  final String name;
  final double price;
  final String? specifications;
  final String? notes;
  final DateTime createdAt;
  final String? category;
  final int? leadTimeDays;
  final int? supplierId;
  final int? moq;
  final String? moqUnit;
  final List<String>? imageLocalPaths;
  final List<String>? imageUrls;
  final String? certifications;
  final bool isSynced;
  const ProductTableData({
    required this.id,
    required this.name,
    required this.price,
    this.specifications,
    this.notes,
    required this.createdAt,
    this.category,
    this.leadTimeDays,
    this.supplierId,
    this.moq,
    this.moqUnit,
    this.imageLocalPaths,
    this.imageUrls,
    this.certifications,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || specifications != null) {
      map['specifications'] = Variable<String>(specifications);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || leadTimeDays != null) {
      map['lead_time_days'] = Variable<int>(leadTimeDays);
    }
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<int>(supplierId);
    }
    if (!nullToAbsent || moq != null) {
      map['moq'] = Variable<int>(moq);
    }
    if (!nullToAbsent || moqUnit != null) {
      map['moq_unit'] = Variable<String>(moqUnit);
    }
    if (!nullToAbsent || imageLocalPaths != null) {
      map['image_local_paths'] = Variable<String>(
        $ProductTableTable.$converterimageLocalPathsn.toSql(imageLocalPaths),
      );
    }
    if (!nullToAbsent || imageUrls != null) {
      map['image_urls'] = Variable<String>(
        $ProductTableTable.$converterimageUrlsn.toSql(imageUrls),
      );
    }
    if (!nullToAbsent || certifications != null) {
      map['certifications'] = Variable<String>(certifications);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ProductTableCompanion toCompanion(bool nullToAbsent) {
    return ProductTableCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      specifications: specifications == null && nullToAbsent
          ? const Value.absent()
          : Value(specifications),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      leadTimeDays: leadTimeDays == null && nullToAbsent
          ? const Value.absent()
          : Value(leadTimeDays),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      moq: moq == null && nullToAbsent ? const Value.absent() : Value(moq),
      moqUnit: moqUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(moqUnit),
      imageLocalPaths: imageLocalPaths == null && nullToAbsent
          ? const Value.absent()
          : Value(imageLocalPaths),
      imageUrls: imageUrls == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrls),
      certifications: certifications == null && nullToAbsent
          ? const Value.absent()
          : Value(certifications),
      isSynced: Value(isSynced),
    );
  }

  factory ProductTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      specifications: serializer.fromJson<String?>(json['specifications']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      category: serializer.fromJson<String?>(json['category']),
      leadTimeDays: serializer.fromJson<int?>(json['leadTimeDays']),
      supplierId: serializer.fromJson<int?>(json['supplierId']),
      moq: serializer.fromJson<int?>(json['moq']),
      moqUnit: serializer.fromJson<String?>(json['moqUnit']),
      imageLocalPaths: serializer.fromJson<List<String>?>(
        json['imageLocalPaths'],
      ),
      imageUrls: serializer.fromJson<List<String>?>(json['imageUrls']),
      certifications: serializer.fromJson<String?>(json['certifications']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'specifications': serializer.toJson<String?>(specifications),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'category': serializer.toJson<String?>(category),
      'leadTimeDays': serializer.toJson<int?>(leadTimeDays),
      'supplierId': serializer.toJson<int?>(supplierId),
      'moq': serializer.toJson<int?>(moq),
      'moqUnit': serializer.toJson<String?>(moqUnit),
      'imageLocalPaths': serializer.toJson<List<String>?>(imageLocalPaths),
      'imageUrls': serializer.toJson<List<String>?>(imageUrls),
      'certifications': serializer.toJson<String?>(certifications),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  ProductTableData copyWith({
    int? id,
    String? name,
    double? price,
    Value<String?> specifications = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    Value<String?> category = const Value.absent(),
    Value<int?> leadTimeDays = const Value.absent(),
    Value<int?> supplierId = const Value.absent(),
    Value<int?> moq = const Value.absent(),
    Value<String?> moqUnit = const Value.absent(),
    Value<List<String>?> imageLocalPaths = const Value.absent(),
    Value<List<String>?> imageUrls = const Value.absent(),
    Value<String?> certifications = const Value.absent(),
    bool? isSynced,
  }) => ProductTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    specifications: specifications.present
        ? specifications.value
        : this.specifications,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    category: category.present ? category.value : this.category,
    leadTimeDays: leadTimeDays.present ? leadTimeDays.value : this.leadTimeDays,
    supplierId: supplierId.present ? supplierId.value : this.supplierId,
    moq: moq.present ? moq.value : this.moq,
    moqUnit: moqUnit.present ? moqUnit.value : this.moqUnit,
    imageLocalPaths: imageLocalPaths.present
        ? imageLocalPaths.value
        : this.imageLocalPaths,
    imageUrls: imageUrls.present ? imageUrls.value : this.imageUrls,
    certifications: certifications.present
        ? certifications.value
        : this.certifications,
    isSynced: isSynced ?? this.isSynced,
  );
  ProductTableData copyWithCompanion(ProductTableCompanion data) {
    return ProductTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      specifications: data.specifications.present
          ? data.specifications.value
          : this.specifications,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      category: data.category.present ? data.category.value : this.category,
      leadTimeDays: data.leadTimeDays.present
          ? data.leadTimeDays.value
          : this.leadTimeDays,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      moq: data.moq.present ? data.moq.value : this.moq,
      moqUnit: data.moqUnit.present ? data.moqUnit.value : this.moqUnit,
      imageLocalPaths: data.imageLocalPaths.present
          ? data.imageLocalPaths.value
          : this.imageLocalPaths,
      imageUrls: data.imageUrls.present ? data.imageUrls.value : this.imageUrls,
      certifications: data.certifications.present
          ? data.certifications.value
          : this.certifications,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('specifications: $specifications, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('category: $category, ')
          ..write('leadTimeDays: $leadTimeDays, ')
          ..write('supplierId: $supplierId, ')
          ..write('moq: $moq, ')
          ..write('moqUnit: $moqUnit, ')
          ..write('imageLocalPaths: $imageLocalPaths, ')
          ..write('imageUrls: $imageUrls, ')
          ..write('certifications: $certifications, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    price,
    specifications,
    notes,
    createdAt,
    category,
    leadTimeDays,
    supplierId,
    moq,
    moqUnit,
    imageLocalPaths,
    imageUrls,
    certifications,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.specifications == this.specifications &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.category == this.category &&
          other.leadTimeDays == this.leadTimeDays &&
          other.supplierId == this.supplierId &&
          other.moq == this.moq &&
          other.moqUnit == this.moqUnit &&
          other.imageLocalPaths == this.imageLocalPaths &&
          other.imageUrls == this.imageUrls &&
          other.certifications == this.certifications &&
          other.isSynced == this.isSynced);
}

class ProductTableCompanion extends UpdateCompanion<ProductTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> price;
  final Value<String?> specifications;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<String?> category;
  final Value<int?> leadTimeDays;
  final Value<int?> supplierId;
  final Value<int?> moq;
  final Value<String?> moqUnit;
  final Value<List<String>?> imageLocalPaths;
  final Value<List<String>?> imageUrls;
  final Value<String?> certifications;
  final Value<bool> isSynced;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.specifications = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.category = const Value.absent(),
    this.leadTimeDays = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.moq = const Value.absent(),
    this.moqUnit = const Value.absent(),
    this.imageLocalPaths = const Value.absent(),
    this.imageUrls = const Value.absent(),
    this.certifications = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double price,
    this.specifications = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.category = const Value.absent(),
    this.leadTimeDays = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.moq = const Value.absent(),
    this.moqUnit = const Value.absent(),
    this.imageLocalPaths = const Value.absent(),
    this.imageUrls = const Value.absent(),
    this.certifications = const Value.absent(),
    this.isSynced = const Value.absent(),
  }) : name = Value(name),
       price = Value(price);
  static Insertable<ProductTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<String>? specifications,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<String>? category,
    Expression<int>? leadTimeDays,
    Expression<int>? supplierId,
    Expression<int>? moq,
    Expression<String>? moqUnit,
    Expression<String>? imageLocalPaths,
    Expression<String>? imageUrls,
    Expression<String>? certifications,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (specifications != null) 'specifications': specifications,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (category != null) 'category': category,
      if (leadTimeDays != null) 'lead_time_days': leadTimeDays,
      if (supplierId != null) 'supplier_id': supplierId,
      if (moq != null) 'moq': moq,
      if (moqUnit != null) 'moq_unit': moqUnit,
      if (imageLocalPaths != null) 'image_local_paths': imageLocalPaths,
      if (imageUrls != null) 'image_urls': imageUrls,
      if (certifications != null) 'certifications': certifications,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  ProductTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? price,
    Value<String?>? specifications,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<String?>? category,
    Value<int?>? leadTimeDays,
    Value<int?>? supplierId,
    Value<int?>? moq,
    Value<String?>? moqUnit,
    Value<List<String>?>? imageLocalPaths,
    Value<List<String>?>? imageUrls,
    Value<String?>? certifications,
    Value<bool>? isSynced,
  }) {
    return ProductTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      specifications: specifications ?? this.specifications,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      category: category ?? this.category,
      leadTimeDays: leadTimeDays ?? this.leadTimeDays,
      supplierId: supplierId ?? this.supplierId,
      moq: moq ?? this.moq,
      moqUnit: moqUnit ?? this.moqUnit,
      imageLocalPaths: imageLocalPaths ?? this.imageLocalPaths,
      imageUrls: imageUrls ?? this.imageUrls,
      certifications: certifications ?? this.certifications,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (specifications.present) {
      map['specifications'] = Variable<String>(specifications.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (leadTimeDays.present) {
      map['lead_time_days'] = Variable<int>(leadTimeDays.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (moq.present) {
      map['moq'] = Variable<int>(moq.value);
    }
    if (moqUnit.present) {
      map['moq_unit'] = Variable<String>(moqUnit.value);
    }
    if (imageLocalPaths.present) {
      map['image_local_paths'] = Variable<String>(
        $ProductTableTable.$converterimageLocalPathsn.toSql(
          imageLocalPaths.value,
        ),
      );
    }
    if (imageUrls.present) {
      map['image_urls'] = Variable<String>(
        $ProductTableTable.$converterimageUrlsn.toSql(imageUrls.value),
      );
    }
    if (certifications.present) {
      map['certifications'] = Variable<String>(certifications.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('specifications: $specifications, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('category: $category, ')
          ..write('leadTimeDays: $leadTimeDays, ')
          ..write('supplierId: $supplierId, ')
          ..write('moq: $moq, ')
          ..write('moqUnit: $moqUnit, ')
          ..write('imageLocalPaths: $imageLocalPaths, ')
          ..write('imageUrls: $imageUrls, ')
          ..write('certifications: $certifications, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $NotesTableTable extends NotesTable
    with TableInfo<$NotesTableTable, NotesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 10000,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES supplier(id) ON DELETE CASCADE NOT NULL',
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    content,
    createdAt,
    supplierId,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $NotesTableTable createAlias(String alias) {
    return $NotesTableTable(attachedDatabase, alias);
  }
}

class NotesTableData extends DataClass implements Insertable<NotesTableData> {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final int? supplierId;
  final bool isSynced;
  const NotesTableData({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.supplierId,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<int>(supplierId);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  NotesTableCompanion toCompanion(bool nullToAbsent) {
    return NotesTableCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      createdAt: Value(createdAt),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      isSynced: Value(isSynced),
    );
  }

  factory NotesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotesTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      supplierId: serializer.fromJson<int?>(json['supplierId']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'supplierId': serializer.toJson<int?>(supplierId),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  NotesTableData copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createdAt,
    Value<int?> supplierId = const Value.absent(),
    bool? isSynced,
  }) => NotesTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    supplierId: supplierId.present ? supplierId.value : this.supplierId,
    isSynced: isSynced ?? this.isSynced,
  );
  NotesTableData copyWithCompanion(NotesTableCompanion data) {
    return NotesTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotesTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('supplierId: $supplierId, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, content, createdAt, supplierId, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotesTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.supplierId == this.supplierId &&
          other.isSynced == this.isSynced);
}

class NotesTableCompanion extends UpdateCompanion<NotesTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<int?> supplierId;
  final Value<bool> isSynced;
  const NotesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  NotesTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.createdAt = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.isSynced = const Value.absent(),
  }) : title = Value(title),
       content = Value(content);
  static Insertable<NotesTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<int>? supplierId,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (supplierId != null) 'supplier_id': supplierId,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  NotesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<int?>? supplierId,
    Value<bool>? isSynced,
  }) {
    return NotesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      supplierId: supplierId ?? this.supplierId,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('supplierId: $supplierId, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $DocumentTableTable extends DocumentTable
    with TableInfo<$DocumentTableTable, DocumentTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'REFERENCES supplier(id) ON DELETE CASCADE NOT NULL',
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    localPath,
    url,
    type,
    createdAt,
    supplierId,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $DocumentTableTable createAlias(String alias) {
    return $DocumentTableTable(attachedDatabase, alias);
  }
}

class DocumentTableData extends DataClass
    implements Insertable<DocumentTableData> {
  final int id;
  final String title;
  final String localPath;
  final String? url;
  final String type;
  final DateTime createdAt;
  final int? supplierId;
  final bool isSynced;
  const DocumentTableData({
    required this.id,
    required this.title,
    required this.localPath,
    this.url,
    required this.type,
    required this.createdAt,
    this.supplierId,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['local_path'] = Variable<String>(localPath);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    map['type'] = Variable<String>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<int>(supplierId);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  DocumentTableCompanion toCompanion(bool nullToAbsent) {
    return DocumentTableCompanion(
      id: Value(id),
      title: Value(title),
      localPath: Value(localPath),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      type: Value(type),
      createdAt: Value(createdAt),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      isSynced: Value(isSynced),
    );
  }

  factory DocumentTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      localPath: serializer.fromJson<String>(json['localPath']),
      url: serializer.fromJson<String?>(json['url']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      supplierId: serializer.fromJson<int?>(json['supplierId']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'localPath': serializer.toJson<String>(localPath),
      'url': serializer.toJson<String?>(url),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'supplierId': serializer.toJson<int?>(supplierId),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  DocumentTableData copyWith({
    int? id,
    String? title,
    String? localPath,
    Value<String?> url = const Value.absent(),
    String? type,
    DateTime? createdAt,
    Value<int?> supplierId = const Value.absent(),
    bool? isSynced,
  }) => DocumentTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    localPath: localPath ?? this.localPath,
    url: url.present ? url.value : this.url,
    type: type ?? this.type,
    createdAt: createdAt ?? this.createdAt,
    supplierId: supplierId.present ? supplierId.value : this.supplierId,
    isSynced: isSynced ?? this.isSynced,
  );
  DocumentTableData copyWithCompanion(DocumentTableCompanion data) {
    return DocumentTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      url: data.url.present ? data.url.value : this.url,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('localPath: $localPath, ')
          ..write('url: $url, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('supplierId: $supplierId, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    localPath,
    url,
    type,
    createdAt,
    supplierId,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.localPath == this.localPath &&
          other.url == this.url &&
          other.type == this.type &&
          other.createdAt == this.createdAt &&
          other.supplierId == this.supplierId &&
          other.isSynced == this.isSynced);
}

class DocumentTableCompanion extends UpdateCompanion<DocumentTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> localPath;
  final Value<String?> url;
  final Value<String> type;
  final Value<DateTime> createdAt;
  final Value<int?> supplierId;
  final Value<bool> isSynced;
  const DocumentTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.localPath = const Value.absent(),
    this.url = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  DocumentTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String localPath,
    this.url = const Value.absent(),
    required String type,
    this.createdAt = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.isSynced = const Value.absent(),
  }) : title = Value(title),
       localPath = Value(localPath),
       type = Value(type);
  static Insertable<DocumentTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? localPath,
    Expression<String>? url,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
    Expression<int>? supplierId,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (localPath != null) 'local_path': localPath,
      if (url != null) 'url': url,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (supplierId != null) 'supplier_id': supplierId,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  DocumentTableCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? localPath,
    Value<String?>? url,
    Value<String>? type,
    Value<DateTime>? createdAt,
    Value<int?>? supplierId,
    Value<bool>? isSynced,
  }) {
    return DocumentTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      localPath: localPath ?? this.localPath,
      url: url ?? this.url,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      supplierId: supplierId ?? this.supplierId,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('localPath: $localPath, ')
          ..write('url: $url, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('supplierId: $supplierId, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SupplierTable supplier = $SupplierTable(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $NotesTableTable notesTable = $NotesTableTable(this);
  late final $DocumentTableTable documentTable = $DocumentTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    supplier,
    productTable,
    notesTable,
    documentTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'supplier',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('product_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'supplier',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('notes_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'supplier',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('document_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$SupplierTableCreateCompanionBuilder =
    SupplierCompanion Function({
      Value<int> id,
      required String userId,
      required String name,
      required String company,
      required String booth,
      Value<String?> address,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> weChatID,
      Value<String?> whatsAppNumber,
      Value<String?> notes,
      Value<String?> industry,
      Value<String?> interestLevel,
      Value<String?> imageUrl,
      Value<String?> imageLocalPath,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<bool> isSynced,
      Value<Map<String, String>?> scores,
      Value<String?> productType,
    });
typedef $$SupplierTableUpdateCompanionBuilder =
    SupplierCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> name,
      Value<String> company,
      Value<String> booth,
      Value<String?> address,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> weChatID,
      Value<String?> whatsAppNumber,
      Value<String?> notes,
      Value<String?> industry,
      Value<String?> interestLevel,
      Value<String?> imageUrl,
      Value<String?> imageLocalPath,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<bool> isSynced,
      Value<Map<String, String>?> scores,
      Value<String?> productType,
    });

final class $$SupplierTableReferences
    extends BaseReferences<_$AppDatabase, $SupplierTable, SupplierData> {
  $$SupplierTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductTableTable, List<ProductTableData>>
  _productTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productTable,
    aliasName: $_aliasNameGenerator(db.supplier.id, db.productTable.supplierId),
  );

  $$ProductTableTableProcessedTableManager get productTableRefs {
    final manager = $$ProductTableTableTableManager(
      $_db,
      $_db.productTable,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_productTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NotesTableTable, List<NotesTableData>>
  _notesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.notesTable,
    aliasName: $_aliasNameGenerator(db.supplier.id, db.notesTable.supplierId),
  );

  $$NotesTableTableProcessedTableManager get notesTableRefs {
    final manager = $$NotesTableTableTableManager(
      $_db,
      $_db.notesTable,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_notesTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DocumentTableTable, List<DocumentTableData>>
  _documentTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.documentTable,
    aliasName: $_aliasNameGenerator(
      db.supplier.id,
      db.documentTable.supplierId,
    ),
  );

  $$DocumentTableTableProcessedTableManager get documentTableRefs {
    final manager = $$DocumentTableTableTableManager(
      $_db,
      $_db.documentTable,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_documentTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SupplierTableFilterComposer
    extends Composer<_$AppDatabase, $SupplierTable> {
  $$SupplierTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get booth => $composableBuilder(
    column: $table.booth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weChatID => $composableBuilder(
    column: $table.weChatID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatsAppNumber => $composableBuilder(
    column: $table.whatsAppNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get industry => $composableBuilder(
    column: $table.industry,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interestLevel => $composableBuilder(
    column: $table.interestLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>?,
    Map<String, String>,
    String
  >
  get scores => $composableBuilder(
    column: $table.scores,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productTableRefs(
    Expression<bool> Function($$ProductTableTableFilterComposer f) f,
  ) {
    final $$ProductTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTable,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableTableFilterComposer(
            $db: $db,
            $table: $db.productTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notesTableRefs(
    Expression<bool> Function($$NotesTableTableFilterComposer f) f,
  ) {
    final $$NotesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notesTable,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableTableFilterComposer(
            $db: $db,
            $table: $db.notesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> documentTableRefs(
    Expression<bool> Function($$DocumentTableTableFilterComposer f) f,
  ) {
    final $$DocumentTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documentTable,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentTableTableFilterComposer(
            $db: $db,
            $table: $db.documentTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SupplierTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplierTable> {
  $$SupplierTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get booth => $composableBuilder(
    column: $table.booth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weChatID => $composableBuilder(
    column: $table.weChatID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsAppNumber => $composableBuilder(
    column: $table.whatsAppNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get industry => $composableBuilder(
    column: $table.industry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interestLevel => $composableBuilder(
    column: $table.interestLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scores => $composableBuilder(
    column: $table.scores,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SupplierTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplierTable> {
  $$SupplierTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumn<String> get booth =>
      $composableBuilder(column: $table.booth, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get weChatID =>
      $composableBuilder(column: $table.weChatID, builder: (column) => column);

  GeneratedColumn<String> get whatsAppNumber => $composableBuilder(
    column: $table.whatsAppNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get industry =>
      $composableBuilder(column: $table.industry, builder: (column) => column);

  GeneratedColumn<String> get interestLevel => $composableBuilder(
    column: $table.interestLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get imageLocalPath => $composableBuilder(
    column: $table.imageLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>?, String> get scores =>
      $composableBuilder(column: $table.scores, builder: (column) => column);

  GeneratedColumn<String> get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => column,
  );

  Expression<T> productTableRefs<T extends Object>(
    Expression<T> Function($$ProductTableTableAnnotationComposer a) f,
  ) {
    final $$ProductTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTable,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableTableAnnotationComposer(
            $db: $db,
            $table: $db.productTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notesTableRefs<T extends Object>(
    Expression<T> Function($$NotesTableTableAnnotationComposer a) f,
  ) {
    final $$NotesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notesTable,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.notesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> documentTableRefs<T extends Object>(
    Expression<T> Function($$DocumentTableTableAnnotationComposer a) f,
  ) {
    final $$DocumentTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documentTable,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentTableTableAnnotationComposer(
            $db: $db,
            $table: $db.documentTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SupplierTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplierTable,
          SupplierData,
          $$SupplierTableFilterComposer,
          $$SupplierTableOrderingComposer,
          $$SupplierTableAnnotationComposer,
          $$SupplierTableCreateCompanionBuilder,
          $$SupplierTableUpdateCompanionBuilder,
          (SupplierData, $$SupplierTableReferences),
          SupplierData,
          PrefetchHooks Function({
            bool productTableRefs,
            bool notesTableRefs,
            bool documentTableRefs,
          })
        > {
  $$SupplierTableTableManager(_$AppDatabase db, $SupplierTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplierTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplierTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> company = const Value.absent(),
                Value<String> booth = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> weChatID = const Value.absent(),
                Value<String?> whatsAppNumber = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> industry = const Value.absent(),
                Value<String?> interestLevel = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> imageLocalPath = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<Map<String, String>?> scores = const Value.absent(),
                Value<String?> productType = const Value.absent(),
              }) => SupplierCompanion(
                id: id,
                userId: userId,
                name: name,
                company: company,
                booth: booth,
                address: address,
                email: email,
                phone: phone,
                weChatID: weChatID,
                whatsAppNumber: whatsAppNumber,
                notes: notes,
                industry: industry,
                interestLevel: interestLevel,
                imageUrl: imageUrl,
                imageLocalPath: imageLocalPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                scores: scores,
                productType: productType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String name,
                required String company,
                required String booth,
                Value<String?> address = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> weChatID = const Value.absent(),
                Value<String?> whatsAppNumber = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> industry = const Value.absent(),
                Value<String?> interestLevel = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> imageLocalPath = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<Map<String, String>?> scores = const Value.absent(),
                Value<String?> productType = const Value.absent(),
              }) => SupplierCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                company: company,
                booth: booth,
                address: address,
                email: email,
                phone: phone,
                weChatID: weChatID,
                whatsAppNumber: whatsAppNumber,
                notes: notes,
                industry: industry,
                interestLevel: interestLevel,
                imageUrl: imageUrl,
                imageLocalPath: imageLocalPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                scores: scores,
                productType: productType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SupplierTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                productTableRefs = false,
                notesTableRefs = false,
                documentTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (productTableRefs) db.productTable,
                    if (notesTableRefs) db.notesTable,
                    if (documentTableRefs) db.documentTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (productTableRefs)
                        await $_getPrefetchedData<
                          SupplierData,
                          $SupplierTable,
                          ProductTableData
                        >(
                          currentTable: table,
                          referencedTable: $$SupplierTableReferences
                              ._productTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SupplierTableReferences(
                                db,
                                table,
                                p0,
                              ).productTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.supplierId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notesTableRefs)
                        await $_getPrefetchedData<
                          SupplierData,
                          $SupplierTable,
                          NotesTableData
                        >(
                          currentTable: table,
                          referencedTable: $$SupplierTableReferences
                              ._notesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SupplierTableReferences(
                                db,
                                table,
                                p0,
                              ).notesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.supplierId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (documentTableRefs)
                        await $_getPrefetchedData<
                          SupplierData,
                          $SupplierTable,
                          DocumentTableData
                        >(
                          currentTable: table,
                          referencedTable: $$SupplierTableReferences
                              ._documentTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SupplierTableReferences(
                                db,
                                table,
                                p0,
                              ).documentTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.supplierId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SupplierTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplierTable,
      SupplierData,
      $$SupplierTableFilterComposer,
      $$SupplierTableOrderingComposer,
      $$SupplierTableAnnotationComposer,
      $$SupplierTableCreateCompanionBuilder,
      $$SupplierTableUpdateCompanionBuilder,
      (SupplierData, $$SupplierTableReferences),
      SupplierData,
      PrefetchHooks Function({
        bool productTableRefs,
        bool notesTableRefs,
        bool documentTableRefs,
      })
    >;
typedef $$ProductTableTableCreateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      required String name,
      required double price,
      Value<String?> specifications,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<String?> category,
      Value<int?> leadTimeDays,
      Value<int?> supplierId,
      Value<int?> moq,
      Value<String?> moqUnit,
      Value<List<String>?> imageLocalPaths,
      Value<List<String>?> imageUrls,
      Value<String?> certifications,
      Value<bool> isSynced,
    });
typedef $$ProductTableTableUpdateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> price,
      Value<String?> specifications,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<String?> category,
      Value<int?> leadTimeDays,
      Value<int?> supplierId,
      Value<int?> moq,
      Value<String?> moqUnit,
      Value<List<String>?> imageLocalPaths,
      Value<List<String>?> imageUrls,
      Value<String?> certifications,
      Value<bool> isSynced,
    });

final class $$ProductTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProductTableTable, ProductTableData> {
  $$ProductTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SupplierTable _supplierIdTable(_$AppDatabase db) =>
      db.supplier.createAlias(
        $_aliasNameGenerator(db.productTable.supplierId, db.supplier.id),
      );

  $$SupplierTableProcessedTableManager? get supplierId {
    final $_column = $_itemColumn<int>('supplier_id');
    if ($_column == null) return null;
    final manager = $$SupplierTableTableManager(
      $_db,
      $_db.supplier,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specifications => $composableBuilder(
    column: $table.specifications,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get leadTimeDays => $composableBuilder(
    column: $table.leadTimeDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moq => $composableBuilder(
    column: $table.moq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moqUnit => $composableBuilder(
    column: $table.moqUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get imageLocalPaths => $composableBuilder(
    column: $table.imageLocalPaths,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get imageUrls => $composableBuilder(
    column: $table.imageUrls,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get certifications => $composableBuilder(
    column: $table.certifications,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$SupplierTableFilterComposer get supplierId {
    final $$SupplierTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableFilterComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specifications => $composableBuilder(
    column: $table.specifications,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get leadTimeDays => $composableBuilder(
    column: $table.leadTimeDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moq => $composableBuilder(
    column: $table.moq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moqUnit => $composableBuilder(
    column: $table.moqUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageLocalPaths => $composableBuilder(
    column: $table.imageLocalPaths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrls => $composableBuilder(
    column: $table.imageUrls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get certifications => $composableBuilder(
    column: $table.certifications,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$SupplierTableOrderingComposer get supplierId {
    final $$SupplierTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableOrderingComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get specifications => $composableBuilder(
    column: $table.specifications,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get leadTimeDays => $composableBuilder(
    column: $table.leadTimeDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get moq =>
      $composableBuilder(column: $table.moq, builder: (column) => column);

  GeneratedColumn<String> get moqUnit =>
      $composableBuilder(column: $table.moqUnit, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get imageLocalPaths =>
      $composableBuilder(
        column: $table.imageLocalPaths,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>?, String> get imageUrls =>
      $composableBuilder(column: $table.imageUrls, builder: (column) => column);

  GeneratedColumn<String> get certifications => $composableBuilder(
    column: $table.certifications,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$SupplierTableAnnotationComposer get supplierId {
    final $$SupplierTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableAnnotationComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTableTable,
          ProductTableData,
          $$ProductTableTableFilterComposer,
          $$ProductTableTableOrderingComposer,
          $$ProductTableTableAnnotationComposer,
          $$ProductTableTableCreateCompanionBuilder,
          $$ProductTableTableUpdateCompanionBuilder,
          (ProductTableData, $$ProductTableTableReferences),
          ProductTableData,
          PrefetchHooks Function({bool supplierId})
        > {
  $$ProductTableTableTableManager(_$AppDatabase db, $ProductTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String?> specifications = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int?> leadTimeDays = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<int?> moq = const Value.absent(),
                Value<String?> moqUnit = const Value.absent(),
                Value<List<String>?> imageLocalPaths = const Value.absent(),
                Value<List<String>?> imageUrls = const Value.absent(),
                Value<String?> certifications = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => ProductTableCompanion(
                id: id,
                name: name,
                price: price,
                specifications: specifications,
                notes: notes,
                createdAt: createdAt,
                category: category,
                leadTimeDays: leadTimeDays,
                supplierId: supplierId,
                moq: moq,
                moqUnit: moqUnit,
                imageLocalPaths: imageLocalPaths,
                imageUrls: imageUrls,
                certifications: certifications,
                isSynced: isSynced,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double price,
                Value<String?> specifications = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int?> leadTimeDays = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<int?> moq = const Value.absent(),
                Value<String?> moqUnit = const Value.absent(),
                Value<List<String>?> imageLocalPaths = const Value.absent(),
                Value<List<String>?> imageUrls = const Value.absent(),
                Value<String?> certifications = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => ProductTableCompanion.insert(
                id: id,
                name: name,
                price: price,
                specifications: specifications,
                notes: notes,
                createdAt: createdAt,
                category: category,
                leadTimeDays: leadTimeDays,
                supplierId: supplierId,
                moq: moq,
                moqUnit: moqUnit,
                imageLocalPaths: imageLocalPaths,
                imageUrls: imageUrls,
                certifications: certifications,
                isSynced: isSynced,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplierId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplierId,
                                referencedTable: $$ProductTableTableReferences
                                    ._supplierIdTable(db),
                                referencedColumn: $$ProductTableTableReferences
                                    ._supplierIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTableTable,
      ProductTableData,
      $$ProductTableTableFilterComposer,
      $$ProductTableTableOrderingComposer,
      $$ProductTableTableAnnotationComposer,
      $$ProductTableTableCreateCompanionBuilder,
      $$ProductTableTableUpdateCompanionBuilder,
      (ProductTableData, $$ProductTableTableReferences),
      ProductTableData,
      PrefetchHooks Function({bool supplierId})
    >;
typedef $$NotesTableTableCreateCompanionBuilder =
    NotesTableCompanion Function({
      Value<int> id,
      required String title,
      required String content,
      Value<DateTime> createdAt,
      Value<int?> supplierId,
      Value<bool> isSynced,
    });
typedef $$NotesTableTableUpdateCompanionBuilder =
    NotesTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<int?> supplierId,
      Value<bool> isSynced,
    });

final class $$NotesTableTableReferences
    extends BaseReferences<_$AppDatabase, $NotesTableTable, NotesTableData> {
  $$NotesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SupplierTable _supplierIdTable(_$AppDatabase db) =>
      db.supplier.createAlias(
        $_aliasNameGenerator(db.notesTable.supplierId, db.supplier.id),
      );

  $$SupplierTableProcessedTableManager? get supplierId {
    final $_column = $_itemColumn<int>('supplier_id');
    if ($_column == null) return null;
    final manager = $$SupplierTableTableManager(
      $_db,
      $_db.supplier,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotesTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$SupplierTableFilterComposer get supplierId {
    final $$SupplierTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableFilterComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$SupplierTableOrderingComposer get supplierId {
    final $$SupplierTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableOrderingComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$SupplierTableAnnotationComposer get supplierId {
    final $$SupplierTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableAnnotationComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotesTableTable,
          NotesTableData,
          $$NotesTableTableFilterComposer,
          $$NotesTableTableOrderingComposer,
          $$NotesTableTableAnnotationComposer,
          $$NotesTableTableCreateCompanionBuilder,
          $$NotesTableTableUpdateCompanionBuilder,
          (NotesTableData, $$NotesTableTableReferences),
          NotesTableData,
          PrefetchHooks Function({bool supplierId})
        > {
  $$NotesTableTableTableManager(_$AppDatabase db, $NotesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => NotesTableCompanion(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
                supplierId: supplierId,
                isSynced: isSynced,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String content,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => NotesTableCompanion.insert(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
                supplierId: supplierId,
                isSynced: isSynced,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplierId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplierId,
                                referencedTable: $$NotesTableTableReferences
                                    ._supplierIdTable(db),
                                referencedColumn: $$NotesTableTableReferences
                                    ._supplierIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotesTableTable,
      NotesTableData,
      $$NotesTableTableFilterComposer,
      $$NotesTableTableOrderingComposer,
      $$NotesTableTableAnnotationComposer,
      $$NotesTableTableCreateCompanionBuilder,
      $$NotesTableTableUpdateCompanionBuilder,
      (NotesTableData, $$NotesTableTableReferences),
      NotesTableData,
      PrefetchHooks Function({bool supplierId})
    >;
typedef $$DocumentTableTableCreateCompanionBuilder =
    DocumentTableCompanion Function({
      Value<int> id,
      required String title,
      required String localPath,
      Value<String?> url,
      required String type,
      Value<DateTime> createdAt,
      Value<int?> supplierId,
      Value<bool> isSynced,
    });
typedef $$DocumentTableTableUpdateCompanionBuilder =
    DocumentTableCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> localPath,
      Value<String?> url,
      Value<String> type,
      Value<DateTime> createdAt,
      Value<int?> supplierId,
      Value<bool> isSynced,
    });

final class $$DocumentTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $DocumentTableTable, DocumentTableData> {
  $$DocumentTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SupplierTable _supplierIdTable(_$AppDatabase db) =>
      db.supplier.createAlias(
        $_aliasNameGenerator(db.documentTable.supplierId, db.supplier.id),
      );

  $$SupplierTableProcessedTableManager? get supplierId {
    final $_column = $_itemColumn<int>('supplier_id');
    if ($_column == null) return null;
    final manager = $$SupplierTableTableManager(
      $_db,
      $_db.supplier,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DocumentTableTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentTableTable> {
  $$DocumentTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$SupplierTableFilterComposer get supplierId {
    final $$SupplierTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableFilterComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentTableTable> {
  $$DocumentTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$SupplierTableOrderingComposer get supplierId {
    final $$SupplierTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableOrderingComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentTableTable> {
  $$DocumentTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$SupplierTableAnnotationComposer get supplierId {
    final $$SupplierTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableAnnotationComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentTableTable,
          DocumentTableData,
          $$DocumentTableTableFilterComposer,
          $$DocumentTableTableOrderingComposer,
          $$DocumentTableTableAnnotationComposer,
          $$DocumentTableTableCreateCompanionBuilder,
          $$DocumentTableTableUpdateCompanionBuilder,
          (DocumentTableData, $$DocumentTableTableReferences),
          DocumentTableData,
          PrefetchHooks Function({bool supplierId})
        > {
  $$DocumentTableTableTableManager(_$AppDatabase db, $DocumentTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => DocumentTableCompanion(
                id: id,
                title: title,
                localPath: localPath,
                url: url,
                type: type,
                createdAt: createdAt,
                supplierId: supplierId,
                isSynced: isSynced,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String localPath,
                Value<String?> url = const Value.absent(),
                required String type,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => DocumentTableCompanion.insert(
                id: id,
                title: title,
                localPath: localPath,
                url: url,
                type: type,
                createdAt: createdAt,
                supplierId: supplierId,
                isSynced: isSynced,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DocumentTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplierId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplierId,
                                referencedTable: $$DocumentTableTableReferences
                                    ._supplierIdTable(db),
                                referencedColumn: $$DocumentTableTableReferences
                                    ._supplierIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DocumentTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentTableTable,
      DocumentTableData,
      $$DocumentTableTableFilterComposer,
      $$DocumentTableTableOrderingComposer,
      $$DocumentTableTableAnnotationComposer,
      $$DocumentTableTableCreateCompanionBuilder,
      $$DocumentTableTableUpdateCompanionBuilder,
      (DocumentTableData, $$DocumentTableTableReferences),
      DocumentTableData,
      PrefetchHooks Function({bool supplierId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SupplierTableTableManager get supplier =>
      $$SupplierTableTableManager(_db, _db.supplier);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
  $$NotesTableTableTableManager get notesTable =>
      $$NotesTableTableTableManager(_db, _db.notesTable);
  $$DocumentTableTableTableManager get documentTable =>
      $$DocumentTableTableTableManager(_db, _db.documentTable);
}
