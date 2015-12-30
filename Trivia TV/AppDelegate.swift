//
//  AppDelegate.swift
//  Trivia TV
//
//  Created by Steven Yang on 12/11/15.
//  Copyright © 2015 Blast Zone Studios. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {

    var window: UIWindow?
    
    var appController: TVApplicationController?
    static let TVBaseURL = "http://www.skewerb.com/trivia-tv-server/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 1
        let appControllerContext = TVApplicationControllerContext()
        
        // 2
        guard let javascriptURL = NSURL(string: AppDelegate.TVBootURL) else {
            fatalError("Unable to create NSURL")
        }
        
        appControllerContext.javaScriptApplicationURL = javascriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        // 3
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        return true
    }

}

