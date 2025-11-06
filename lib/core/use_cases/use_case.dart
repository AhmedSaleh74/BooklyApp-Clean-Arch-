import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class UseCase<Type, Parameter> {
  Future<Either<Failure, Type>> call([Parameter parameter]);
}
