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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: EntryCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: EntryCell.identifier)
    }


    @IBAction func addEntryButton(_ sender: UIBarButtonItem) {
        if let addVC = storyboard?.instantiateViewController(withIdentifier: "AddEntryViewController") as? AddEntryViewController {
            addVC.reloadVCsTableView = { [weak self] in
                var entry = Entry(id: "1111", body: addVC.textView.text, da: Date(), dm: Date())
                entry.body = addVC.textView.text
//                для добавления записей друг за другом
//                self?.entry.append(entry)
                self?.entry.insert(entry, at: 0)
                self?.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                self?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                self?.tableView.reloadData()
            }
            present(addVC, animated: true, completion: nil)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        entry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryCell.identifier) as! EntryCell
        let entryModel = entry[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let daString = dateFormatter.string(from: entryModel.da)
        let dmString = dateFormatter.string(from: entryModel.dm)

        cell.daLabel.text = daString
        cell.dmLabel.text = dmString
        
        if entryModel.body.count > 200 {
            cell.entryTextView.text = entryModel.body.prefix(200) + "..."
        } else {
            cell.entryTextView.text = entryModel.body
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let entryModel = entry[indexPath.row]
        let vc = FullEntryViewController()
        vc.fullEntry.text = entryModel.body
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
}
