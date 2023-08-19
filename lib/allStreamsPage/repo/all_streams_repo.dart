import 'package:streamme/allStreamsPage/models/agora_model.dart';
import 'package:streamme/allStreamsPage/models/stream_model.dart';
import 'package:streamme/core/errors/failures.dart';
import 'package:streamme/core/helpers/pagination_handler.dart';
import 'package:streamme/core/repo/repo.dart';
import 'package:dartz/dartz.dart';

class AllStreamsRepo extends Repository {
  PaginationHandler paginationHandler = PaginationHandler();

  Future<Either<Failure, List<StreamModel>>> getAllStreams() async {
    return await exceptionHandler<List<StreamModel>>(
      () async {
        final result =
            await dioHelper.getData("stream${paginationHandler.parameters}");
        if (result["data"] is List) {
          paginationHandler.handlingPaginationFromJson(result["pagination"]);
          return result["data"]
              .map<StreamModel>((e) => StreamModel.fromJson(e))
              .toList();
        }
        return [];
      },
    );
  }

  Future<Either<Failure, AgoraModel>> createStream() async {
    return await exceptionHandler<AgoraModel>(
      () async {
        final result = await dioHelper.postData("stream/create", {});
        return AgoraModel.fromJson(result["data"]);
      },
    );
  }

  Future<Either<Failure, AgoraModel>> joinStream(
      StreamModel streamModel) async {
    return await exceptionHandler<AgoraModel>(
      () async {
        print(streamModel.channelName);
        final result = await dioHelper.postData("stream/join", {
          "channelName": streamModel.channelName,
        });
        return AgoraModel.fromJson(result["data"]);
      },
    );
  }
}
