import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/no_parameter_use_case.dart' show UseCase;
import '../entities/book_entity.dart';

class GetFeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;
  GetFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    //check permissions

    //fetch data
    return await homeRepo.getFeaturedBooks();
  }
}
