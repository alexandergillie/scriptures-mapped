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
    
    var model = GeoDatabase.sharedGeoDatabase.volumes()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.VolumeCellIdentifier, for: indexPath)
        
        
        cell.textLabel?.text = model[indexPath.row ]
        return cell
    }
}
