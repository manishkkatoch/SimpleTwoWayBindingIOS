# SimpleTwoWayBinding for iOS

[![Version](https://img.shields.io/cocoapods/v/SimpleTwoWayBinding.svg?style=flat)](http://cocoapods.org/pods/SimpleTwoWayBinding)
[![License](https://img.shields.io/cocoapods/l/SimpleTwoWayBinding.svg?style=flat)](http://cocoapods.org/pods/SimpleTwoWayBinding)
[![Platform](https://img.shields.io/cocoapods/p/SimpleTwoWayBinding.svg?style=flat)](http://cocoapods.org/pods/SimpleTwoWayBinding)

## The Need

**MVVM**? why not *MVC* that Apple recommends? Android does *MVP* great right? How about the cool *VIPER* pattern? I believe [great efforts](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52) have already been put to explain what each pattern brings to the table and so the idea here is not to add to the debate but merely build on top of the opinion I have already formed: _**MVVM is the way to go.**_

As a quick primer to what MVVM is, it is a design pattern whereby the *ViewModel* mediates between a data providing *Model* and *View* which displays the data provided like shown below:


![mvvm diag](https://github.com/manishkkatoch/SimpleTwoWayBindingIOS/blob/master/doc/diag.jpeg)


in iOS, *View is essentially a ViewController* and ViewModel is an object (a structure) which provides exact data for the view to render.

This provides a loosely coupled architecture which is maintainable ( very thin view controllers ) and testable (ViewModel abstracts out the UI and hence is easily testable)

There is still a caveat though: _classic MVVM allows for single responsibility principle easily (and beautifully) in case of models as domain models. However, in case of anaemic models ( which is generally the case when you have well written REST APIs), one would also need another Mediator or Presenter which facilitates data and navigation flow._

Now, View Model has responsibility to update View as well as get updates from View regarding the changes made by the user. This can be achieved by minimum code using bi-directional data binding.
But … _**iOS has no two way binding mechanism available out of the box!**_

Luckily we have reactive libraries like *RxSwift, RxCocoa* but they are too heavy considering two way binding is a very tiny part of the Reactive Programming paradigm. _**SimpleTwoWayBinding strives to provide just two way binding, in a simple unassuming way!**_

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Creating ViewModel

```swift
import SimpleTwoWayBinding

struct FormViewModel {
    let name: Observable<String> = Observable()
    let companyName: Observable<String> = Observable()
    let yearsOfExperience: Observable<Double> = Observable()
    let isCurrentEmployer: Observable<Bool> = Observable(false)
    let approxSalary: Observable<Float> = Observable()
    let comments: Observable<String> = Observable()
}
```
The properties you want to be "bindable" to the View should be declared as Observable.

### Binding to ViewController
```swift
class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var isCurrentEmployerSwitch: UISwitch!
    @IBOutlet weak var yearsOfExperienceStepper: UIStepper!
    @IBOutlet weak var salaryRangeSlider: UISlider!
    @IBOutlet weak var selectedSalaryRangeLabel: UILabel!
    @IBOutlet weak var selectedYearsOfExperienceLabel: UILabel!
    
    var viewModel: FormViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Survey Form"
        setupBindings()
    }
    
    func setupBindings() {
        nameField.bind(with: viewModel.name)
        companyField.bind(with: viewModel.companyName)
        isCurrentEmployerSwitch.bind(with: viewModel.isCurrentEmployer)
        yearsOfExperienceStepper.bind(with: viewModel.yearsOfExperience)
        salaryRangeSlider.bind(with: viewModel.approxSalary)
      
        selectedSalaryRangeLabel.observe(for: viewModel.approxSalary) {
            [unowned self](_) in
            self.selectedSalaryRangeLabel.text =
                self.viewModel.getSalaryString()
        }
        
        selectedYearsOfExperienceLabel.observe(for: viewModel.yearsOfExperience) {
            [unowned self](_) in
            self.selectedYearsOfExperienceLabel.text =
                self.viewModel.getExperienceString()
        }
    }
}
```
The ```bind``` method on the UIControl orchestrates the two way binding with the Observable. That's all code that is needed to get the form working. See below screen shot.

![working sample](https://thumbs.gfycat.com/MealyThirdItaliangreyhound-size_restricted.gif)


## Installation

SimpleTwoWayBinding is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimpleTwoWayBinding'
```

## Author

Manish Katoch, manish.katoch@gmail.com

## License

SimpleTwoWayBinding is available under the MIT license. See the LICENSE file for more info.
