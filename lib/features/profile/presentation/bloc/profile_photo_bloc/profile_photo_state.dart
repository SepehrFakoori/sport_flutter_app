import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/core/error/failure.dart';

enum SubmissionStatus { idle, loading, success, failure }

class ProfilePhotoState extends Equatable {
  final SubmissionStatus status;
  final File? pickedFile;
  final double uploadProgress;
  final Failure? failure;

  const ProfilePhotoState({
    this.status = .idle,
    this.pickedFile,
    this.uploadProgress = 0.0,
    this.failure,
  });

  ProfilePhotoState copyWith({
    SubmissionStatus? status,
    File? pickedFile,
    double? uploadProgress,
    Failure? failure,
  }) => ProfilePhotoState(
    status: status ?? this.status,
    pickedFile: pickedFile ?? this.pickedFile,
    uploadProgress: uploadProgress ?? this.uploadProgress,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, pickedFile, uploadProgress, failure];
}
