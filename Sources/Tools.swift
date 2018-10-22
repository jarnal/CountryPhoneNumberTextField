//
//  Tools.swift
//  CountryPhoneNumberTextField
//
//  Created by Jonathan Arnal on 22/10/2018.
//  Copyright © 2018 CountryPhoneNumberTextField. All rights reserved.
//

import UIKit
import PhoneNumberKit

class Tools {
    
    private static let phoneNumberKit = PhoneNumberKit()
    
    static var userRegionCode: String? {
        return Locale.current.regionCode
    }
    
    public static func getDialCode(forPhoneNumber phoneNumber: String) -> String? {
        
        if let phoneNumber = try? phoneNumberKit.parse(phoneNumber) {
            return "+\(phoneNumber.countryCode)"
        }
        return nil
    }
    
    public static func formatToNationalNumber(_ text: String, forRegion region: String) -> String? {
        return formatText(text, forRegion: region, intoFormat: .national)
    }
    
    public static func formatToInternationalNumber(_ text: String, forRegion region: String) -> String? {
        return formatText(text, forRegion: region, intoFormat: .international)
    }
    
    private static func formatText(_ text: String, forRegion region: String, intoFormat format: PhoneNumberFormat) -> String? {
        
        if let phoneNumber = try? phoneNumberKit.parse(text, withRegion: region, ignoreType: true) {
            return phoneNumberKit.format(phoneNumber, toType: format).replacingOccurrences(of: " ", with: "")
        }
        return nil
    }
    
}
