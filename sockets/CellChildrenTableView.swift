//
//  CellChildrenTableView.swift
//  Wehere
//
//  Created by Zakhar Rudenko on 24.05.16.
//  Copyright © 2016 Zakhar Rudenko. All rights reserved.
//

import UIKit

class CellChildrenTableView: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameChildren: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
