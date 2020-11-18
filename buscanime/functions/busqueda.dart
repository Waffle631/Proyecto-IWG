import 'package:built_collection/built_collection.dart';
import 'package:buscanime/jikan_api.dart';

Future<BuiltList<Search>> buscar(String str) async {
  var jikan = Jikan();
  var busqueda = await jikan.search(str, SearchType.anime);
  return busqueda;
}

Future<void> main() async {
  var a = await buscar("slam");
  print(a.first);
}
