//
//  FullEntryViewController.swift
//  tokenAPI
//
//  Created by Антон Ларченко on 22.05.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class FullEntryViewController: UIViewController {

    let fullEntry: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 15)
        view.isEditable = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullEntry.isScrollEnabled = false
        view.addSubview(fullEntry)
        setupFullEntry()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fullEntry.isScrollEnabled = true
    }
    
    func setupFullEntry() {
        fullEntry.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        fullEntry.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        fullEntry.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        fullEntry.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
}
