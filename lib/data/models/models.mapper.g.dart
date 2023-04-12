import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'auth/auth_model.dart';
import 'auth/sign_in_mode.dart';
import 'auth/sign_up_model.dart';
import 'charts/chart_model.dart';
import 'charts/chart_timeduserstotal_model.dart';
import 'charts/chart_user_model.dart';
import 'charts/charts_user_chart_model.dart';
import 'charts/small_table_model.dart';
import 'charts/tabled_chart_model.dart';
import 'charts/total_chart_model.dart';
import 'charts/total_progress_chart_model.dart';
import 'charts/total_tabled_chart_model.dart';
import 'chat/chat_dto.dart';
import 'chat/chat_model.dart';
import 'message/mesage_model.dart';
import 'message/message_dto.dart';
import 'note/note_dto.dart';
import 'push/push_token_dto.dart';
import 'table/table_dto.dart';
import 'table/table_model.dart';
import 'task/status_dto.dart';
import 'task/task_dto.dart';
import 'task/task_model.dart';
import 'user/user_auth_dto.dart';
import 'user/user_auth_model.dart';
import 'user/user_confirm_dto.dart';
import 'user/user_confirm_model.dart';
import 'user/user_model.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AuthResultModelMapper._(),
  SignInDtoMapper._(),
  SignUpDtoMapper._(),
  UserAuthDtoMapper._(),
  UserModelMapper._(),
  UserAuthModelMapper._(),
  UserConfirmDtoMapper._(),
  UserConfirmModelMapper._(),
  ChatDtoMapper._(),
  ChatModelMapper._(),
  MessageModelMapper._(),
  MessageDtoMapper._(),
  TaskDtoMapper._(),
  TaskModelMapper._(),
  StatusDtoMapper._(),
  PushTokenDtoMapper._(),
  TableDtoMapper._(),
  TableModelMapper._(),
  NoteDtoMapper._(),
  TotalChartModelMapper._(),
  ChartUserModelMapper._(),
  ChartModelMapper._(),
  TotalProgressChartModelMapper._(),
  SmallTableModelMapper._(),
  TabledChartModelMapper._(),
  TotalTabledChartModelMapper._(),
  ChartsUserChartModelMapper._(),
  ChartTimeduserstotalModelMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AuthResultModelMapper extends BaseMapper<AuthResultModel> {
  AuthResultModelMapper._();

  @override Function get decoder => decode;
  AuthResultModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AuthResultModel fromMap(Map<String, dynamic> map) => AuthResultModel(token: Mapper.i.$get(map, 'token'));

  @override Function get encoder => (AuthResultModel v) => encode(v);
  dynamic encode(AuthResultModel v) => toMap(v);
  Map<String, dynamic> toMap(AuthResultModel a) => {'token': Mapper.i.$enc(a.token, 'token')};

  @override String stringify(AuthResultModel self) => 'AuthResultModel(token: ${Mapper.asString(self.token)})';
  @override int hash(AuthResultModel self) => Mapper.hash(self.token);
  @override bool equals(AuthResultModel self, AuthResultModel other) => Mapper.isEqual(self.token, other.token);

  @override Function get typeFactory => (f) => f<AuthResultModel>();
}

extension AuthResultModelMapperExtension  on AuthResultModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AuthResultModelCopyWith<AuthResultModel> get copyWith => AuthResultModelCopyWith(this, $identity);
}

abstract class AuthResultModelCopyWith<$R> {
  factory AuthResultModelCopyWith(AuthResultModel value, Then<AuthResultModel, $R> then) = _AuthResultModelCopyWithImpl<$R>;
  $R call({String? token});
  $R apply(AuthResultModel Function(AuthResultModel) transform);
}

class _AuthResultModelCopyWithImpl<$R> extends BaseCopyWith<AuthResultModel, $R> implements AuthResultModelCopyWith<$R> {
  _AuthResultModelCopyWithImpl(AuthResultModel value, Then<AuthResultModel, $R> then) : super(value, then);

  @override $R call({String? token}) => $then(AuthResultModel(token: token ?? $value.token));
}

class SignInDtoMapper extends BaseMapper<SignInDto> {
  SignInDtoMapper._();

  @override Function get decoder => decode;
  SignInDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignInDto fromMap(Map<String, dynamic> map) => SignInDto(email: Mapper.i.$get(map, 'email'), password: Mapper.i.$get(map, 'password'));

  @override Function get encoder => (SignInDto v) => encode(v);
  dynamic encode(SignInDto v) => toMap(v);
  Map<String, dynamic> toMap(SignInDto s) => {'email': Mapper.i.$enc(s.email, 'email'), 'password': Mapper.i.$enc(s.password, 'password')};

  @override String stringify(SignInDto self) => 'SignInDto(email: ${Mapper.asString(self.email)}, password: ${Mapper.asString(self.password)})';
  @override int hash(SignInDto self) => Mapper.hash(self.email) ^ Mapper.hash(self.password);
  @override bool equals(SignInDto self, SignInDto other) => Mapper.isEqual(self.email, other.email) && Mapper.isEqual(self.password, other.password);

  @override Function get typeFactory => (f) => f<SignInDto>();
}

extension SignInDtoMapperExtension  on SignInDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignInDtoCopyWith<SignInDto> get copyWith => SignInDtoCopyWith(this, $identity);
}

abstract class SignInDtoCopyWith<$R> {
  factory SignInDtoCopyWith(SignInDto value, Then<SignInDto, $R> then) = _SignInDtoCopyWithImpl<$R>;
  $R call({String? email, String? password});
  $R apply(SignInDto Function(SignInDto) transform);
}

class _SignInDtoCopyWithImpl<$R> extends BaseCopyWith<SignInDto, $R> implements SignInDtoCopyWith<$R> {
  _SignInDtoCopyWithImpl(SignInDto value, Then<SignInDto, $R> then) : super(value, then);

  @override $R call({String? email, String? password}) => $then(SignInDto(email: email ?? $value.email, password: password ?? $value.password));
}

class SignUpDtoMapper extends BaseMapper<SignUpDto> {
  SignUpDtoMapper._();

  @override Function get decoder => decode;
  SignUpDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SignUpDto fromMap(Map<String, dynamic> map) => SignUpDto(email: Mapper.i.$get(map, 'email'), password: Mapper.i.$get(map, 'password'), nickname: Mapper.i.$get(map, 'nickname'));

  @override Function get encoder => (SignUpDto v) => encode(v);
  dynamic encode(SignUpDto v) => toMap(v);
  Map<String, dynamic> toMap(SignUpDto s) => {'email': Mapper.i.$enc(s.email, 'email'), 'password': Mapper.i.$enc(s.password, 'password'), 'nickname': Mapper.i.$enc(s.nickname, 'nickname')};

  @override String stringify(SignUpDto self) => 'SignUpDto(email: ${Mapper.asString(self.email)}, password: ${Mapper.asString(self.password)}, nickname: ${Mapper.asString(self.nickname)})';
  @override int hash(SignUpDto self) => Mapper.hash(self.email) ^ Mapper.hash(self.password) ^ Mapper.hash(self.nickname);
  @override bool equals(SignUpDto self, SignUpDto other) => Mapper.isEqual(self.email, other.email) && Mapper.isEqual(self.password, other.password) && Mapper.isEqual(self.nickname, other.nickname);

  @override Function get typeFactory => (f) => f<SignUpDto>();
}

extension SignUpDtoMapperExtension  on SignUpDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SignUpDtoCopyWith<SignUpDto> get copyWith => SignUpDtoCopyWith(this, $identity);
}

abstract class SignUpDtoCopyWith<$R> {
  factory SignUpDtoCopyWith(SignUpDto value, Then<SignUpDto, $R> then) = _SignUpDtoCopyWithImpl<$R>;
  $R call({String? email, String? password, String? nickname});
  $R apply(SignUpDto Function(SignUpDto) transform);
}

class _SignUpDtoCopyWithImpl<$R> extends BaseCopyWith<SignUpDto, $R> implements SignUpDtoCopyWith<$R> {
  _SignUpDtoCopyWithImpl(SignUpDto value, Then<SignUpDto, $R> then) : super(value, then);

  @override $R call({String? email, String? password, String? nickname}) => $then(SignUpDto(email: email ?? $value.email, password: password ?? $value.password, nickname: nickname ?? $value.nickname));
}

class UserAuthDtoMapper extends BaseMapper<UserAuthDto> {
  UserAuthDtoMapper._();

  @override Function get decoder => decode;
  UserAuthDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  UserAuthDto fromMap(Map<String, dynamic> map) => UserAuthDto(userName: Mapper.i.$getOpt(map, 'userName'), email: Mapper.i.$get(map, 'email'));

  @override Function get encoder => (UserAuthDto v) => encode(v);
  dynamic encode(UserAuthDto v) => toMap(v);
  Map<String, dynamic> toMap(UserAuthDto u) => {'userName': Mapper.i.$enc(u.userName, 'userName'), 'email': Mapper.i.$enc(u.email, 'email')};

  @override String stringify(UserAuthDto self) => 'UserAuthDto(userName: ${Mapper.asString(self.userName)}, email: ${Mapper.asString(self.email)})';
  @override int hash(UserAuthDto self) => Mapper.hash(self.userName) ^ Mapper.hash(self.email);
  @override bool equals(UserAuthDto self, UserAuthDto other) => Mapper.isEqual(self.userName, other.userName) && Mapper.isEqual(self.email, other.email);

  @override Function get typeFactory => (f) => f<UserAuthDto>();
}

extension UserAuthDtoMapperExtension  on UserAuthDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  UserAuthDtoCopyWith<UserAuthDto> get copyWith => UserAuthDtoCopyWith(this, $identity);
}

abstract class UserAuthDtoCopyWith<$R> {
  factory UserAuthDtoCopyWith(UserAuthDto value, Then<UserAuthDto, $R> then) = _UserAuthDtoCopyWithImpl<$R>;
  $R call({String? userName, String? email});
  $R apply(UserAuthDto Function(UserAuthDto) transform);
}

