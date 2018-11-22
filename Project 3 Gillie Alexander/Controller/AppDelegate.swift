//
//  AppDelegate.swift
//  Project 3 Gillie Alexander
//
//  Created by Alexander Gillie on 11/21/18.
//  Copyright © 2018 Alexander Gillie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    private struct Storyboard {
        static let MapVCIdentifier = "DetailVC"
        static let MainStoryboardName = "Main"
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        if let splitViewController = window!.rootViewController as? UISplitViewController {
            splitViewController.delegate = self
            splitViewController.preferredDisplayMode = .allVisible
        }
        return true
    }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {

        return true
    }

    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {

        if let navVC = primaryViewController as? UINavigationController {
            for controller in navVC.viewControllers {
                if controller.restorationIdentifier == Storyboard.MapVCIdentifier {
                    return controller
                }
            }
        }

        let storyboard = UIStoryboard(name: Storyboard.MainStoryboardName, bundle: nil )
        return storyboard.instantiateViewController(withIdentifier: Storyboard.MapVCIdentifier)
    }
}

