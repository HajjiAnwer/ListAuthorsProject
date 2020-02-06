//
//  HomeViewController.swift
//  ListAuthorsProject
//
//  Created by Hajji Anwer on 2/4/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    let servicealamofire = AlamofireService()
    var authorsArray = [Author]()
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveData()
    }
    
    
}

extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func retriveData(){
        servicealamofire.listOfAuthors { (authors) in
            self.authorsArray = authors
            print(self.authorsArray.count)
            self.table.reloadData()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellModel", for: indexPath)
        let firstName = authorsArray[indexPath.row].firstName
        let lastName = authorsArray[indexPath.row].lastName
        let fullName = firstName + " " + lastName
        cell.textLabel?.text = fullName
        return cell
    }
}
