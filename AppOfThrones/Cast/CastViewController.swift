//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cast: [Cast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupData()
        self.setupNotifications()
    }

    
    // MARK: - Setup
    
    func setupUI() {
        
        self.title = "Cast"
        
        let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "cast", withExtension: "json") {
            do {
            let data = try Data.init(contentsOf: pathURL)
            let decoder = JSONDecoder()
            cast = try decoder.decode([Cast].self, from: data)
            self.tableView.reloadData()
            } catch {
                fatalError("Could not read th JSON")
            }
        } else {
            fatalError("Could not build the pathURL")
        }
    }
    
    
    //    MARK: - FavoriteDelegate
    
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
    
    //MARK: - UITableViewDelegate
    
    //1.- Altura de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
    //2.- Acción de la tabla o boton.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let casts = cast[indexPath.row]
        let castDetailViewController = CastDetailViewController()
        castDetailViewController.setCast(casts)
        self.navigationController?.pushViewController(castDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as? CastTableViewCell {
            let actor = cast [indexPath.row]
            cell.setCast(actor)
            cell.delegate = self
            return cell
        }
        fatalError("Could not create the Episode cell")
    }
}
