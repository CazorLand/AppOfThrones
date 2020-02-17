//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cast: [Cast] = [Cast.init(id: 1, avatar: "Emilia Clarke", fullname: "Emilia Clarke", role: "Daenerys Targaryen", episodes: 73, birth: "1986-10-23", placeBirth: "London, England UK"), Cast.init(id: 2, avatar: "Kit Harington", fullname: "Kit Harrington", role: "Jon Snow", episodes: 73, birth: "1986-12-26", placeBirth: "London, England UK")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        
    }
    
    // MARK: - Setup
    
    func setupUI() {
        
        let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //MARK: - UITableViewDelegate
    
    //1.- Altura de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
    //2.- Acción de la tabla o boton.
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Se ha hecho tap en la celda con sección \(indexPath.section) y fila \(indexPath.row)")
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
            return cell
        }
        fatalError("Could not create the Episde cell")
    }
    
    
    
}
