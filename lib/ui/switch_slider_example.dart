import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_slider/bloc/switch&slider/switch_slider_bloc.dart';
import 'package:switch_slider/bloc/switch&slider/switch_slider_event.dart';
import 'package:switch_slider/bloc/switch&slider/switch_slider_state.dart';

class SwitchAndSlider extends StatefulWidget {
  const SwitchAndSlider({super.key});

  @override
  State<SwitchAndSlider> createState() => _SwitchAndSliderState();
}

class _SwitchAndSliderState extends State<SwitchAndSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch And Slider"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Notification"),
              BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
                  buildWhen: (previous, current) =>
                      previous.switchValue != current.switchValue,
                  builder: (context, state) {
                    return Switch(
                        value: state.switchValue,
                        onChanged: (v) {
                          context
                              .read<SwitchSliderBloc>()
                              .add(SwitchEnableOrDisableEvent());
                        });
                  })
            ],
          ),
          BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Container(
                    height: 200,
                    color: Colors.red.withOpacity(state.sliderValue));
              }),
          BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Slider(
                    value: state.sliderValue,
                    onChanged: (v) {
                      context
                          .read<SwitchSliderBloc>()
                          .add(SliderEvent(value: v));
                    });
              })
        ],
      ),
    );
  }
}
