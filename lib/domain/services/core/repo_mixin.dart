mixin RepoStyleMixin<Dto, Res> {
  Future<List<Res>> fetch();
  Future<List<Res>> fetchById(String id);
  Future<Res?> getById(String id);
  Future<void> add(Dto dto);
  Future<void> patch(Dto dto);
  Future<void> delete(Dto dto);
}
