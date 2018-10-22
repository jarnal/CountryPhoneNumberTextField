# CountryPhoneNumberTextField

Textfield allowing to parse/format/validate international phone numbers and to select related country.

It combines the awesome [PhoneNumberKit](https://github.com/marmelroy/PhoneNumberKit) with my [CountryPickerTextfield
](https://github.com/jarnal/CountryPickerTextfield).

## ⬇️ Installation

### Cocoapods

Add my personal repo to your Podfile:

```ruby
source 'https://github.com/jarnal/PodsRepository.git'
```

Add the following line to your Podfile::

```ruby
pod "CountryPhoneNumberTextField"
```

Soon il will be directly available in cocoapods repo.

## 📲 Example

This framework was built using [Playground Driven Development](https://medium.com/flawless-app-stories/playground-driven-development-in-swift-cf167489fe7b).

Compile `CountryPhoneNumberTextField ` target for `Generic iOS Device` first.
Compile it for at least one simulator device if you want to use it in playground.

Enjoy 🎉 !

## 🔦 How does it work ?

```swift

// If you want to use user locale language as default country just instantiate:
let textField = CountryPhoneNumberTextField()

// You can force the language by setting 'forceRegionTo' in constructor:
let textField = CountryPhoneNumberTextField(forceRegionTo: "FR")

// You can choose the type of label that you want to display next to country flag by setting buttonTitleMode:
let textField = CountryPhoneNumberTextField(forceRegionTo: "ES", buttonTitleMode: .iso_code)
```

Or you can just inherit from CountryPhoneNumberTextField in Storyboard.

## 👂 Events

If you subclass CountryPhoneNumberTextField you have access to multiple events where you can add custom logic:

```swift

func userDidChangeInputMode(inputView: UIView?, inputAccessoryView: UIView?) {...}

func didStartPickingCountry(){...}

func didEndPickingCountry(){...}

func didSelectCountry(_ country: CountryCode) {...}
```

## 💅 Customize

💣 You can exlude countries from the list:

```
textField.exclude(countryCodes: ["FR"])
```

💯 You can prioritize some countries to display on top of the list:

```
textField.prioritize(countryCodes: ["ES", "DE"])
```

👌 Or you can simply pass the countries that you want to display:

```
textField.include(countryCodes: ["ES", "FR", "DE"])
```

🎨 You can customize the color of the flag button label:

```swift
textField.buttonTextColor = UIColor.myColor
```

🎨 You can customize the color of the input accessory view buttons:

```swift
textField.toolbarTintColor = UIColor.myColor
```

## 🗣 Discussion

📩 If you have a suggestion or any ideas to improve this project, email me at jonathan.arnal89@gmail.com.
