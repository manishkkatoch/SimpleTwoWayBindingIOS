//
//  UIControls+Bindable.swift
//  SimpleTwoWayBinding
//
//  Created by Manish Katoch on 11/26/17.
//

import Foundation

extension UITextField : Bindable {
    public typealias BindingType = String
    
    public func observingValue() -> String? {
        return self.text
    }
    
    public func updateValue(with value: String) {
        self.text = value
    }
}

extension UISwitch : Bindable {
    public typealias BindingType = Bool
    
    public func observingValue() -> Bool? {
        return self.isOn
    }
    
    public func updateValue(with value: Bool) {
        self.isOn = value
    }
}

extension UISlider : Bindable {
    public typealias BindingType = Float
    
    public func observingValue() -> Float? {
        return self.value
    }
    
    public func updateValue(with value: Float) {
        self.value = value
    }
}

extension UIStepper : Bindable {
    public typealias BindingType = Double
    
    public func observingValue() -> Double? {
        return self.value
    }
    
    public func updateValue(with value: Double) {
        self.value = value
    }
}

public class BindableTextView: UITextView, Bindable, UITextViewDelegate {
    public typealias BindingType = String
    
    public func observingValue() -> String? {
        return self.text
    }
    
    public func updateValue(with value: String) {
        self.text = value
    }
    
    public func bind(with observable: Observable<String>) {
        self.delegate = self
        self.register(for: observable)
        self.observe(for: observable) { (value) in
            self.updateValue(with: value)
        }
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        self.valueChanged()
    }
}
