import 'package:dartz/dartz.dart';
import 'package:guia_de_moteis_go_replica/core/errors/failure.dart';

typedef DataMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
