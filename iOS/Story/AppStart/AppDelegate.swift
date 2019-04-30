//
//  AppDelegate.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import UIKit
import RIBs
import RxSwift

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {
    public var window: UIWindow?
    private var launchRouter: LaunchRouting?
    private var urlHandler: UrlHandler?

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let result = RootBuilder(dependency: AppComponent()).build()
        let launchRouter = result.launchRouter
        self.launchRouter = launchRouter
        urlHandler = result.urlHandler
        launchRouter.launch(from: window)

        return true
    }

    public func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        urlHandler?.handle(url)
        return true
    }

    public func applicationWillResignActive(_ application: UIApplication) {}

    public func applicationDidEnterBackground(_ application: UIApplication) {}

    public func applicationWillEnterForeground(_ application: UIApplication) {}

    public func applicationDidBecomeActive(_ application: UIApplication) {}

    public func applicationWillTerminate(_ application: UIApplication) {}
}
