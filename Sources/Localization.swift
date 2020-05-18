//
//  Localization.swift
//  LocalizationF
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import Foundation

open class Localization {
    
    public static var standard: Localization {
        return Localization()
    }
    
    public var availableLanguages: [Language] {
        return Localize
            .availableLanguages()
            .filter({ $0 != "Base" })
            .map({
                Language(languageCode: $0,
                         apiLanguageCode: apiLanguageCode($0),
                         flagUrl: flagURL($0),
                         displayName: Localize.displayNameForLanguage($0),
                         displayNameInEnglish: displayNameInEnglish($0),
                         isSelected: Localize.currentLanguage() == $0)
            })
    }

    public func setCurrentLanguage(_ language: Language) {
        Localize.setCurrentLanguage(language.languageCode)
    }
    
    func displayNameInEnglish(_ language: String) -> String {
        let locale : NSLocale = NSLocale(localeIdentifier: "en")
        if let displayName = locale.displayName(forKey: NSLocale.Key.identifier, value: language) {
            return displayName
        }
        return String()
    }
    
    public func currentLanguage() -> Language {
        let currentLanguageCode = Localize.currentLanguage()
        return Language(languageCode: currentLanguageCode,
                        apiLanguageCode: apiLanguageCode(currentLanguageCode),
                        flagUrl: flagURL(currentLanguageCode),
                        displayName: Localize.displayNameForLanguage(currentLanguageCode),
                        displayNameInEnglish: displayNameInEnglish(currentLanguageCode),
                        isSelected: true)
    }
    
    public func apiLanguageCode(_ code: String) -> String {
        switch code {
        case "en":
            return "en"
        case "ja":
            return "jp"
        case "vi":
            return "vn"
        case "pt-BR":
            return "br"
        case "id":
            return "id"
        default:
            return "en"
        }
    }
    
    public func flagURL(_ code: String) -> URL {
        var flagCode = code
        switch code {
        case "en":
            flagCode = "united_kingdom"
        case "ja":
            flagCode = "japan"
        case "vi":
            flagCode = "vietnam"
        case "pt-BR":
            flagCode = "brazil"
        case "id":
            flagCode = "indonesia"
        default:
            flagCode = code
        }
        // https://img.freeflagicons.com/thumb/round_icon/afghanistan/afghanistan_640.png
        // https://cdn.countryflags.com/thumbs/united-kingdom/flag-3d-round-500.png
        return URL(string: "https://img.freeflagicons.com/thumb/round_icon/\(flagCode)/\(flagCode)_640.png")!
    }
    
}


public struct Language {
    public let languageCode: String
    public let apiLanguageCode: String
    public let flagUrl: URL
    public let displayName: String
    public let displayNameInEnglish: String
    public let isSelected: Bool
}
