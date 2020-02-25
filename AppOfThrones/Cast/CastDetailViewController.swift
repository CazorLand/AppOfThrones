//
//  CastDetailViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 22/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class CastDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var cast: Cast? {
        didSet {
            self.title = self.cast?.fullname
//            self.tableView.reloadData()
        }
    }
        
//    convenience init(cast: Cast) {
//        self.init(nibName: "CastDetailViewController", bundle: nil)
//        self.title = cast.fullname
//        self.cast = cast
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - SetUp
    
    func setupUI() {
        self.title = cast?.fullname
        
        let nib = UINib.init(nibName: "CastDetailTableVC", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CastDetailTableVC")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setCast(_ cast: Cast){
        self.cast = cast
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 818
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CastDetailTableVC", for: indexPath) as?
                CastDetailTableVC {
                cell.setCast(cast)
                
                return cell
            }
            
        }
        fatalError("Could not create Account cells")
    }

}
