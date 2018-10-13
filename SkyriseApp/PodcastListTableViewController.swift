//
//  PodcastListTableViewController.swift
//  SkyriseApp
//
//  Created by Krygu on 13/10/2018.
//  Copyright © 2018 Krygu. All rights reserved.
//

import UIKit

class PodcastListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "PodcastTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "PodcastTableViewCell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func goToPodcastDetails() {
        let vc = PodcastDetailsViewController.getInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastTableViewCell", for: indexPath) as? PodcastTableViewCell else {
            return UITableViewCell()
        }
        cell.trackNameLabel.text = "\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToPodcastDetails()
    }
    
}
