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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 15,
    ),
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 15,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 500,
    ),
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 500,
    ),
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
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
    score,
    createdAt,
    updatedAt,
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
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
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
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $SupplierTable createAlias(String alias) {
    return $SupplierTable(attachedDatabase, alias);
  }
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
  final int? score;
  final String? createdAt;
  final String? updatedAt;
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
    this.score,
    this.createdAt,
    this.updatedAt,
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
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
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
      score: score == null && nullToAbsent
          ? const Value.absent()
          : Value(score),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
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
      score: serializer.fromJson<int?>(json['score']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
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
      'score': serializer.toJson<int?>(score),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
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
    Value<int?> score = const Value.absent(),
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
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
    score: score.present ? score.value : this.score,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
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
      score: data.score.present ? data.score.value : this.score,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
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
          ..write('score: $score, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
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
    score,
    createdAt,
    updatedAt,
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
          other.score == this.score &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
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
  final Value<int?> score;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
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
    this.score = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
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
    this.score = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
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
    Expression<int>? score,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
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
      if (score != null) 'score': score,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
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
    Value<int?>? score,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
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
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
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
          ..write('score: $score, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SupplierTable supplier = $SupplierTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [supplier];
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
      Value<int?> score,
      Value<String?> createdAt,
      Value<String?> updatedAt,
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
      Value<int?> score,
      Value<String?> createdAt,
      Value<String?> updatedAt,
    });

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

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
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

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
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

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
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
          (
            SupplierData,
            BaseReferences<_$AppDatabase, $SupplierTable, SupplierData>,
          ),
          SupplierData,
          PrefetchHooks Function()
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
                Value<int?> score = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
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
                score: score,
                createdAt: createdAt,
                updatedAt: updatedAt,
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
                Value<int?> score = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
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
                score: score,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (
        SupplierData,
        BaseReferences<_$AppDatabase, $SupplierTable, SupplierData>,
      ),
      SupplierData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SupplierTableTableManager get supplier =>
      $$SupplierTableTableManager(_db, _db.supplier);
}
