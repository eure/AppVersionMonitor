// AppVersion.swift
//
// Copyright (c) 2015 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


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