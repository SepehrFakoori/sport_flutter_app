import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/extension/result_extensions.dart';
import 'package:sport_flutter_app/features/class/domain/user_case/get_class_usecase.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_event.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final GetClassUseCase getClass;

  ClassBloc(this.getClass) : super(const InitState()) {
    on<GetClass>(_onGetClass);
  }

  Future<void> _onGetClass(GetClass event, Emitter<ClassState> emit) async {
    emit(const LoadingState());

    final result = await getClass.call(event.id);

    result.when(
      success: (classItem) => emit(SuccessState(classItem)),
      error: (failure) => emit(FailureState()),
    );
  }
}
