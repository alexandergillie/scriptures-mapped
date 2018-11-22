//
//  BooksViewController.swift
//  Project 3 Gillie Alexander
//
//  Created by Alexander Gillie on 11/21/18.
//  Copyright © 2018 Alexander Gillie. All rights reserved.
//

import UIKit

class BooksViewController : UITableViewController {
    
    
    private struct Storyboard {
        static let BookCellIdentifier = "BookCell"
        static let ShowChaptersSegueIdentifier = ""
        static let ShowScripturesSegueIndentifier = "ShowChapterContent"
    }
    

    var books = [Book]()
    var volume = ""
    var volumeID = 1
    
    // Make this calculate what volume
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    
    private func updateUI() {
        title = volume
        books = GeoDatabase.sharedGeoDatabase.booksForParentId(volumeID)
    }
    
    // Table View data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.BookCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = books[indexPath.row].fullName
        return cell
    }
    
    // Table View delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.ShowScripturesSegueIndentifier, sender: self )
    }
}
