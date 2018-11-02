//
//  CountryPhoneNumberTextField.swift
//  CountryPhoneNumberTextField
//
//  Created by Jonathan Arnal on 22/10/2018.
//  Copyright © 2018 CountryPhoneNumberTextField. All rights reserved.
//

import UIKit
import PhoneNumberKit
import SnapKit
import CountryPickerTextfield

@IBDesignable
open class CountryPhoneNumberTextField: PhoneNumberTextField, CountryContextable {
    
    //****************************************************
    // MARK: - TextField Country Contextable Boilerplate
    //****************************************************
    
    @IBInspectable
    open var buttonTextColor: UIColor? = UIColor.black {
        didSet {
            countryLeftView?.buttonTextColor = buttonTextColor
        }
    }
    
    @IBInspectable
    open var toolbarTintColor: UIColor? = UIColor.red {
        didSet {
            countryLeftView?.toolbarTintColor = toolbarTintColor
        }
    }
    
    // If the textfield has a previous input accessory view, it will here
    public var previousInputAccessoryView: UIView?
    
    // TextField custom left view
    public var countryLeftView: CountryLeftView?
    
    // Delegate
    public weak var countryEventDelegate: CountryContextableDelegate?
    
    open override var inputAccessoryView: UIView? {
        didSet {
            if countryLeftView?.isCountryToolbar(thisAccessoryView: inputAccessoryView) == false {
                previousInputAccessoryView = inputAccessoryView
            }
        }
    }
    
    //****************************************************
    // MARK: - Country Contextable Initialization Conformance
    //****************************************************
    
    public required convenience init(forceRegionTo region: String?, buttonTitleMode: CountryButtonTitleMode = .none) {
        self.init(frame: CGRect.zero)
        self.countryLeftView = buildCountryLeftView(forceRegionTo: region, buttonTitleMode: buttonTitleMode)
        setupUI()
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.countryLeftView = buildCountryLeftView(forceRegionTo: nil, buttonTitleMode: .none)
        setupUI()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.countryLeftView = buildCountryLeftView(forceRegionTo: nil, buttonTitleMode: .none)
        setupUI()
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resignFirstResponder()
        self.userDidChangeInputMode(inputView: nil, inputAccessoryView: nil)
        self.becomeFirstResponder()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        countryLeftView?.frame = CGRect(x: 0, y: 0, width: leftViewMinSize.width, height: self.bounds.height)
    }
    
    open override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: leftViewMinSize.width, height: self.bounds.height)
    }
    
    open override func caretRect(for position: UITextPosition) -> CGRect {
        return countryLeftView?.isCountryToolbar(thisAccessoryView: inputAccessoryView) == false ? super.caretRect(for: position) : CGRect.zero
    }
    
    //****************************************************
    // MARK: - Variables
    //****************************************************
    
    /// Each time the text is set we try to format it and retrieve the related country
    open override var text: String? {
        set {
            let (finalText, country) = parseInput(input: newValue)
            if let unwrappedCountry = country {
                countryLeftView?.updateCountry(unwrappedCountry)
                defaultRegion = unwrappedCountry.code
            }
            super.text = finalText
        }
        get { return super.text }
    }
    
    /// Return the phone number in international format (+33 XXXXXXXXXX)
    open var formattedText: String? {
        if let unwrappedText = self.text, let currentCountry = selectedCountry {
            return Tools.formatToInternationalNumber(unwrappedText, forRegion: currentCountry.code)
        }
        return nil
    }
    
    //****************************************************
    // MARK: - User Interface
    //****************************************************
    
    /// Update place holder with an example of phone number
    /// FIXME: implementation
    private func updatePlaceholder() {
        //🌪
    }
    
    /// 👆 Handles when user has selected a country
    ///
    /// - Parameter country: selected country
    public func didSelectCountry(_ country: CountryCode) {
        defaultRegion = country.code
        self.text = formattedText
    }
    
    //****************************************************
    // MARK: - Business
    //****************************************************
    
    /// 🧠 Returns a formatted phone number and a country based on the input passed in parameter
    ///
    /// - Parameter input: base phone number
    /// - Returns: tuple with formatted text and related country
    private func parseInput(input: String?) -> (String?, CountryCode?) {
        
        guard let unwrappedInput = input else { return (nil, nil) }
        
        if unwrappedInput.first == "+", let getDialCode = Tools.getDialCode(forPhoneNumber: unwrappedInput), let phoneCountry = countryLeftView?.getCountry(withDialCode: getDialCode) {
            return (getFinalText(baseText: unwrappedInput, andCountry: phoneCountry), phoneCountry)
        } else if let currentCountry = selectedCountry {
            return (getFinalText(baseText: unwrappedInput, andCountry: currentCountry), currentCountry)
        } else {
            return (input, nil)
        }
    }
    
    /// Formats a string into a national formatted one
    ///
    /// - Parameters:
    ///   - baseText: base phone text
    ///   - country: country to wich the formatted phone number should be converted
    /// - Returns: final text in national format (without dial code
    private func getFinalText(baseText: String, andCountry country: CountryCode) -> String {
        guard let formattedText = Tools.formatToNationalNumber(baseText, forRegion: country.code) else {
            return baseText
        }
        return formattedText
    }
    
}
