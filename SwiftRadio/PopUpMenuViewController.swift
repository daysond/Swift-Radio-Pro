//
//  PopUpMenuViewController.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 7/9/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit
import RealmSwift

class PopUpMenuViewController: UIViewController {

    @IBOutlet weak var trackTableView: UITableView!
    

    var stations: [StationName] = []

    //*****************************************************************
    // MARK: - ViewDidLoad
    //*****************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }
    
    //*****************************************************************
    // MARK: - IBActions
    //*****************************************************************
    private func loadData() {
        
        let realm = try! Realm()
        let realResults = Array(realm.objects(StationName.self))
    
        stations = realResults
        trackTableView.reloadData()
    }

    
}

extension PopUpMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stations.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        tableView.headerView(forSection: section)?.textLabel?.textColor = .white
        return stations[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stations[section].favTracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = stations[indexPath.section].favTracks[indexPath.row].title
//        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.text = stations[indexPath.section].favTracks[indexPath.row].title
//        cell.detailTextLabel?.textColor = .white
        return cell
    }
    
    
    
}
