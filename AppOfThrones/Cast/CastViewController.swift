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
    
    let cast: [Cast] = [Cast.init(id: 1, avatar: "Emilia Clarke", fullname: "Emilia Clarke", role: "Daenerys Targaryen", episodes: 73, birth: "1986-10-23", placeBirth: "London, England UK"),
                        Cast.init(id: 2, avatar: "Kit Harington", fullname: "Kit Harrington", role: "Jon Snow", episodes: 73, birth: "1986-12-26", placeBirth: "London, England UK"),
                        Cast.init(id: 3, avatar: "Aidan Gillen", fullname: "Aidan Gillen", role: "Petyr Baelish", episodes: 41, birth: "1968-04-24", placeBirth: "Drumcondra, Dublin, Ireland"),
                        Cast.init(id: 4, avatar: "Alfie Allen", fullname: "Alfie Allen", role: "Theon Greyjoy", episodes: 47, birth: "1986-09-12", placeBirth: "Hammersmith, London UK"),
                        Cast.init(id: 5, avatar: "Conleth Hill", fullname: "Conleth Hill", role: "Varys", episodes: 45, birth: "1964-11-24", placeBirth: "Ballycastle, Ireland"),
                        Cast.init(id: 6, avatar: "EJohn Bradley", fullname: "EJohn Bradley", role: "Samwell Tarly", episodes: 48, birth: "1988-09-15", placeBirth: "Wythenshawe, UK"),
                        Cast.init(id: 7, avatar: "Iain Glen", fullname: "Iain Glen", role: "Jorah Mormont", episodes: 52, birth: "1961-06-24", placeBirth: "Edinburgh, Scotland, UK"),
                        Cast.init(id: 8, avatar: "Lena Headey", fullname: "Lena Headey", role: "Cersei Lannister", episodes: 62, birth: "1973-10-03", placeBirth: "Hamilton, Bermuda"),
                        Cast.init(id: 9, avatar: "Maisie Williams", fullname: "Maisie Williams", role: "Arya Stark", episodes: 59, birth: "Bristol, England UK", placeBirth: "1997-04-15"),
                        Cast.init(id: 10, avatar: "Nikolaj Coster-Waldau", fullname: "Nikolaj Coster-Waldau", role: "Jaime Lannister", episodes: 55, birth: "1970-07-27", placeBirth: "Rudkøbing, Denmark"),
                        Cast.init(id: 11, avatar: "Peter Dinklage", fullname: "Peter Dinklage", role: "Tyrion Lannister", episodes: 65, birth: "1969-06-11", placeBirth: "Morristown, New Jersey, USA"),
                        Cast.init(id: 12, avatar: "Rory McCann", fullname: "Rory McCann", role: "Sandor Clegane", episodes: 38, birth: "1969-04-24", placeBirth: "Glasgow, Scotland, UK"),
                        Cast.init(id: 13, avatar: "Sophie Turner", fullname: "Sophie Turner", role: "Sansa Stark", episodes: 59, birth: "1996-02-21", placeBirth: "Northampton, England, UK")]
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
