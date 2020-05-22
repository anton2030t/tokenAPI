//
//  ViewController.swift
//  tokenAPI
//
//  Created by Антон Ларченко on 21.05.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var entry = [Entry]()
    let entries = [GetEntriesModel]()
    var addVC = AddEntryViewController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func addEntryButton(_ sender: UIBarButtonItem) {
        if let addVC = storyboard?.instantiateViewController(withIdentifier: "AddEntryViewController") as? AddEntryViewController {
            present(addVC, animated: true, completion: nil)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryCell.identifier) as! EntryCell
        let entryModel = entry[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let daString = dateFormatter.string(from: entryModel.da)
        cell.daLabel.text = daString
        
        let dmString = dateFormatter.string(from: entryModel.da)
        cell.dmLabel.text = dmString
        
        cell.entryTextView.text = addVC.textView.text
        
        return cell
    }
    
}



//func response() {
//    webManager.getEntries() { [weak self] (entries) in
//            self?.entries += entries
//        DispatchQueue.main.async {
//            self?.tableView.reloadData()
//        }
//    }
//}