class _UserAuthDtoCopyWithImpl<$R> extends BaseCopyWith<UserAuthDto, $R> implements UserAuthDtoCopyWith<$R> {
  _UserAuthDtoCopyWithImpl(UserAuthDto value, Then<UserAuthDto, $R> then) : super(value, then);

  @override $R call({Object? userName = $none, String? email}) => $then(UserAuthDto(userName: or(userName, $value.userName), email: email ?? $value.email));
}

class UserModelMapper extends BaseMapper<UserModel> {
  UserModelMapper._();

  @override Function get decoder => decode;
  UserModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  UserModel fromMap(Map<String, dynamic> map) => UserModel(id: Mapper.i.$get(map, 'id'), userName: Mapper.i.$getOpt(map, 'userName'), email: Mapper.i.$get(map, 'email'), avatar: Mapper.i.$getOpt(map, 'avatar'));

  @override Function get encoder => (UserModel v) => encode(v);
  dynamic encode(UserModel v) => toMap(v);
  Map<String, dynamic> toMap(UserModel u) => {'id': Mapper.i.$enc(u.id, 'id'), 'userName': Mapper.i.$enc(u.userName, 'userName'), 'email': Mapper.i.$enc(u.email, 'email'), 'avatar': Mapper.i.$enc(u.avatar, 'avatar')};

  @override String stringify(UserModel self) => 'UserModel(id: ${Mapper.asString(self.id)}, userName: ${Mapper.asString(self.userName)}, email: ${Mapper.asString(self.email)}, avatar: ${Mapper.asString(self.avatar)})';
  @override int hash(UserModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.userName) ^ Mapper.hash(self.email) ^ Mapper.hash(self.avatar);
  @override bool equals(UserModel self, UserModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.userName, other.userName) && Mapper.isEqual(self.email, other.email) && Mapper.isEqual(self.avatar, other.avatar);

  @override Function get typeFactory => (f) => f<UserModel>();
}

extension UserModelMapperExtension  on UserModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  UserModelCopyWith<UserModel> get copyWith => UserModelCopyWith(this, $identity);
}

abstract class UserModelCopyWith<$R> {
  factory UserModelCopyWith(UserModel value, Then<UserModel, $R> then) = _UserModelCopyWithImpl<$R>;
  $R call({String? id, String? userName, String? email, String? avatar});
  $R apply(UserModel Function(UserModel) transform);
}

class _UserModelCopyWithImpl<$R> extends BaseCopyWith<UserModel, $R> implements UserModelCopyWith<$R> {
  _UserModelCopyWithImpl(UserModel value, Then<UserModel, $R> then) : super(value, then);

  @override $R call({String? id, Object? userName = $none, String? email, Object? avatar = $none}) => $then(UserModel(id: id ?? $value.id, userName: or(userName, $value.userName), email: email ?? $value.email, avatar: or(avatar, $value.avatar)));
}

class UserAuthModelMapper extends BaseMapper<UserAuthModel> {
  UserAuthModelMapper._();

  @override Function get decoder => decode;
  UserAuthModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  UserAuthModel fromMap(Map<String, dynamic> map) => UserAuthModel(code: Mapper.i.$get(map, 'code'));

  @override Function get encoder => (UserAuthModel v) => encode(v);
  dynamic encode(UserAuthModel v) => toMap(v);
  Map<String, dynamic> toMap(UserAuthModel u) => {'code': Mapper.i.$enc(u.code, 'code')};

  @override String stringify(UserAuthModel self) => 'UserAuthModel(code: ${Mapper.asString(self.code)})';
  @override int hash(UserAuthModel self) => Mapper.hash(self.code);
  @override bool equals(UserAuthModel self, UserAuthModel other) => Mapper.isEqual(self.code, other.code);

  @override Function get typeFactory => (f) => f<UserAuthModel>();
}

extension UserAuthModelMapperExtension  on UserAuthModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  UserAuthModelCopyWith<UserAuthModel> get copyWith => UserAuthModelCopyWith(this, $identity);
}

abstract class UserAuthModelCopyWith<$R> {
  factory UserAuthModelCopyWith(UserAuthModel value, Then<UserAuthModel, $R> then) = _UserAuthModelCopyWithImpl<$R>;
  $R call({String? code});
  $R apply(UserAuthModel Function(UserAuthModel) transform);
}

class _UserAuthModelCopyWithImpl<$R> extends BaseCopyWith<UserAuthModel, $R> implements UserAuthModelCopyWith<$R> {
  _UserAuthModelCopyWithImpl(UserAuthModel value, Then<UserAuthModel, $R> then) : super(value, then);

  @override $R call({String? code}) => $then(UserAuthModel(code: code ?? $value.code));
}

class UserConfirmDtoMapper extends BaseMapper<UserConfirmDto> {
  UserConfirmDtoMapper._();

  @override Function get decoder => decode;
  UserConfirmDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  UserConfirmDto fromMap(Map<String, dynamic> map) => UserConfirmDto(code: Mapper.i.$get(map, 'code'), mailCode: Mapper.i.$get(map, 'mailCode'));

  @override Function get encoder => (UserConfirmDto v) => encode(v);
  dynamic encode(UserConfirmDto v) => toMap(v);
  Map<String, dynamic> toMap(UserConfirmDto u) => {'code': Mapper.i.$enc(u.code, 'code'), 'mailCode': Mapper.i.$enc(u.mailCode, 'mailCode')};

  @override String stringify(UserConfirmDto self) => 'UserConfirmDto(code: ${Mapper.asString(self.code)}, mailCode: ${Mapper.asString(self.mailCode)})';
  @override int hash(UserConfirmDto self) => Mapper.hash(self.code) ^ Mapper.hash(self.mailCode);
  @override bool equals(UserConfirmDto self, UserConfirmDto other) => Mapper.isEqual(self.code, other.code) && Mapper.isEqual(self.mailCode, other.mailCode);

  @override Function get typeFactory => (f) => f<UserConfirmDto>();
}

extension UserConfirmDtoMapperExtension  on UserConfirmDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  UserConfirmDtoCopyWith<UserConfirmDto> get copyWith => UserConfirmDtoCopyWith(this, $identity);
}

abstract class UserConfirmDtoCopyWith<$R> {
  factory UserConfirmDtoCopyWith(UserConfirmDto value, Then<UserConfirmDto, $R> then) = _UserConfirmDtoCopyWithImpl<$R>;
  $R call({String? code, String? mailCode});
  $R apply(UserConfirmDto Function(UserConfirmDto) transform);
}

class _UserConfirmDtoCopyWithImpl<$R> extends BaseCopyWith<UserConfirmDto, $R> implements UserConfirmDtoCopyWith<$R> {
  _UserConfirmDtoCopyWithImpl(UserConfirmDto value, Then<UserConfirmDto, $R> then) : super(value, then);

  @override $R call({String? code, String? mailCode}) => $then(UserConfirmDto(code: code ?? $value.code, mailCode: mailCode ?? $value.mailCode));
}

class UserConfirmModelMapper extends BaseMapper<UserConfirmModel> {
  UserConfirmModelMapper._();

  @override Function get decoder => decode;
  UserConfirmModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  UserConfirmModel fromMap(Map<String, dynamic> map) => UserConfirmModel(token: Mapper.i.$get(map, 'token'));

  @override Function get encoder => (UserConfirmModel v) => encode(v);
  dynamic encode(UserConfirmModel v) => toMap(v);
  Map<String, dynamic> toMap(UserConfirmModel u) => {'token': Mapper.i.$enc(u.token, 'token')};

  @override String stringify(UserConfirmModel self) => 'UserConfirmModel(token: ${Mapper.asString(self.token)})';
  @override int hash(UserConfirmModel self) => Mapper.hash(self.token);
  @override bool equals(UserConfirmModel self, UserConfirmModel other) => Mapper.isEqual(self.token, other.token);

  @override Function get typeFactory => (f) => f<UserConfirmModel>();
}

extension UserConfirmModelMapperExtension  on UserConfirmModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  UserConfirmModelCopyWith<UserConfirmModel> get copyWith => UserConfirmModelCopyWith(this, $identity);
}

abstract class UserConfirmModelCopyWith<$R> {
  factory UserConfirmModelCopyWith(UserConfirmModel value, Then<UserConfirmModel, $R> then) = _UserConfirmModelCopyWithImpl<$R>;
  $R call({String? token});
  $R apply(UserConfirmModel Function(UserConfirmModel) transform);
}

class _UserConfirmModelCopyWithImpl<$R> extends BaseCopyWith<UserConfirmModel, $R> implements UserConfirmModelCopyWith<$R> {
  _UserConfirmModelCopyWithImpl(UserConfirmModel value, Then<UserConfirmModel, $R> then) : super(value, then);

  @override $R call({String? token}) => $then(UserConfirmModel(token: token ?? $value.token));
}

class ChatDtoMapper extends BaseMapper<ChatDto> {
  ChatDtoMapper._();

  @override Function get decoder => decode;
  ChatDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChatDto fromMap(Map<String, dynamic> map) => ChatDto(title: Mapper.i.$getOpt(map, 'title'), userIds: Mapper.i.$get(map, 'userIds'), private: Mapper.i.$get(map, 'private'));

  @override Function get encoder => (ChatDto v) => encode(v);
  dynamic encode(ChatDto v) => toMap(v);
  Map<String, dynamic> toMap(ChatDto c) => {'title': Mapper.i.$enc(c.title, 'title'), 'userIds': Mapper.i.$enc(c.userIds, 'userIds'), 'private': Mapper.i.$enc(c.private, 'private')};

