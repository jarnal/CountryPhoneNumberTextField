Pod::Spec.new do |s|
  s.name         = "CountryPhoneNumberTextField"
  s.version      = "0.1"
  s.summary      = "TextField with country selection capability allowing to format phone numbers"
  s.description  = <<-DESC
    Textfield allowing to parse/format/validate international phone numbers and to select related country.
  DESC
  s.homepage     = "https://github.com/jarnal/CountryPhoneNumberTextField"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jonathan Arnal" => "jonathan.arnal89@gmail.com" }
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/jarnal/CountryPhoneNumberTextField.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
  s.dependency 'SnapKit'
  s.dependency 'PhoneNumberKit'
  s.dependency 'CountryPickerTextfield'
end
