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
    
    public static let sharedMonitor = AppVersionMonitor()
    
    public let state: State
    public let installedVersions: [AppVersion]
    
    func startup() {
        
    }
    
    init() {
        
        let userDefaults = NSUserDefaults(suiteName: AppVersionMonitor.userDefaultsSuitename)
        defer {
            userDefaults?.synchronize()
        }
        
        var installedVersions = (userDefaults?.objectForKey(AppVersionMonitor.installedVersionsKey) as? [String])?.map { AppVersion($0) } ?? []
        
        let _latestVersionString = userDefaults?.stringForKey(AppVersionMonitor.latestVersionKey)
        userDefaults?.setObject(AppVersion.marketingVersion.versionString, forKey: AppVersionMonitor.latestVersionKey)
        
        if installedVersions.contains(AppVersion.marketingVersion) == false {
            
            installedVersions.append(AppVersion.marketingVersion)
            userDefaults?.setObject(installedVersions.map { $0.versionString }, forKey: AppVersionMonitor.installedVersionsKey)
        }
        
        self.installedVersions = installedVersions

        guard let latestVersionString = _latestVersionString else {
            
            self.state = .Installed
            return
            
        }
        
        let latestVersion = AppVersion(latestVersionString)
        
        if latestVersion < AppVersion.marketingVersion {
            
            self.state = .Upgraded(previousVersion: latestVersion)
            
        } else if latestVersion > AppVersion.marketingVersion {
            
            self.state = .Downgraded(previousVersion: latestVersion)
            
        } else {
            
            self.state = .NotChanged
        }
    }
    
    private static let latestVersionKey = "me.muukii.AppVersionMonitor.latestVersion"
    private static let installedVersionsKey = "me.muukii.AppVersionMonitor.installedVersionsKey"
    private static let userDefaultsSuitename = "me.muukii.AppVersionMonitor"
}