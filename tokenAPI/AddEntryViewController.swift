//
//  AddEntryViewController.swift
//  tokenAPI
//
//  Created by Антон Ларченко on 22.05.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class AddEntryViewController: UIViewController {

    var reloadVCsTableView: (() -> ())?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func saveButton(_ sender: UIButton) {
        
        reloadVCsTableView?()

        dismiss(animated: true, completion: nil)
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
