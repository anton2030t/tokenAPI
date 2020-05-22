//
//  AddEntryViewController.swift
//  tokenAPI
//
//  Created by Антон Ларченко on 22.05.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class AddEntryViewController: UIViewController {

    var addModel = [AddEntryModel]()
    var getModel = [GetEntriesModel]()
    let vc = ViewController()
    let webManager = WebManager()
    let cell = EntryCell()
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func saveButton(_ sender: UIButton) {
        
        cell.entryTextView.text = textView.text
        vc.tableView.reloadData()

//        vc.tableView.performBatchUpdates({
//            webManager.addEntry(session: "kakayaTO", body: textView.text) { [weak self] (addModel) in
//                self?.addModel = addModel
//                DispatchQueue.main.async {
//                    self?.vc.tableView.reloadData()
//                }
//            }
//            vc.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
//        }) { (result) in
//            self.vc.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
//        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddEntryViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.separator {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Введите текст записи..."
            textView.textColor = UIColor.separator
        }
    }
    
}
