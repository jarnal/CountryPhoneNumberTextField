//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CountryPhoneNumberTextField

//****************************************************
// MARK: - Container
//****************************************************

class ContainerView: UIViewController {
    
    lazy var textField: CountryPhoneNumberTextField = {
        return CountryPhoneNumberTextField(forceRegionTo: "", buttonTitleMode: .none)
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.view.addSubview(textField)
        
        textField.backgroundColor = UIColor.white
        textField.buttonTextColor = UIColor.black
        textField.toolbarTintColor = UIColor.black
        
//        textField.include(countryCodes: ["FR"])
//        textField.exclude(countryCodes: ["AF"])
        textField.prioritize(countryCodes: ["FR", "DE", "CH"])
        textField.borderStyle = .roundedRect
        
        textField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
//            make.height.equalTo(80)
        }
        
        self.textField.text = "+33 075 888 88 88"
    }
}

//****************************************************
// MARK: - Building
//****************************************************

let containerView = ContainerView()
containerView.preferredContentSize = containerView.view.frame.size

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = containerView
