//
//  DICMTypes.swift
//  mllp
//
//  Created by cbaeza on 3/15/19.
//

import Foundation

public struct DICMTypes {
    
    public static let TX: NSRegularExpression = try! NSRegularExpression(pattern: #"^[+-][0-2][0-9][0-5][0-9]$"#, options: [])
    public static let UI: NSRegularExpression = try! NSRegularExpression(pattern: #"^[1-2](\d)*(\.0|\.[1-9](\d)*)*$"#, options: [])
    public static let SH: NSRegularExpression = try! NSRegularExpression(pattern: #"^(?:\s*)([^\r\n\f\t]*[^\r\n\f\t\s])(?:\s*)$"#, options: [])
    public static let DA: NSRegularExpression = try! NSRegularExpression(pattern: #"^(19|20)\d\d(01|02|03|04|05|06|07|08|09|10|11|12)(01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31)$"#, options: [])
    
    static let dateFormatter: DateFormatter = DateFormatter()
    
    public static func date(fromDAString string: String) -> Date? {
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.date(from: string )
    }
    
    public static func DAString(fromDate date: Date) -> String {
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
    
    public static func date(fromTM string: String) -> Date? {
        dateFormatter.dateFormat = "HHmmss"
        return dateFormatter.date(from: string)
    }
    
    public static func TMString(fromDate date: Date) -> String {
        dateFormatter.dateFormat = "HHmmss"
        return dateFormatter.string(from: date)
    }
    
    public static func date(fromDT string: String) -> Date? {
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        return dateFormatter.date(from: string)
    }
    
    public static func DTString(fromDate date: Date) -> String {
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        return dateFormatter.string(from: date)
    }
}
