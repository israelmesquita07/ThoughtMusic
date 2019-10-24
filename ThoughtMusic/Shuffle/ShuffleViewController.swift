//
//  ShuffleViewController.swift
//  ThoughtMusic
//
//  Created by Israel on 24/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class ShuffleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }

}


//MARK: - UITableViewDataSource
extension ShuffleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        cell.textLabel?.text = "Sentimental"
        cell.detailTextLabel?.text = "Los Hermanos"
        cell.imageView?.image = UIImage(named: "logo")
        
        return cell
    }
    
}



//MARK: - UITableViewDelegate
extension ShuffleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
