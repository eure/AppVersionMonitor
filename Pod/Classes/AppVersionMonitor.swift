//
//  AppVersionMonitor.swift
//  Pods
//
//  Created by Hiroshi Kimura on 12/16/15.
//
//

import Foundation

public class AppVersionMonitor {
        
    public enum State {
        case NotChanged
        case Installed
        case Upgraded(previousVersion: AppVersion)
        case Downgraded(previousVersion: AppVersion)
    }
    
    static let sharedMonitor = AppVersionMonitor()
    
    public let state: State
    
    public init() {
        
        let userDefaults = NSUserDefaults(suiteName: AppVersionMonitor.userDefaultsSuitename)
        
        let _latestVersionString = userDefaults?.stringForKey(AppVersionMonitor.latestVersionKey)
        userDefaults?.setObject(AppVersion.marketingVersion.versionString, forKey: AppVersionMonitor.latestVersionKey)
        userDefaults?.synchronize()
        
        guard let latestVersionString = _latestVersionString else {
            self.state = .Installed
            return
        }
        
        let latestVersion = AppVersion(latestVersionString)
        
        if latestVersion < AppVersion.marketingVersion {
            self.state =  .Upgraded(previousVersion: latestVersion)
        } else if latestVersion > AppVersion.marketingVersion {
            self.state =  .Downgraded(previousVersion: latestVersion)
        } else {
            self.state =  .NotChanged
        }
    }
    
    private static let latestVersionKey = "me.muukii.AppVersionMonitor.latestVersion"
    private static let userDefaultsSuitename = "me.muukii.AppVersionMonitor"
}