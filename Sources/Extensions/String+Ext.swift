//
//  String+Ext.swift
//  LocalizationF
//
//  Created by Prashant Shrestha on 5/18/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import Foundation

public extension String {
    func commaFormattedValue(roundBy: Int? = nil) -> String {
        guard let largeNumber = Double(self) else {
            return self
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = roundBy ?? 2
        numberFormatter.minimumFractionDigits = roundBy ?? 2
        let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
        return formattedNumber ?? self
    }
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
        let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
        return String(cleanedUpCopy.enumerated().map() {
            $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
            }.joined().dropFirst())
    }
}
