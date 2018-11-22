//
//  ScripturesViewController.swift
//  Project 3 Gillie Alexander
//
//  Created by Alexander Gillie on 11/21/18.
//  Copyright © 2018 Alexander Gillie. All rights reserved.
//

import UIKit
import WebKit

class ScripturesViewController : UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    
    var bookID = 101
    var chapterID = 2
    
    private weak var mapViewController : MapViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let (rawHTML, _) = ScriptureRenderer.sharedRenderer.htmlForBookId(bookID, chapter: chapterID)
        
        webView.loadHTMLString(rawHTML, baseURL: nil)
    }
    
    private func configureDetailViewController() {
        if let splitVC = splitViewController {
            if let navVC = splitVC.viewControllers.last as? UINavigationController {
                mapViewController = navVC.topViewController as? MapViewController
            } 
        } else {
            mapViewController = nil
        }
    }
}
