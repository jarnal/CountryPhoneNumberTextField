# Uncomment the next line to define a global platform for your project
platform :ios, '10.3'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/jarnal/PodsRepository.git'

def shared_pods
    pod 'PhoneNumberKit', '~> 2.1'
    pod 'SnapKit', '~> 4.0.0'
    pod 'CountryPickerTextfield', '~> 0.6'
end

target 'CountryPhoneNumberTextField-iOS' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CountryPhoneNumberTextField-iOS
  shared_pods

  target 'CountryPhoneNumberTextField-iOS Tests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'CountryPhoneNumberTextField' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    
    # Pods for CountryPhoneNumberTextField-iOS
    shared_pods
    
end