  @override String stringify(ChatDto self) => 'ChatDto(title: ${Mapper.asString(self.title)}, userIds: ${Mapper.asString(self.userIds)}, private: ${Mapper.asString(self.private)})';
  @override int hash(ChatDto self) => Mapper.hash(self.title) ^ Mapper.hash(self.userIds) ^ Mapper.hash(self.private);
  @override bool equals(ChatDto self, ChatDto other) => Mapper.isEqual(self.title, other.title) && Mapper.isEqual(self.userIds, other.userIds) && Mapper.isEqual(self.private, other.private);

  @override Function get typeFactory => (f) => f<ChatDto>();
}

extension ChatDtoMapperExtension  on ChatDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChatDtoCopyWith<ChatDto> get copyWith => ChatDtoCopyWith(this, $identity);
}

abstract class ChatDtoCopyWith<$R> {
  factory ChatDtoCopyWith(ChatDto value, Then<ChatDto, $R> then) = _ChatDtoCopyWithImpl<$R>;
  $R call({String? title, List<String>? userIds, bool? private});
  $R apply(ChatDto Function(ChatDto) transform);
}

class _ChatDtoCopyWithImpl<$R> extends BaseCopyWith<ChatDto, $R> implements ChatDtoCopyWith<$R> {
  _ChatDtoCopyWithImpl(ChatDto value, Then<ChatDto, $R> then) : super(value, then);

  @override $R call({Object? title = $none, List<String>? userIds, bool? private}) => $then(ChatDto(title: or(title, $value.title), userIds: userIds ?? $value.userIds, private: private ?? $value.private));
}

class ChatModelMapper extends BaseMapper<ChatModel> {
  ChatModelMapper._();

  @override Function get decoder => decode;
  ChatModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChatModel fromMap(Map<String, dynamic> map) => ChatModel(id: Mapper.i.$get(map, 'id'), title: Mapper.i.$getOpt(map, 'title'), private: Mapper.i.$get(map, 'private'), lastMessage: Mapper.i.$getOpt(map, 'lastMessage'));

  @override Function get encoder => (ChatModel v) => encode(v);
  dynamic encode(ChatModel v) => toMap(v);
  Map<String, dynamic> toMap(ChatModel c) => {'id': Mapper.i.$enc(c.id, 'id'), 'title': Mapper.i.$enc(c.title, 'title'), 'private': Mapper.i.$enc(c.private, 'private'), 'lastMessage': Mapper.i.$enc(c.lastMessage, 'lastMessage')};

  @override String stringify(ChatModel self) => 'ChatModel(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)}, private: ${Mapper.asString(self.private)}, lastMessage: ${Mapper.asString(self.lastMessage)})';
  @override int hash(ChatModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.title) ^ Mapper.hash(self.private) ^ Mapper.hash(self.lastMessage);
  @override bool equals(ChatModel self, ChatModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title) && Mapper.isEqual(self.private, other.private) && Mapper.isEqual(self.lastMessage, other.lastMessage);

  @override Function get typeFactory => (f) => f<ChatModel>();
}

extension ChatModelMapperExtension  on ChatModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChatModelCopyWith<ChatModel> get copyWith => ChatModelCopyWith(this, $identity);
}

abstract class ChatModelCopyWith<$R> {
  factory ChatModelCopyWith(ChatModel value, Then<ChatModel, $R> then) = _ChatModelCopyWithImpl<$R>;
  $R call({String? id, String? title, bool? private, String? lastMessage});
  $R apply(ChatModel Function(ChatModel) transform);
}

class _ChatModelCopyWithImpl<$R> extends BaseCopyWith<ChatModel, $R> implements ChatModelCopyWith<$R> {
  _ChatModelCopyWithImpl(ChatModel value, Then<ChatModel, $R> then) : super(value, then);

  @override $R call({String? id, Object? title = $none, bool? private, Object? lastMessage = $none}) => $then(ChatModel(id: id ?? $value.id, title: or(title, $value.title), private: private ?? $value.private, lastMessage: or(lastMessage, $value.lastMessage)));
}

class MessageModelMapper extends BaseMapper<MessageModel> {
  MessageModelMapper._();

  @override Function get decoder => decode;
  MessageModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  MessageModel fromMap(Map<String, dynamic> map) => MessageModel(id: Mapper.i.$get(map, 'id'), text: Mapper.i.$get(map, 'text'), time: Mapper.i.$get(map, 'time'), from: Mapper.i.$getOpt(map, 'from'), chatId: Mapper.i.$getOpt(map, 'chatId'), tableId: Mapper.i.$getOpt(map, 'tableId'), taskId: Mapper.i.$getOpt(map, 'taskId'), self: Mapper.i.$getOpt(map, 'self'));

  @override Function get encoder => (MessageModel v) => encode(v);
  dynamic encode(MessageModel v) => toMap(v);
  Map<String, dynamic> toMap(MessageModel m) => {'id': Mapper.i.$enc(m.id, 'id'), 'text': Mapper.i.$enc(m.text, 'text'), 'time': Mapper.i.$enc(m.time, 'time'), 'from': Mapper.i.$enc(m.from, 'from'), 'chatId': Mapper.i.$enc(m.chatId, 'chatId'), 'tableId': Mapper.i.$enc(m.tableId, 'tableId'), 'taskId': Mapper.i.$enc(m.taskId, 'taskId'), 'self': Mapper.i.$enc(m.self, 'self')};

  @override String stringify(MessageModel self) => 'MessageModel(id: ${Mapper.asString(self.id)}, text: ${Mapper.asString(self.text)}, time: ${Mapper.asString(self.time)}, from: ${Mapper.asString(self.from)}, chatId: ${Mapper.asString(self.chatId)}, tableId: ${Mapper.asString(self.tableId)}, taskId: ${Mapper.asString(self.taskId)}, self: ${Mapper.asString(self.self)})';
  @override int hash(MessageModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.text) ^ Mapper.hash(self.time) ^ Mapper.hash(self.from) ^ Mapper.hash(self.chatId) ^ Mapper.hash(self.tableId) ^ Mapper.hash(self.taskId) ^ Mapper.hash(self.self);
  @override bool equals(MessageModel self, MessageModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.text, other.text) && Mapper.isEqual(self.time, other.time) && Mapper.isEqual(self.from, other.from) && Mapper.isEqual(self.chatId, other.chatId) && Mapper.isEqual(self.tableId, other.tableId) && Mapper.isEqual(self.taskId, other.taskId) && Mapper.isEqual(self.self, other.self);

  @override Function get typeFactory => (f) => f<MessageModel>();
}

extension MessageModelMapperExtension  on MessageModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  MessageModelCopyWith<MessageModel> get copyWith => MessageModelCopyWith(this, $identity);
}

abstract class MessageModelCopyWith<$R> {
  factory MessageModelCopyWith(MessageModel value, Then<MessageModel, $R> then) = _MessageModelCopyWithImpl<$R>;
  UserModelCopyWith<$R>? get from;
  $R call({String? id, String? text, DateTime? time, UserModel? from, String? chatId, String? tableId, String? taskId, bool? self});
  $R apply(MessageModel Function(MessageModel) transform);
}

class _MessageModelCopyWithImpl<$R> extends BaseCopyWith<MessageModel, $R> implements MessageModelCopyWith<$R> {
  _MessageModelCopyWithImpl(MessageModel value, Then<MessageModel, $R> then) : super(value, then);

  @override UserModelCopyWith<$R>? get from => $value.from != null ? UserModelCopyWith($value.from!, (v) => call(from: v)) : null;
  @override $R call({String? id, String? text, DateTime? time, Object? from = $none, Object? chatId = $none, Object? tableId = $none, Object? taskId = $none, Object? self = $none}) => $then(MessageModel(id: id ?? $value.id, text: text ?? $value.text, time: time ?? $value.time, from: or(from, $value.from), chatId: or(chatId, $value.chatId), tableId: or(tableId, $value.tableId), taskId: or(taskId, $value.taskId), self: or(self, $value.self)));
}

class MessageDtoMapper extends BaseMapper<MessageDto> {
  MessageDtoMapper._();

  @override Function get decoder => decode;
  MessageDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  MessageDto fromMap(Map<String, dynamic> map) => MessageDto(text: Mapper.i.$get(map, 'text'), chatId: Mapper.i.$get(map, 'chatId'), tableId: Mapper.i.$getOpt(map, 'tableId'), taskId: Mapper.i.$getOpt(map, 'taskId'));

  @override Function get encoder => (MessageDto v) => encode(v);
  dynamic encode(MessageDto v) => toMap(v);
  Map<String, dynamic> toMap(MessageDto m) => {'text': Mapper.i.$enc(m.text, 'text'), 'chatId': Mapper.i.$enc(m.chatId, 'chatId'), 'tableId': Mapper.i.$enc(m.tableId, 'tableId'), 'taskId': Mapper.i.$enc(m.taskId, 'taskId')};

  @override String stringify(MessageDto self) => 'MessageDto(text: ${Mapper.asString(self.text)}, chatId: ${Mapper.asString(self.chatId)}, tableId: ${Mapper.asString(self.tableId)}, taskId: ${Mapper.asString(self.taskId)})';
  @override int hash(MessageDto self) => Mapper.hash(self.text) ^ Mapper.hash(self.chatId) ^ Mapper.hash(self.tableId) ^ Mapper.hash(self.taskId);
  @override bool equals(MessageDto self, MessageDto other) => Mapper.isEqual(self.text, other.text) && Mapper.isEqual(self.chatId, other.chatId) && Mapper.isEqual(self.tableId, other.tableId) && Mapper.isEqual(self.taskId, other.taskId);

  @override Function get typeFactory => (f) => f<MessageDto>();
}

extension MessageDtoMapperExtension  on MessageDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  MessageDtoCopyWith<MessageDto> get copyWith => MessageDtoCopyWith(this, $identity);
}

abstract class MessageDtoCopyWith<$R> {
  factory MessageDtoCopyWith(MessageDto value, Then<MessageDto, $R> then) = _MessageDtoCopyWithImpl<$R>;
  $R call({String? text, String? chatId, String? tableId, String? taskId});
  $R apply(MessageDto Function(MessageDto) transform);
}

