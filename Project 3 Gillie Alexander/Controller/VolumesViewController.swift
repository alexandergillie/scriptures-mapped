//
//  VolumesViewController.swift
//  Project 3 Gillie Alexander
//
//  Created by Alexander Gillie on 11/21/18.
//  Copyright © 2018 Alexander Gillie. All rights reserved.
//

import UIKit

class VolumesViewController : UITableViewController {
    
    
    private struct Storyboard {
        static let ShowBooksSegueIdentifier = "ShowBooks"
        static let VolumeCellIdentifier = "VolumeCell"
    }
    
    var volumes = GeoDatabase.sharedGeoDatabase.volumes()
    
    // Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowBooksSegueIdentifier {
            if let booksVC = segue.destination as? BooksViewController {
                if let indexPath = sender as? IndexPath {
                    booksVC.volume = volumes[indexPath.row]
                    booksVC.volumeID = indexPath.row + 1
                }
            }
        }
    }
    
    
    // Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volumes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.VolumeCellIdentifier, for: indexPath)
        
        
        cell.textLabel?.text = volumes[indexPath.row ]
        return cell
    }
    
    // Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.ShowBooksSegueIdentifier, sender: indexPath)
    }
}
