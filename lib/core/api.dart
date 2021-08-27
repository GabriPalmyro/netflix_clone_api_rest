import 'package:dio/dio.dart';

const kBaseUrl = 'https://api.themoviedb.org/3';
const kApiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMTFiYWQ0Mjg1MjE5ODExZjM2ZmFmYjNlMDRkMmJiOSIsInN1YiI6IjYxMjU1MjVkODI1OGZjMDA3ZGY2OTQ5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lCisHopP3h3_UIBxviY4D9uo5C8KxU03v0zH0NrAduo';

const kServerError =
    'Falha ao conectar ao servidor. Tente novamente mais tarde.';

final kDioOptions = BaseOptions(
    baseUrl: kBaseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: 'application/json;charset=utf-8',
    headers: {'Authorization': 'Bearer $kApiKey'});
