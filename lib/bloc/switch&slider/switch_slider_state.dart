import 'package:equatable/equatable.dart';

class SwitchSliderState extends Equatable{
 final bool switchValue;
 final double sliderValue;
  const SwitchSliderState({this.switchValue=false,this.sliderValue=1.0});

  SwitchSliderState copyWith({bool? switchValue,double? sliderValue}){
    return SwitchSliderState(sliderValue: sliderValue??this.sliderValue,switchValue: switchValue??this.switchValue);
  }

  @override
  List<Object?> get props => [switchValue,sliderValue];
}