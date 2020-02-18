//
//  HouseViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let house: [House] = [House.init(imageName: "Arryn", name: "Arryn", words: "As High as Honor", seat: "The Eyrie"),
                          House.init(imageName: "Baratheon", name: "Baratheon", words: "Ours is the Fury.", seat: "Storm's End"),
                          House.init(imageName: "Greyjoy", name: "Greyjoy", words: "What Is Dead May Never Die", seat: "Salt Throne, Pyke"), House.init(imageName: "Lannister", name: "Lannister", words: "A Lannister Always Pays His Debts", seat: "Casterly Rock"),
                          House.init(imageName: "Martell", name: "Martell", words: "Unbowed, Unbent, Unbroken", seat: "Sunspear"),
                          House.init(imageName: "Stark", name: "Stark", words: "Winter Is Coming", seat: "Winterfell"),
                          House.init(imageName: "Targaryen", name: "Targaryen", words: "Fire and Blood", seat: "Red Keep, King's Landing, Dragonstone, Great Pyramid, Meereen, The Aegonfort"),
                          House.init(imageName: "Tully", name: "Tully", words: "Family, Duty, Honor", seat: "Riverrun"),
                          House.init(imageName: "Tyrell", name: "Tyrell", words: "Growing Strong", seat: "Highgarden")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
    // MARK: - Setup
    
    func setupUI() {
        self.title = "Houses"
        
        let nib = UINib.init(nibName: "HouseTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
            return cell
        }
        fatalError("Could not create the Episde cell")
    }
    
}