class _MessageDtoCopyWithImpl<$R> extends BaseCopyWith<MessageDto, $R> implements MessageDtoCopyWith<$R> {
  _MessageDtoCopyWithImpl(MessageDto value, Then<MessageDto, $R> then) : super(value, then);

  @override $R call({String? text, String? chatId, Object? tableId = $none, Object? taskId = $none}) => $then(MessageDto(text: text ?? $value.text, chatId: chatId ?? $value.chatId, tableId: or(tableId, $value.tableId), taskId: or(taskId, $value.taskId)));
}

class TaskDtoMapper extends BaseMapper<TaskDto> {
  TaskDtoMapper._();

  @override Function get decoder => decode;
  TaskDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TaskDto fromMap(Map<String, dynamic> map) => TaskDto(executorId: Mapper.i.$get(map, 'executorId'), title: Mapper.i.$get(map, 'title'), hidden: Mapper.i.$get(map, 'hidden'), links: Mapper.i.$get(map, 'links'), description: Mapper.i.$get(map, 'description'), tableId: Mapper.i.$get(map, 'tableId'), duration: Mapper.i.$get(map, 'duration'), dateTime: Mapper.i.$getOpt(map, 'dateTime'), note: Mapper.i.$getOpt(map, 'note'), id: Mapper.i.$getOpt(map, 'id'), status: Mapper.i.$getOpt(map, 'status'), price: Mapper.i.$getOpt(map, 'price'));

  @override Function get encoder => (TaskDto v) => encode(v);
  dynamic encode(TaskDto v) => toMap(v);
  Map<String, dynamic> toMap(TaskDto t) => {'executorId': Mapper.i.$enc(t.executorId, 'executorId'), 'title': Mapper.i.$enc(t.title, 'title'), 'hidden': Mapper.i.$enc(t.hidden, 'hidden'), 'links': Mapper.i.$enc(t.links, 'links'), 'description': Mapper.i.$enc(t.description, 'description'), 'tableId': Mapper.i.$enc(t.tableId, 'tableId'), 'duration': Mapper.i.$enc(t.duration, 'duration'), 'dateTime': Mapper.i.$enc(t.dateTime, 'dateTime'), 'note': Mapper.i.$enc(t.note, 'note'), 'id': Mapper.i.$enc(t.id, 'id'), 'status': Mapper.i.$enc(t.status, 'status'), 'price': Mapper.i.$enc(t.price, 'price')};

  @override String stringify(TaskDto self) => 'TaskDto(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)}, description: ${Mapper.asString(self.description)}, dateTime: ${Mapper.asString(self.dateTime)}, duration: ${Mapper.asString(self.duration)}, hidden: ${Mapper.asString(self.hidden)}, tableId: ${Mapper.asString(self.tableId)}, executorId: ${Mapper.asString(self.executorId)}, links: ${Mapper.asString(self.links)}, note: ${Mapper.asString(self.note)}, status: ${Mapper.asString(self.status)}, price: ${Mapper.asString(self.price)})';
  @override int hash(TaskDto self) => Mapper.hash(self.id) ^ Mapper.hash(self.title) ^ Mapper.hash(self.description) ^ Mapper.hash(self.dateTime) ^ Mapper.hash(self.duration) ^ Mapper.hash(self.hidden) ^ Mapper.hash(self.tableId) ^ Mapper.hash(self.executorId) ^ Mapper.hash(self.links) ^ Mapper.hash(self.note) ^ Mapper.hash(self.status) ^ Mapper.hash(self.price);
  @override bool equals(TaskDto self, TaskDto other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title) && Mapper.isEqual(self.description, other.description) && Mapper.isEqual(self.dateTime, other.dateTime) && Mapper.isEqual(self.duration, other.duration) && Mapper.isEqual(self.hidden, other.hidden) && Mapper.isEqual(self.tableId, other.tableId) && Mapper.isEqual(self.executorId, other.executorId) && Mapper.isEqual(self.links, other.links) && Mapper.isEqual(self.note, other.note) && Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.price, other.price);

  @override Function get typeFactory => (f) => f<TaskDto>();
}

extension TaskDtoMapperExtension  on TaskDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TaskDtoCopyWith<TaskDto> get copyWith => TaskDtoCopyWith(this, $identity);
}

abstract class TaskDtoCopyWith<$R> {
  factory TaskDtoCopyWith(TaskDto value, Then<TaskDto, $R> then) = _TaskDtoCopyWithImpl<$R>;
  $R call({String? executorId, String? title, bool? hidden, List<String>? links, String? description, String? tableId, int? duration, DateTime? dateTime, String? note, String? id, String? status, int? price});
  $R apply(TaskDto Function(TaskDto) transform);
}

class _TaskDtoCopyWithImpl<$R> extends BaseCopyWith<TaskDto, $R> implements TaskDtoCopyWith<$R> {
  _TaskDtoCopyWithImpl(TaskDto value, Then<TaskDto, $R> then) : super(value, then);

  @override $R call({String? executorId, String? title, bool? hidden, List<String>? links, String? description, String? tableId, int? duration, Object? dateTime = $none, Object? note = $none, Object? id = $none, Object? status = $none, Object? price = $none}) => $then(TaskDto(executorId: executorId ?? $value.executorId, title: title ?? $value.title, hidden: hidden ?? $value.hidden, links: links ?? $value.links, description: description ?? $value.description, tableId: tableId ?? $value.tableId, duration: duration ?? $value.duration, dateTime: or(dateTime, $value.dateTime), note: or(note, $value.note), id: or(id, $value.id), status: or(status, $value.status), price: or(price, $value.price)));
}

class TaskModelMapper extends BaseMapper<TaskModel> {
  TaskModelMapper._();

  @override Function get decoder => decode;
  TaskModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TaskModel fromMap(Map<String, dynamic> map) => TaskModel(id: Mapper.i.$get(map, 'id'), author: Mapper.i.$get(map, 'author'), executor: Mapper.i.$get(map, 'executor'), title: Mapper.i.$get(map, 'title'), description: Mapper.i.$get(map, 'description'), startTime: Mapper.i.$get(map, 'startTime'), hidden: Mapper.i.$get(map, 'hidden'), links: Mapper.i.$get(map, 'links'), isAuthor: Mapper.i.$get(map, 'isAuthor'), isExecutor: Mapper.i.$get(map, 'isExecutor'), duration: Mapper.i.$get(map, 'duration'), status: Mapper.i.$get(map, 'status'), price: Mapper.i.$get(map, 'price'), note: Mapper.i.$getOpt(map, 'note'));

  @override Function get encoder => (TaskModel v) => encode(v);
  dynamic encode(TaskModel v) => toMap(v);
  Map<String, dynamic> toMap(TaskModel t) => {'id': Mapper.i.$enc(t.id, 'id'), 'author': Mapper.i.$enc(t.author, 'author'), 'executor': Mapper.i.$enc(t.executor, 'executor'), 'title': Mapper.i.$enc(t.title, 'title'), 'description': Mapper.i.$enc(t.description, 'description'), 'startTime': Mapper.i.$enc(t.startTime, 'startTime'), 'hidden': Mapper.i.$enc(t.hidden, 'hidden'), 'links': Mapper.i.$enc(t.links, 'links'), 'isAuthor': Mapper.i.$enc(t.isAuthor, 'isAuthor'), 'isExecutor': Mapper.i.$enc(t.isExecutor, 'isExecutor'), 'duration': Mapper.i.$enc(t.duration, 'duration'), 'status': Mapper.i.$enc(t.status, 'status'), 'price': Mapper.i.$enc(t.price, 'price'), 'note': Mapper.i.$enc(t.note, 'note')};

  @override String stringify(TaskModel self) => 'TaskModel(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)}, description: ${Mapper.asString(self.description)}, duration: ${Mapper.asString(self.duration)}, hidden: ${Mapper.asString(self.hidden)}, author: ${Mapper.asString(self.author)}, executor: ${Mapper.asString(self.executor)}, status: ${Mapper.asString(self.status)}, isAuthor: ${Mapper.asString(self.isAuthor)}, isExecutor: ${Mapper.asString(self.isExecutor)}, startTime: ${Mapper.asString(self.startTime)}, links: ${Mapper.asString(self.links)}, note: ${Mapper.asString(self.note)}, price: ${Mapper.asString(self.price)})';
  @override int hash(TaskModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.title) ^ Mapper.hash(self.description) ^ Mapper.hash(self.duration) ^ Mapper.hash(self.hidden) ^ Mapper.hash(self.author) ^ Mapper.hash(self.executor) ^ Mapper.hash(self.status) ^ Mapper.hash(self.isAuthor) ^ Mapper.hash(self.isExecutor) ^ Mapper.hash(self.startTime) ^ Mapper.hash(self.links) ^ Mapper.hash(self.note) ^ Mapper.hash(self.price);
  @override bool equals(TaskModel self, TaskModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title) && Mapper.isEqual(self.description, other.description) && Mapper.isEqual(self.duration, other.duration) && Mapper.isEqual(self.hidden, other.hidden) && Mapper.isEqual(self.author, other.author) && Mapper.isEqual(self.executor, other.executor) && Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.isAuthor, other.isAuthor) && Mapper.isEqual(self.isExecutor, other.isExecutor) && Mapper.isEqual(self.startTime, other.startTime) && Mapper.isEqual(self.links, other.links) && Mapper.isEqual(self.note, other.note) && Mapper.isEqual(self.price, other.price);

  @override Function get typeFactory => (f) => f<TaskModel>();
}

extension TaskModelMapperExtension  on TaskModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TaskModelCopyWith<TaskModel> get copyWith => TaskModelCopyWith(this, $identity);
}

