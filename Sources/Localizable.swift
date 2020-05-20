//
//  LocalizationConfigurable.swift
//  LocalizeX
//
//  Created by Prashant Shrestha on 5/20/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public protocol LocalizationConfigurable {
    func languageChanged()
}


public extension LocalizationConfigurable {
    func registerForLocalizeEvent() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(LCLLanguageChangeNotification), object: nil, queue: nil) {  (notification) in
            self.languageChanged()
        }
    }
    
    func unregisterForThemeEvent() {
        NotificationCenter.default.removeObserver(self)
    }
}
