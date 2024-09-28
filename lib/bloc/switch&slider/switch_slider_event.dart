import 'package:equatable/equatable.dart';

abstract class SwitchSliderEvent extends Equatable{



  @override
  List<Object> get props=>[];
}

class SwitchEnableOrDisableEvent extends SwitchSliderEvent{

}
class SliderEvent extends SwitchSliderEvent{
  final double value;
  SliderEvent({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value];

}