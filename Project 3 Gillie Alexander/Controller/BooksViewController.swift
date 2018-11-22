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
    }
    

    var books = [Book]()
    var volume = ""
    var volumeID = 1 {
        didSet {
            books = GeoDatabase.sharedGeoDatabase.booksForParentId(volumeID)
        }
    }
    
    // Make this calculate what volume
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = volume
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
}
