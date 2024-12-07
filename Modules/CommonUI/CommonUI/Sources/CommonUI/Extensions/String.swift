//
//  String+Localized.swift
//  
//
//  Created by Uwais Alqadri on 10/17/21.
//

import Foundation
import SwiftUI

public extension String {
  func ifEmpty(fallback: () -> String) -> String {
    return isEmpty ? fallback() : self
  }
  
  var cgFloat: CGFloat {
    guard let doubleValue = Double(self) else {
      return 0.0
    }
    return CGFloat(doubleValue/2)
  }
  
  func stringToDate() -> Date? {
    /*
     You just have to list all known formats that you got from the API :)
     */
    let knownFormats = [
      "yyyy-MM-dd HH:mm:ss",
      "yyyy-MM-dd hh:mm:ss",
      "yyyy-MM-dd HH:mm",
      "d MMM yyyy",
      "yyyy-MM-dd",
      "dd-MM-yyyy",
      "yyyy-MM-dd'T'HH:mm:ssZ",
      "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXX",
      "yyyy-MM-dd'T'HH:mm:ssXXX"
    ]
    
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    for format in knownFormats {
      formatter.dateFormat = format
      if let formatted =  formatter.date(from: self) {
        return formatted
      }
    }
    
    return nil
  }
  
}
