abstract class DatabaseOperations<T> {
  Future<int> create(T object);

  Future<List<T>> read([int? id]);

  Future<T?> show(int id);

  Future<bool> delete(int id);

  Future<bool> update(T object);
}
