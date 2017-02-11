//
//  TableViewController.swift
//  Praag
//
//  Created by Mathias Beke on 3/02/17.
//  Copyright © 2017 Mathias Beke. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    var names = [Page]()
    
    override func viewDidLoad() {
        names = [
            Page(name: "Kennismaken met Praag", url: "oudestad"),
            Page(name: "Dagje langs Petrin", url: "petrin"),
            Page(name: "Over Karlsbrug naar Malá Strana", url: "karlsbrug"),
            Page(name: "Daguitstap naar Karlstein", url: "karlstein"),
            Page(name: "Hotel", url: "hotel"),
            Page(name: "Restaurants", url: "restaurants"),
        ]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel!.text = names[indexPath.row].name
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewController
        let selectedRow = tableView.indexPathForSelectedRow!.row
        destination!.inputPage = names[selectedRow]
    }
    
}
