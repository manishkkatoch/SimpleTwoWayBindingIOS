//
//  FormViewModel.swift
//  SimpleTwoWayBinding_Example
//
//  Created by Manish Katoch on 11/26/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import SimpleTwoWayBinding

struct FormViewModel {
    let name: Observable<String> = Observable()
    let companyName: Observable<String> = Observable()
    let yearsOfExperience: Observable<Double> = Observable()
    let isCurrentEmployer: Observable<Bool> = Observable(false)
    let approxSalary: Observable<Float> = Observable()
    let comments: Observable<String> = Observable()
    
    func getExperienceString() -> String {
        if let yearsOfExperience = yearsOfExperience.value {
            return "\(String(describing: yearsOfExperience)) yrs"
        }
        return "--"
    }
    
    func getSalaryString() -> String {
        if let approxSalary = approxSalary.value {
            let normalizedValue = approxSalary / 1000.0
            return "\(normalizedValue)k"
            
        }
        return "--"
    }
    
    func getPrettyString() -> String {
        return
            "Name: \(String(describing: name.value ?? "--"))\n" +
            "Company: \(String(describing: companyName.value ?? "--"))\n" +
            "Experience: \(getExperienceString())\n" +
            "Current Employer?: \(((isCurrentEmployer.value ?? false) ? "YES" : "NO"))\n" +
            "approx Salary: \(getSalaryString())\n" +
            "Comments: \(String(describing: comments.value ?? "--"))"
    }
}
