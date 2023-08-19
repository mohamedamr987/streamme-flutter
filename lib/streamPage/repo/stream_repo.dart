import 'package:streamme/allStreamsPage/models/agora_model.dart';
import 'package:streamme/allStreamsPage/models/stream_model.dart';
import 'package:streamme/core/errors/failures.dart';
import 'package:streamme/core/helpers/pagination_handler.dart';
import 'package:streamme/core/repo/repo.dart';
import 'package:dartz/dartz.dart';

class StreamRepo extends Repository{
  Future<Either<Failure, void>> deleteStream(AgoraModel agoraModel) async {
    return await exceptionHandler(
      () async {
        final result = await dioHelper.delData("stream/delete/${agoraModel.streamModel.id}");
      },
    );
  }
}