abstract class TaskModelCopyWith<$R> {
  factory TaskModelCopyWith(TaskModel value, Then<TaskModel, $R> then) = _TaskModelCopyWithImpl<$R>;
  UserModelCopyWith<$R> get author;
  UserModelCopyWith<$R> get executor;
  $R call({String? id, UserModel? author, UserModel? executor, String? title, String? description, DateTime? startTime, bool? hidden, List<String>? links, bool? isAuthor, bool? isExecutor, int? duration, String? status, int? price, String? note});
  $R apply(TaskModel Function(TaskModel) transform);
}

class _TaskModelCopyWithImpl<$R> extends BaseCopyWith<TaskModel, $R> implements TaskModelCopyWith<$R> {
  _TaskModelCopyWithImpl(TaskModel value, Then<TaskModel, $R> then) : super(value, then);

  @override UserModelCopyWith<$R> get author => UserModelCopyWith($value.author, (v) => call(author: v));
  @override UserModelCopyWith<$R> get executor => UserModelCopyWith($value.executor, (v) => call(executor: v));
  @override $R call({String? id, UserModel? author, UserModel? executor, String? title, String? description, DateTime? startTime, bool? hidden, List<String>? links, bool? isAuthor, bool? isExecutor, int? duration, String? status, int? price, Object? note = $none}) => $then(TaskModel(id: id ?? $value.id, author: author ?? $value.author, executor: executor ?? $value.executor, title: title ?? $value.title, description: description ?? $value.description, startTime: startTime ?? $value.startTime, hidden: hidden ?? $value.hidden, links: links ?? $value.links, isAuthor: isAuthor ?? $value.isAuthor, isExecutor: isExecutor ?? $value.isExecutor, duration: duration ?? $value.duration, status: status ?? $value.status, price: price ?? $value.price, note: or(note, $value.note)));
}

class StatusDtoMapper extends BaseMapper<StatusDto> {
  StatusDtoMapper._();

  @override Function get decoder => decode;
  StatusDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  StatusDto fromMap(Map<String, dynamic> map) => StatusDto(id: Mapper.i.$get(map, 'id'), status: Mapper.i.$get(map, 'status'));

  @override Function get encoder => (StatusDto v) => encode(v);
  dynamic encode(StatusDto v) => toMap(v);
  Map<String, dynamic> toMap(StatusDto s) => {'id': Mapper.i.$enc(s.id, 'id'), 'status': Mapper.i.$enc(s.status, 'status')};

  @override String stringify(StatusDto self) => 'StatusDto(id: ${Mapper.asString(self.id)}, status: ${Mapper.asString(self.status)})';
  @override int hash(StatusDto self) => Mapper.hash(self.id) ^ Mapper.hash(self.status);
  @override bool equals(StatusDto self, StatusDto other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.status, other.status);

  @override Function get typeFactory => (f) => f<StatusDto>();
}

extension StatusDtoMapperExtension  on StatusDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  StatusDtoCopyWith<StatusDto> get copyWith => StatusDtoCopyWith(this, $identity);
}

abstract class StatusDtoCopyWith<$R> {
  factory StatusDtoCopyWith(StatusDto value, Then<StatusDto, $R> then) = _StatusDtoCopyWithImpl<$R>;
  $R call({String? id, String? status});
  $R apply(StatusDto Function(StatusDto) transform);
}

class _StatusDtoCopyWithImpl<$R> extends BaseCopyWith<StatusDto, $R> implements StatusDtoCopyWith<$R> {
  _StatusDtoCopyWithImpl(StatusDto value, Then<StatusDto, $R> then) : super(value, then);

  @override $R call({String? id, String? status}) => $then(StatusDto(id: id ?? $value.id, status: status ?? $value.status));
}

class PushTokenDtoMapper extends BaseMapper<PushTokenDto> {
  PushTokenDtoMapper._();

  @override Function get decoder => decode;
  PushTokenDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  PushTokenDto fromMap(Map<String, dynamic> map) => PushTokenDto(pushToken: Mapper.i.$get(map, 'pushToken'));

  @override Function get encoder => (PushTokenDto v) => encode(v);
  dynamic encode(PushTokenDto v) => toMap(v);
  Map<String, dynamic> toMap(PushTokenDto p) => {'pushToken': Mapper.i.$enc(p.pushToken, 'pushToken')};

  @override String stringify(PushTokenDto self) => 'PushTokenDto(pushToken: ${Mapper.asString(self.pushToken)})';
  @override int hash(PushTokenDto self) => Mapper.hash(self.pushToken);
  @override bool equals(PushTokenDto self, PushTokenDto other) => Mapper.isEqual(self.pushToken, other.pushToken);

  @override Function get typeFactory => (f) => f<PushTokenDto>();
}

extension PushTokenDtoMapperExtension  on PushTokenDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PushTokenDtoCopyWith<PushTokenDto> get copyWith => PushTokenDtoCopyWith(this, $identity);
}

abstract class PushTokenDtoCopyWith<$R> {
  factory PushTokenDtoCopyWith(PushTokenDto value, Then<PushTokenDto, $R> then) = _PushTokenDtoCopyWithImpl<$R>;
  $R call({String? pushToken});
  $R apply(PushTokenDto Function(PushTokenDto) transform);
}

class _PushTokenDtoCopyWithImpl<$R> extends BaseCopyWith<PushTokenDto, $R> implements PushTokenDtoCopyWith<$R> {
  _PushTokenDtoCopyWithImpl(PushTokenDto value, Then<PushTokenDto, $R> then) : super(value, then);

  @override $R call({String? pushToken}) => $then(PushTokenDto(pushToken: pushToken ?? $value.pushToken));
}

class TableDtoMapper extends BaseMapper<TableDto> {
  TableDtoMapper._();

  @override Function get decoder => decode;
  TableDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TableDto fromMap(Map<String, dynamic> map) => TableDto(id: Mapper.i.$getOpt(map, 'id'), title: Mapper.i.$get(map, 'title'), users: Mapper.i.$get(map, 'users'));

  @override Function get encoder => (TableDto v) => encode(v);
  dynamic encode(TableDto v) => toMap(v);
  Map<String, dynamic> toMap(TableDto t) => {'id': Mapper.i.$enc(t.id, 'id'), 'title': Mapper.i.$enc(t.title, 'title'), 'users': Mapper.i.$enc(t.users, 'users')};

  @override String stringify(TableDto self) => 'TableDto(id: ${Mapper.asString(self.id)}, users: ${Mapper.asString(self.users)}, title: ${Mapper.asString(self.title)})';
  @override int hash(TableDto self) => Mapper.hash(self.id) ^ Mapper.hash(self.users) ^ Mapper.hash(self.title);
  @override bool equals(TableDto self, TableDto other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.users, other.users) && Mapper.isEqual(self.title, other.title);

  @override Function get typeFactory => (f) => f<TableDto>();
}

extension TableDtoMapperExtension  on TableDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TableDtoCopyWith<TableDto> get copyWith => TableDtoCopyWith(this, $identity);
}

abstract class TableDtoCopyWith<$R> {
  factory TableDtoCopyWith(TableDto value, Then<TableDto, $R> then) = _TableDtoCopyWithImpl<$R>;
  ListCopyWith<$R, UserModel, UserModelCopyWith<$R>> get users;
  $R call({String? id, String? title, List<UserModel>? users});
  $R apply(TableDto Function(TableDto) transform);
}

class _TableDtoCopyWithImpl<$R> extends BaseCopyWith<TableDto, $R> implements TableDtoCopyWith<$R> {
  _TableDtoCopyWithImpl(TableDto value, Then<TableDto, $R> then) : super(value, then);

  @override ListCopyWith<$R, UserModel, UserModelCopyWith<$R>> get users => ListCopyWith($value.users, (v, t) => UserModelCopyWith(v, t), (v) => call(users: v));
  @override $R call({Object? id = $none, String? title, List<UserModel>? users}) => $then(TableDto(id: or(id, $value.id), title: title ?? $value.title, users: users ?? $value.users));
}

class TableModelMapper extends BaseMapper<TableModel> {
  TableModelMapper._();

  @override Function get decoder => decode;
  TableModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TableModel fromMap(Map<String, dynamic> map) => TableModel(id: Mapper.i.$get(map, 'id'), title: Mapper.i.$get(map, 'title'), users: Mapper.i.$get(map, 'users'), tasks: Mapper.i.$getOpt(map, 'tasks'));

  @override Function get encoder => (TableModel v) => encode(v);
  dynamic encode(TableModel v) => toMap(v);
  Map<String, dynamic> toMap(TableModel t) => {'id': Mapper.i.$enc(t.id, 'id'), 'title': Mapper.i.$enc(t.title, 'title'), 'users': Mapper.i.$enc(t.users, 'users'), 'tasks': Mapper.i.$enc(t.tasks, 'tasks')};

  @override String stringify(TableModel self) => 'TableModel(id: ${Mapper.asString(self.id)}, users: ${Mapper.asString(self.users)}, tasks: ${Mapper.asString(self.tasks)}, title: ${Mapper.asString(self.title)})';
  @override int hash(TableModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.users) ^ Mapper.hash(self.tasks) ^ Mapper.hash(self.title);
  @override bool equals(TableModel self, TableModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.users, other.users) && Mapper.isEqual(self.tasks, other.tasks) && Mapper.isEqual(self.title, other.title);

  @override Function get typeFactory => (f) => f<TableModel>();
}

extension TableModelMapperExtension  on TableModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TableModelCopyWith<TableModel> get copyWith => TableModelCopyWith(this, $identity);
}

abstract class TableModelCopyWith<$R> {
  factory TableModelCopyWith(TableModel value, Then<TableModel, $R> then) = _TableModelCopyWithImpl<$R>;
  ListCopyWith<$R, UserModel, UserModelCopyWith<$R>> get users;
  ListCopyWith<$R, TaskModel, TaskModelCopyWith<$R>>? get tasks;
  $R call({String? id, String? title, List<UserModel>? users, List<TaskModel>? tasks});
  $R apply(TableModel Function(TableModel) transform);
}

