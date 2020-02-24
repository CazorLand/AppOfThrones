//
//  HouseViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var house: [House] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupData()
        self.setupNotifications()
        
    }
    
    // MARK: - Setup
    
    func setupUI() {
        self.title = "Houses"
        
        let nib = UINib.init(nibName: "HouseTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "houses", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                house = try decoder.decode([House].self, from: data)
                tableView.reloadData()
            } catch {
                fatalError("Could not read the JSON")
            }
        }else {
            fatalError("Could not build the pathURL")
        }
    }
    
    // MARK: -FavoriteDelegate
    
    @objc func didFavoriteChanged() {
          self.tableView.reloadData()
      }
    
    //MARK: - UITableViewDelegate
    
    //1.- Altura de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    //2.- Acción de la tabla o boton.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se ha hecho tap en la celda con sección \(indexPath.section) y fila \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return house.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell", for: indexPath) as? HouseTableViewCell {
            let houses = house[indexPath.row]
            cell.setHouse(houses)
            cell.delegate = self
            return cell
        }
        fatalError("Could not create the Episde cell")
    }
    
}

