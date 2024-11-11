import 'package:flutter_bloc/flutter_bloc.dart';

part 'light_state.dart';

class LightCubit extends Cubit<LightState> {
  LightCubit() : super(LightOff());   

  void toggleLight() {
    if (state is LightOff) {
      emit(LightOn());   
    } else {
      emit(LightOff()); 
    }
  }
}