class _TableModelCopyWithImpl<$R> extends BaseCopyWith<TableModel, $R> implements TableModelCopyWith<$R> {
  _TableModelCopyWithImpl(TableModel value, Then<TableModel, $R> then) : super(value, then);

  @override ListCopyWith<$R, UserModel, UserModelCopyWith<$R>> get users => ListCopyWith($value.users, (v, t) => UserModelCopyWith(v, t), (v) => call(users: v));
  @override ListCopyWith<$R, TaskModel, TaskModelCopyWith<$R>>? get tasks => $value.tasks != null ? ListCopyWith($value.tasks!, (v, t) => TaskModelCopyWith(v, t), (v) => call(tasks: v)) : null;
  @override $R call({String? id, String? title, List<UserModel>? users, Object? tasks = $none}) => $then(TableModel(id: id ?? $value.id, title: title ?? $value.title, users: users ?? $value.users, tasks: or(tasks, $value.tasks)));
}

class NoteDtoMapper extends BaseMapper<NoteDto> {
  NoteDtoMapper._();

  @override Function get decoder => decode;
  NoteDto decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  NoteDto fromMap(Map<String, dynamic> map) => NoteDto(text: Mapper.i.$get(map, 'text'), taskId: Mapper.i.$get(map, 'taskId'));

  @override Function get encoder => (NoteDto v) => encode(v);
  dynamic encode(NoteDto v) => toMap(v);
  Map<String, dynamic> toMap(NoteDto n) => {'text': Mapper.i.$enc(n.text, 'text'), 'taskId': Mapper.i.$enc(n.taskId, 'taskId')};

  @override String stringify(NoteDto self) => 'NoteDto(taskId: ${Mapper.asString(self.taskId)}, text: ${Mapper.asString(self.text)})';
  @override int hash(NoteDto self) => Mapper.hash(self.taskId) ^ Mapper.hash(self.text);
  @override bool equals(NoteDto self, NoteDto other) => Mapper.isEqual(self.taskId, other.taskId) && Mapper.isEqual(self.text, other.text);

  @override Function get typeFactory => (f) => f<NoteDto>();
}

extension NoteDtoMapperExtension  on NoteDto {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  NoteDtoCopyWith<NoteDto> get copyWith => NoteDtoCopyWith(this, $identity);
}

abstract class NoteDtoCopyWith<$R> {
  factory NoteDtoCopyWith(NoteDto value, Then<NoteDto, $R> then) = _NoteDtoCopyWithImpl<$R>;
  $R call({String? text, String? taskId});
  $R apply(NoteDto Function(NoteDto) transform);
}

class _NoteDtoCopyWithImpl<$R> extends BaseCopyWith<NoteDto, $R> implements NoteDtoCopyWith<$R> {
  _NoteDtoCopyWithImpl(NoteDto value, Then<NoteDto, $R> then) : super(value, then);

  @override $R call({String? text, String? taskId}) => $then(NoteDto(text: text ?? $value.text, taskId: taskId ?? $value.taskId));
}

class TotalChartModelMapper extends BaseMapper<TotalChartModel> {
  TotalChartModelMapper._();

  @override Function get decoder => decode;
  TotalChartModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TotalChartModel fromMap(Map<String, dynamic> map) => TotalChartModel(chart: Mapper.i.$get(map, 'chart'));

  @override Function get encoder => (TotalChartModel v) => encode(v);
  dynamic encode(TotalChartModel v) => toMap(v);
  Map<String, dynamic> toMap(TotalChartModel t) => {'chart': Mapper.i.$enc(t.chart, 'chart')};

  @override String stringify(TotalChartModel self) => 'TotalChartModel(chart: ${Mapper.asString(self.chart)})';
  @override int hash(TotalChartModel self) => Mapper.hash(self.chart);
  @override bool equals(TotalChartModel self, TotalChartModel other) => Mapper.isEqual(self.chart, other.chart);

  @override Function get typeFactory => (f) => f<TotalChartModel>();
}

extension TotalChartModelMapperExtension  on TotalChartModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TotalChartModelCopyWith<TotalChartModel> get copyWith => TotalChartModelCopyWith(this, $identity);
}

abstract class TotalChartModelCopyWith<$R> {
  factory TotalChartModelCopyWith(TotalChartModel value, Then<TotalChartModel, $R> then) = _TotalChartModelCopyWithImpl<$R>;
  ListCopyWith<$R, ChartsUserChartModel, ChartsUserChartModelCopyWith<$R>> get chart;
  $R call({List<ChartsUserChartModel>? chart});
  $R apply(TotalChartModel Function(TotalChartModel) transform);
}

class _TotalChartModelCopyWithImpl<$R> extends BaseCopyWith<TotalChartModel, $R> implements TotalChartModelCopyWith<$R> {
  _TotalChartModelCopyWithImpl(TotalChartModel value, Then<TotalChartModel, $R> then) : super(value, then);

  @override ListCopyWith<$R, ChartsUserChartModel, ChartsUserChartModelCopyWith<$R>> get chart => ListCopyWith($value.chart, (v, t) => ChartsUserChartModelCopyWith(v, t), (v) => call(chart: v));
  @override $R call({List<ChartsUserChartModel>? chart}) => $then(TotalChartModel(chart: chart ?? $value.chart));
}

class ChartUserModelMapper extends BaseMapper<ChartUserModel> {
  ChartUserModelMapper._();

  @override Function get decoder => decode;
  ChartUserModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChartUserModel fromMap(Map<String, dynamic> map) => ChartUserModel(id: Mapper.i.$getOpt(map, 'id'), userName: Mapper.i.$getOpt(map, 'userName'), email: Mapper.i.$getOpt(map, 'email'));

  @override Function get encoder => (ChartUserModel v) => encode(v);
  dynamic encode(ChartUserModel v) => toMap(v);
  Map<String, dynamic> toMap(ChartUserModel c) => {'id': Mapper.i.$enc(c.id, 'id'), 'userName': Mapper.i.$enc(c.userName, 'userName'), 'email': Mapper.i.$enc(c.email, 'email')};

  @override String stringify(ChartUserModel self) => 'ChartUserModel(id: ${Mapper.asString(self.id)}, userName: ${Mapper.asString(self.userName)}, email: ${Mapper.asString(self.email)})';
  @override int hash(ChartUserModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.userName) ^ Mapper.hash(self.email);
  @override bool equals(ChartUserModel self, ChartUserModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.userName, other.userName) && Mapper.isEqual(self.email, other.email);

  @override Function get typeFactory => (f) => f<ChartUserModel>();
}

extension ChartUserModelMapperExtension  on ChartUserModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChartUserModelCopyWith<ChartUserModel> get copyWith => ChartUserModelCopyWith(this, $identity);
}

abstract class ChartUserModelCopyWith<$R> {
  factory ChartUserModelCopyWith(ChartUserModel value, Then<ChartUserModel, $R> then) = _ChartUserModelCopyWithImpl<$R>;
  $R call({String? id, String? userName, String? email});
  $R apply(ChartUserModel Function(ChartUserModel) transform);
}

class _ChartUserModelCopyWithImpl<$R> extends BaseCopyWith<ChartUserModel, $R> implements ChartUserModelCopyWith<$R> {
  _ChartUserModelCopyWithImpl(ChartUserModel value, Then<ChartUserModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? userName = $none, Object? email = $none}) => $then(ChartUserModel(id: or(id, $value.id), userName: or(userName, $value.userName), email: or(email, $value.email)));
}

class ChartModelMapper extends BaseMapper<ChartModel> {
  ChartModelMapper._();

  @override Function get decoder => decode;
  ChartModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChartModel fromMap(Map<String, dynamic> map) => ChartModel(totalTaskCount: Mapper.i.$get(map, 'totalTaskCount'), completedTaskCount: Mapper.i.$get(map, 'completedTaskCount'), closedTaskCount: Mapper.i.$get(map, 'closedTaskCount'), authoredTaskCount: Mapper.i.$get(map, 'authoredTaskCount'), totalPrice: Mapper.i.$get(map, 'totalPrice'), date: Mapper.i.$getOpt(map, 'date'));

  @override Function get encoder => (ChartModel v) => encode(v);
  dynamic encode(ChartModel v) => toMap(v);
  Map<String, dynamic> toMap(ChartModel c) => {'totalTaskCount': Mapper.i.$enc(c.totalTaskCount, 'totalTaskCount'), 'completedTaskCount': Mapper.i.$enc(c.completedTaskCount, 'completedTaskCount'), 'closedTaskCount': Mapper.i.$enc(c.closedTaskCount, 'closedTaskCount'), 'authoredTaskCount': Mapper.i.$enc(c.authoredTaskCount, 'authoredTaskCount'), 'totalPrice': Mapper.i.$enc(c.totalPrice, 'totalPrice'), 'date': Mapper.i.$enc(c.date, 'date')};

  @override String stringify(ChartModel self) => 'ChartModel(totalTaskCount: ${Mapper.asString(self.totalTaskCount)}, completedTaskCount: ${Mapper.asString(self.completedTaskCount)}, closedTaskCount: ${Mapper.asString(self.closedTaskCount)}, authoredTaskCount: ${Mapper.asString(self.authoredTaskCount)}, totalPrice: ${Mapper.asString(self.totalPrice)}, date: ${Mapper.asString(self.date)})';
  @override int hash(ChartModel self) => Mapper.hash(self.totalTaskCount) ^ Mapper.hash(self.completedTaskCount) ^ Mapper.hash(self.closedTaskCount) ^ Mapper.hash(self.authoredTaskCount) ^ Mapper.hash(self.totalPrice) ^ Mapper.hash(self.date);
  @override bool equals(ChartModel self, ChartModel other) => Mapper.isEqual(self.totalTaskCount, other.totalTaskCount) && Mapper.isEqual(self.completedTaskCount, other.completedTaskCount) && Mapper.isEqual(self.closedTaskCount, other.closedTaskCount) && Mapper.isEqual(self.authoredTaskCount, other.authoredTaskCount) && Mapper.isEqual(self.totalPrice, other.totalPrice) && Mapper.isEqual(self.date, other.date);

