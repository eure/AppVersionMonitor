//
//  AppVersion.swift
//  AppVersionChecker
//
//  Created by Hiroshi Kimura on 8/25/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation

private func parseVersion(lhs: AppVersion, rhs: AppVersion) -> Zip2Sequence<[Int], [Int]> {
    
    let lhs = lhs.versionString.characters.split(".").map { (String($0) as NSString).integerValue }
    let rhs = rhs.versionString.characters.split(".").map { (String($0) as NSString).integerValue }
    let count = max(lhs.count, rhs.count)
    return zip(
        lhs + Array(count: count - lhs.count, repeatedValue: 0),
        rhs + Array(count: count - rhs.count, repeatedValue: 0))
}

public func == (lhs: AppVersion, rhs: AppVersion) -> Bool {
    
    var result: Bool = true
    for (l, r) in parseVersion(lhs, rhs: rhs) {
            
        if l != r {
            result = false
        }
    }    
    return result
}

public func < (lhs: AppVersion, rhs: AppVersion) -> Bool {
    
    for (l, r) in parseVersion(lhs, rhs: rhs) {
        if l < r {
            return true
        } else if l > r {
            return false
        }
    }
    return false
}

public struct AppVersion: StringLiteralConvertible, Comparable {
    
    public static var marketingVersion: AppVersion {
        
        if let dic = NSBundle.mainBundle().infoDictionary {
            return AppVersion(dic["CFBundleShortVersionString"] as! String)
        } else {
            fatalError()
        }
    }
    
    public static var version: AppVersion {
        
        if let dic = NSBundle.mainBundle().infoDictionary {
            return AppVersion(dic[kCFBundleVersionKey as String] as! String)
        } else {
            fatalError()
        }
    }
    
    private(set) public var versionString: String
    
    public init(_ versionString: String) {
        
        self.versionString = versionString
    }
    
    // MARK: StringLiteralConvertible
    
    public init(stringLiteral value: String) {
        
        self.versionString = value
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.versionString = value
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.versionString = value
    }
}