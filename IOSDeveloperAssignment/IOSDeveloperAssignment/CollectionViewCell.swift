//
//  CollectionViewCell.swift
//  samplecvap
//
//  Created by Imaginglink Inc on 7/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    func setUI(dict: [String: Any]) {
        nameLbl.text = dict["name"] as? String ?? ""
    }
}