  @override Function get typeFactory => (f) => f<ChartModel>();
}

extension ChartModelMapperExtension  on ChartModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChartModelCopyWith<ChartModel> get copyWith => ChartModelCopyWith(this, $identity);
}

abstract class ChartModelCopyWith<$R> {
  factory ChartModelCopyWith(ChartModel value, Then<ChartModel, $R> then) = _ChartModelCopyWithImpl<$R>;
  $R call({int? totalTaskCount, int? completedTaskCount, int? closedTaskCount, int? authoredTaskCount, int? totalPrice, DateTime? date});
  $R apply(ChartModel Function(ChartModel) transform);
}

class _ChartModelCopyWithImpl<$R> extends BaseCopyWith<ChartModel, $R> implements ChartModelCopyWith<$R> {
  _ChartModelCopyWithImpl(ChartModel value, Then<ChartModel, $R> then) : super(value, then);

  @override $R call({int? totalTaskCount, int? completedTaskCount, int? closedTaskCount, int? authoredTaskCount, int? totalPrice, Object? date = $none}) => $then(ChartModel(totalTaskCount: totalTaskCount ?? $value.totalTaskCount, completedTaskCount: completedTaskCount ?? $value.completedTaskCount, closedTaskCount: closedTaskCount ?? $value.closedTaskCount, authoredTaskCount: authoredTaskCount ?? $value.authoredTaskCount, totalPrice: totalPrice ?? $value.totalPrice, date: or(date, $value.date)));
}

class TotalProgressChartModelMapper extends BaseMapper<TotalProgressChartModel> {
  TotalProgressChartModelMapper._();

  @override Function get decoder => decode;
  TotalProgressChartModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TotalProgressChartModel fromMap(Map<String, dynamic> map) => TotalProgressChartModel(totalTaskCount: Mapper.i.$get(map, 'totalTaskCount'), newTaskCount: Mapper.i.$get(map, 'newTaskCount'), doingTaskCount: Mapper.i.$get(map, 'doingTaskCount'), doneTaskCount: Mapper.i.$get(map, 'doneTaskCount'), reviewTaskCount: Mapper.i.$get(map, 'reviewTaskCount'), closedTaskCount: Mapper.i.$get(map, 'closedTaskCount'));

  @override Function get encoder => (TotalProgressChartModel v) => encode(v);
  dynamic encode(TotalProgressChartModel v) => toMap(v);
  Map<String, dynamic> toMap(TotalProgressChartModel t) => {'totalTaskCount': Mapper.i.$enc(t.totalTaskCount, 'totalTaskCount'), 'newTaskCount': Mapper.i.$enc(t.newTaskCount, 'newTaskCount'), 'doingTaskCount': Mapper.i.$enc(t.doingTaskCount, 'doingTaskCount'), 'doneTaskCount': Mapper.i.$enc(t.doneTaskCount, 'doneTaskCount'), 'reviewTaskCount': Mapper.i.$enc(t.reviewTaskCount, 'reviewTaskCount'), 'closedTaskCount': Mapper.i.$enc(t.closedTaskCount, 'closedTaskCount')};

  @override String stringify(TotalProgressChartModel self) => 'TotalProgressChartModel(totalTaskCount: ${Mapper.asString(self.totalTaskCount)}, newTaskCount: ${Mapper.asString(self.newTaskCount)}, doingTaskCount: ${Mapper.asString(self.doingTaskCount)}, doneTaskCount: ${Mapper.asString(self.doneTaskCount)}, reviewTaskCount: ${Mapper.asString(self.reviewTaskCount)}, closedTaskCount: ${Mapper.asString(self.closedTaskCount)})';
  @override int hash(TotalProgressChartModel self) => Mapper.hash(self.totalTaskCount) ^ Mapper.hash(self.newTaskCount) ^ Mapper.hash(self.doingTaskCount) ^ Mapper.hash(self.doneTaskCount) ^ Mapper.hash(self.reviewTaskCount) ^ Mapper.hash(self.closedTaskCount);
  @override bool equals(TotalProgressChartModel self, TotalProgressChartModel other) => Mapper.isEqual(self.totalTaskCount, other.totalTaskCount) && Mapper.isEqual(self.newTaskCount, other.newTaskCount) && Mapper.isEqual(self.doingTaskCount, other.doingTaskCount) && Mapper.isEqual(self.doneTaskCount, other.doneTaskCount) && Mapper.isEqual(self.reviewTaskCount, other.reviewTaskCount) && Mapper.isEqual(self.closedTaskCount, other.closedTaskCount);

  @override Function get typeFactory => (f) => f<TotalProgressChartModel>();
}

extension TotalProgressChartModelMapperExtension  on TotalProgressChartModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TotalProgressChartModelCopyWith<TotalProgressChartModel> get copyWith => TotalProgressChartModelCopyWith(this, $identity);
}

abstract class TotalProgressChartModelCopyWith<$R> {
  factory TotalProgressChartModelCopyWith(TotalProgressChartModel value, Then<TotalProgressChartModel, $R> then) = _TotalProgressChartModelCopyWithImpl<$R>;
  $R call({int? totalTaskCount, int? newTaskCount, int? doingTaskCount, int? doneTaskCount, int? reviewTaskCount, int? closedTaskCount});
  $R apply(TotalProgressChartModel Function(TotalProgressChartModel) transform);
}

class _TotalProgressChartModelCopyWithImpl<$R> extends BaseCopyWith<TotalProgressChartModel, $R> implements TotalProgressChartModelCopyWith<$R> {
  _TotalProgressChartModelCopyWithImpl(TotalProgressChartModel value, Then<TotalProgressChartModel, $R> then) : super(value, then);

  @override $R call({int? totalTaskCount, int? newTaskCount, int? doingTaskCount, int? doneTaskCount, int? reviewTaskCount, int? closedTaskCount}) => $then(TotalProgressChartModel(totalTaskCount: totalTaskCount ?? $value.totalTaskCount, newTaskCount: newTaskCount ?? $value.newTaskCount, doingTaskCount: doingTaskCount ?? $value.doingTaskCount, doneTaskCount: doneTaskCount ?? $value.doneTaskCount, reviewTaskCount: reviewTaskCount ?? $value.reviewTaskCount, closedTaskCount: closedTaskCount ?? $value.closedTaskCount));
}

class SmallTableModelMapper extends BaseMapper<SmallTableModel> {
  SmallTableModelMapper._();

  @override Function get decoder => decode;
  SmallTableModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  SmallTableModel fromMap(Map<String, dynamic> map) => SmallTableModel(id: Mapper.i.$getOpt(map, 'id'), title: Mapper.i.$getOpt(map, 'title'));

  @override Function get encoder => (SmallTableModel v) => encode(v);
  dynamic encode(SmallTableModel v) => toMap(v);
  Map<String, dynamic> toMap(SmallTableModel s) => {'id': Mapper.i.$enc(s.id, 'id'), 'title': Mapper.i.$enc(s.title, 'title')};

  @override String stringify(SmallTableModel self) => 'SmallTableModel(id: ${Mapper.asString(self.id)}, title: ${Mapper.asString(self.title)})';
  @override int hash(SmallTableModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.title);
  @override bool equals(SmallTableModel self, SmallTableModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.title, other.title);

  @override Function get typeFactory => (f) => f<SmallTableModel>();
}

extension SmallTableModelMapperExtension  on SmallTableModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  SmallTableModelCopyWith<SmallTableModel> get copyWith => SmallTableModelCopyWith(this, $identity);
}

abstract class SmallTableModelCopyWith<$R> {
  factory SmallTableModelCopyWith(SmallTableModel value, Then<SmallTableModel, $R> then) = _SmallTableModelCopyWithImpl<$R>;
  $R call({String? id, String? title});
  $R apply(SmallTableModel Function(SmallTableModel) transform);
}

class _SmallTableModelCopyWithImpl<$R> extends BaseCopyWith<SmallTableModel, $R> implements SmallTableModelCopyWith<$R> {
  _SmallTableModelCopyWithImpl(SmallTableModel value, Then<SmallTableModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? title = $none}) => $then(SmallTableModel(id: or(id, $value.id), title: or(title, $value.title)));
}

class TabledChartModelMapper extends BaseMapper<TabledChartModel> {
  TabledChartModelMapper._();

  @override Function get decoder => decode;
  TabledChartModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TabledChartModel fromMap(Map<String, dynamic> map) => TabledChartModel(table: Mapper.i.$getOpt(map, 'table'), chart: Mapper.i.$get(map, 'chart'));

  @override Function get encoder => (TabledChartModel v) => encode(v);
  dynamic encode(TabledChartModel v) => toMap(v);
  Map<String, dynamic> toMap(TabledChartModel t) => {'table': Mapper.i.$enc(t.table, 'table'), 'chart': Mapper.i.$enc(t.chart, 'chart')};

  @override String stringify(TabledChartModel self) => 'TabledChartModel(table: ${Mapper.asString(self.table)}, chart: ${Mapper.asString(self.chart)})';
  @override int hash(TabledChartModel self) => Mapper.hash(self.table) ^ Mapper.hash(self.chart);
  @override bool equals(TabledChartModel self, TabledChartModel other) => Mapper.isEqual(self.table, other.table) && Mapper.isEqual(self.chart, other.chart);

  @override Function get typeFactory => (f) => f<TabledChartModel>();
}

extension TabledChartModelMapperExtension  on TabledChartModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TabledChartModelCopyWith<TabledChartModel> get copyWith => TabledChartModelCopyWith(this, $identity);
}

