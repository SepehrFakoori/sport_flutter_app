import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/user_case/get_class_usecase.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_event.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final GetClassUseCase getClass;

  ClassBloc(this.getClass) : super(const InitState()) {
    on<GetClass>(_onGetClass);
  }

  Future<void> _onGetClass(GetClass event, Emitter<ClassState> emit) async {
    try {
      emit(const LoadingState());
      final Class classItem = await getClass.call(event.id);
      emit(SuccessState(classItem));
    } on AppException {
      emit(FailureState());
    }
  }
}
