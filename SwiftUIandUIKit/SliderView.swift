//
//  Slider.swift
//  SwiftUIandUIKit
//
//  Created by Ekaterina Kugeneva on 01.02.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {

    @Binding var value : Double
    @Binding var targetValue : Int

    class Coordinator: NSObject {
        var sliderView: SliderView

        init(_ sliderView: SliderView) {
            self.sliderView = sliderView
        }

        @objc func valueChanged(_ slider: UISlider) {
            sliderView.value = Double(slider.value)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0.00
        slider.maximumValue = 100.00
        slider.value = Float(value)
        slider.thumbTintColor = .red
        slider.addTarget(
             context.coordinator,
             action: #selector(Coordinator.valueChanged(_:)),
             for: .valueChanged
           )

        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {

    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(100),targetValue: .constant(100))
        
    }
}