abstract class TabledChartModelCopyWith<$R> {
  factory TabledChartModelCopyWith(TabledChartModel value, Then<TabledChartModel, $R> then) = _TabledChartModelCopyWithImpl<$R>;
  SmallTableModelCopyWith<$R>? get table;
  ListCopyWith<$R, ChartsUserChartModel, ChartsUserChartModelCopyWith<$R>> get chart;
  $R call({SmallTableModel? table, List<ChartsUserChartModel>? chart});
  $R apply(TabledChartModel Function(TabledChartModel) transform);
}

class _TabledChartModelCopyWithImpl<$R> extends BaseCopyWith<TabledChartModel, $R> implements TabledChartModelCopyWith<$R> {
  _TabledChartModelCopyWithImpl(TabledChartModel value, Then<TabledChartModel, $R> then) : super(value, then);

  @override SmallTableModelCopyWith<$R>? get table => $value.table != null ? SmallTableModelCopyWith($value.table!, (v) => call(table: v)) : null;
  @override ListCopyWith<$R, ChartsUserChartModel, ChartsUserChartModelCopyWith<$R>> get chart => ListCopyWith($value.chart, (v, t) => ChartsUserChartModelCopyWith(v, t), (v) => call(chart: v));
  @override $R call({Object? table = $none, List<ChartsUserChartModel>? chart}) => $then(TabledChartModel(table: or(table, $value.table), chart: chart ?? $value.chart));
}

class TotalTabledChartModelMapper extends BaseMapper<TotalTabledChartModel> {
  TotalTabledChartModelMapper._();

  @override Function get decoder => decode;
  TotalTabledChartModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  TotalTabledChartModel fromMap(Map<String, dynamic> map) => TotalTabledChartModel(chart: Mapper.i.$getOpt(map, 'chart'));

  @override Function get encoder => (TotalTabledChartModel v) => encode(v);
  dynamic encode(TotalTabledChartModel v) => toMap(v);
  Map<String, dynamic> toMap(TotalTabledChartModel t) => {'chart': Mapper.i.$enc(t.chart, 'chart')};

  @override String stringify(TotalTabledChartModel self) => 'TotalTabledChartModel(chart: ${Mapper.asString(self.chart)})';
  @override int hash(TotalTabledChartModel self) => Mapper.hash(self.chart);
  @override bool equals(TotalTabledChartModel self, TotalTabledChartModel other) => Mapper.isEqual(self.chart, other.chart);

  @override Function get typeFactory => (f) => f<TotalTabledChartModel>();
}

extension TotalTabledChartModelMapperExtension  on TotalTabledChartModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  TotalTabledChartModelCopyWith<TotalTabledChartModel> get copyWith => TotalTabledChartModelCopyWith(this, $identity);
}

abstract class TotalTabledChartModelCopyWith<$R> {
  factory TotalTabledChartModelCopyWith(TotalTabledChartModel value, Then<TotalTabledChartModel, $R> then) = _TotalTabledChartModelCopyWithImpl<$R>;
  ListCopyWith<$R, TabledChartModel, TabledChartModelCopyWith<$R>>? get chart;
  $R call({List<TabledChartModel>? chart});
  $R apply(TotalTabledChartModel Function(TotalTabledChartModel) transform);
}

class _TotalTabledChartModelCopyWithImpl<$R> extends BaseCopyWith<TotalTabledChartModel, $R> implements TotalTabledChartModelCopyWith<$R> {
  _TotalTabledChartModelCopyWithImpl(TotalTabledChartModel value, Then<TotalTabledChartModel, $R> then) : super(value, then);

  @override ListCopyWith<$R, TabledChartModel, TabledChartModelCopyWith<$R>>? get chart => $value.chart != null ? ListCopyWith($value.chart!, (v, t) => TabledChartModelCopyWith(v, t), (v) => call(chart: v)) : null;
  @override $R call({Object? chart = $none}) => $then(TotalTabledChartModel(chart: or(chart, $value.chart)));
}

class ChartsUserChartModelMapper extends BaseMapper<ChartsUserChartModel> {
  ChartsUserChartModelMapper._();

  @override Function get decoder => decode;
  ChartsUserChartModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChartsUserChartModel fromMap(Map<String, dynamic> map) => ChartsUserChartModel(user: Mapper.i.$getOpt(map, 'user'), chart: Mapper.i.$getOpt(map, 'chart'));

  @override Function get encoder => (ChartsUserChartModel v) => encode(v);
  dynamic encode(ChartsUserChartModel v) => toMap(v);
  Map<String, dynamic> toMap(ChartsUserChartModel c) => {'user': Mapper.i.$enc(c.user, 'user'), 'chart': Mapper.i.$enc(c.chart, 'chart')};

  @override String stringify(ChartsUserChartModel self) => 'ChartsUserChartModel(user: ${Mapper.asString(self.user)}, chart: ${Mapper.asString(self.chart)})';
  @override int hash(ChartsUserChartModel self) => Mapper.hash(self.user) ^ Mapper.hash(self.chart);
  @override bool equals(ChartsUserChartModel self, ChartsUserChartModel other) => Mapper.isEqual(self.user, other.user) && Mapper.isEqual(self.chart, other.chart);

  @override Function get typeFactory => (f) => f<ChartsUserChartModel>();
}

extension ChartsUserChartModelMapperExtension  on ChartsUserChartModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChartsUserChartModelCopyWith<ChartsUserChartModel> get copyWith => ChartsUserChartModelCopyWith(this, $identity);
}

abstract class ChartsUserChartModelCopyWith<$R> {
  factory ChartsUserChartModelCopyWith(ChartsUserChartModel value, Then<ChartsUserChartModel, $R> then) = _ChartsUserChartModelCopyWithImpl<$R>;
  ChartUserModelCopyWith<$R>? get user;
  ChartModelCopyWith<$R>? get chart;
  $R call({ChartUserModel? user, ChartModel? chart});
  $R apply(ChartsUserChartModel Function(ChartsUserChartModel) transform);
}

class _ChartsUserChartModelCopyWithImpl<$R> extends BaseCopyWith<ChartsUserChartModel, $R> implements ChartsUserChartModelCopyWith<$R> {
  _ChartsUserChartModelCopyWithImpl(ChartsUserChartModel value, Then<ChartsUserChartModel, $R> then) : super(value, then);

  @override ChartUserModelCopyWith<$R>? get user => $value.user != null ? ChartUserModelCopyWith($value.user!, (v) => call(user: v)) : null;
  @override ChartModelCopyWith<$R>? get chart => $value.chart != null ? ChartModelCopyWith($value.chart!, (v) => call(chart: v)) : null;
  @override $R call({Object? user = $none, Object? chart = $none}) => $then(ChartsUserChartModel(user: or(user, $value.user), chart: or(chart, $value.chart)));
}

class ChartTimeduserstotalModelMapper extends BaseMapper<ChartTimeduserstotalModel> {
  ChartTimeduserstotalModelMapper._();

  @override Function get decoder => decode;
  ChartTimeduserstotalModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  ChartTimeduserstotalModel fromMap(Map<String, dynamic> map) => ChartTimeduserstotalModel(user: Mapper.i.$getOpt(map, 'user'), chart: Mapper.i.$get(map, 'chart'));

  @override Function get encoder => (ChartTimeduserstotalModel v) => encode(v);
  dynamic encode(ChartTimeduserstotalModel v) => toMap(v);
  Map<String, dynamic> toMap(ChartTimeduserstotalModel c) => {'user': Mapper.i.$enc(c.user, 'user'), 'chart': Mapper.i.$enc(c.chart, 'chart')};

  @override String stringify(ChartTimeduserstotalModel self) => 'ChartTimeduserstotalModel(user: ${Mapper.asString(self.user)}, chart: ${Mapper.asString(self.chart)})';
  @override int hash(ChartTimeduserstotalModel self) => Mapper.hash(self.user) ^ Mapper.hash(self.chart);
  @override bool equals(ChartTimeduserstotalModel self, ChartTimeduserstotalModel other) => Mapper.isEqual(self.user, other.user) && Mapper.isEqual(self.chart, other.chart);

  @override Function get typeFactory => (f) => f<ChartTimeduserstotalModel>();
}

extension ChartTimeduserstotalModelMapperExtension  on ChartTimeduserstotalModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ChartTimeduserstotalModelCopyWith<ChartTimeduserstotalModel> get copyWith => ChartTimeduserstotalModelCopyWith(this, $identity);
}

abstract class ChartTimeduserstotalModelCopyWith<$R> {
  factory ChartTimeduserstotalModelCopyWith(ChartTimeduserstotalModel value, Then<ChartTimeduserstotalModel, $R> then) = _ChartTimeduserstotalModelCopyWithImpl<$R>;
  ChartUserModelCopyWith<$R>? get user;
  ListCopyWith<$R, ChartModel, ChartModelCopyWith<$R>> get chart;
  $R call({ChartUserModel? user, List<ChartModel>? chart});
  $R apply(ChartTimeduserstotalModel Function(ChartTimeduserstotalModel) transform);
}

class _ChartTimeduserstotalModelCopyWithImpl<$R> extends BaseCopyWith<ChartTimeduserstotalModel, $R> implements ChartTimeduserstotalModelCopyWith<$R> {
  _ChartTimeduserstotalModelCopyWithImpl(ChartTimeduserstotalModel value, Then<ChartTimeduserstotalModel, $R> then) : super(value, then);

  @override ChartUserModelCopyWith<$R>? get user => $value.user != null ? ChartUserModelCopyWith($value.user!, (v) => call(user: v)) : null;
  @override ListCopyWith<$R, ChartModel, ChartModelCopyWith<$R>> get chart => ListCopyWith($value.chart, (v, t) => ChartModelCopyWith(v, t), (v) => call(chart: v));
  @override $R call({Object? user = $none, List<ChartModel>? chart}) => $then(ChartTimeduserstotalModel(user: or(user, $value.user), chart: chart ?? $value.chart));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
