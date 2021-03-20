//
//  Localizable.swift
//  LocalizeX
//
//  Created by Prashant Shrestha on 5/20/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

public protocol Localizable: class {
    func languageChanged()
}


public extension Localizable {
    func registerForLocalizeEvent() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(LCLLanguageChangeNotification), object: nil, queue: nil) { [unowned self] (notification) in
            self.languageChanged()
        }
    }
    
    func unregisterForThemeEvent() {
        NotificationCenter.default.removeObserver(self)
    }
}
