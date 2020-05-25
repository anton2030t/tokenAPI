//
//  EntryCell.swift
//  tokenAPI
//
//  Created by Антон Ларченко on 22.05.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class EntryCell: UITableViewCell {

    var task: URLSessionDataTask?
    static let identifier = "EntryCell"
    
    @IBOutlet weak var daLabel: UILabel!
    @IBOutlet weak var dmLabel: UILabel!
    @IBOutlet weak var entryTextView: UITextView!
        
    override func prepareForReuse() {
        super.prepareForReuse()
        
        entryTextView.text = nil
        isHidden = false
        isSelected = false
        isHighlighted = false
        task?.cancel()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
