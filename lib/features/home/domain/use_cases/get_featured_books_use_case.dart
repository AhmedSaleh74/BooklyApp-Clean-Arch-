import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

class GetFeaturedBooksUseCase {
  final HomeRepo homeRepo;
  GetFeaturedBooksUseCase({required this.homeRepo});
  Future<Either<Failure, List<BookEntity>>> getFeaturedBooks() {
    //check permissions

    //fetch data
    return homeRepo.getFeaturedBooks();
  }
}
