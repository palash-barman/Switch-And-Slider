import 'package:bloc/bloc.dart';
import 'package:switch_slider/bloc/switch&slider/switch_slider_event.dart';
import 'package:switch_slider/bloc/switch&slider/switch_slider_state.dart';

class SwitchSliderBloc extends Bloc<SwitchSliderEvent,SwitchSliderState>{
  SwitchSliderBloc():super(SwitchSliderState()){
    on<SwitchEnableOrDisableEvent>(_switch);
    on<SliderEvent>(_slider);
  }

  _switch(SwitchEnableOrDisableEvent event , Emitter<SwitchSliderState> emit){
    emit(state.copyWith(switchValue: !state.switchValue));
  }

  _slider(SliderEvent event , Emitter<SwitchSliderState> emit){
    emit(state.copyWith(sliderValue:event.value));
  }

}