//
//  ViewController.swift
//  tracker
//
//  Created by Rohith Raju on 02/04/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {
    
    
    @IBOutlet weak var tableView: UITableView!
    var artist1 = [Artist(name: "AR Rahman",place: "India")!,Artist(name:"Taylor Swift",place:"USA")!,Artist(name:"Kendrick Lamar",place: "USA")!]
    var filteredArtists =  [Artist]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.filteredArtists = artist1
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
       tableView.tableHeaderView = searchController.searchBar

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArtists.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredArtists[indexPath.row].name
        cell.detailTextLabel?.text = filteredArtists[indexPath.row].place
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredArtists = artist1
        } else {
            // Filter the results
            filteredArtists = artist1.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        
        self.tableView.reloadData()
    }
}

