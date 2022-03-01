//
//  customCollectionViewCell.swift
//  CASH
//
//  Created by admin on 2/28/22.
//

import UIKit

class customCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lb: UILabel!
    
    public func configure(with image: UIImage) {
        img.image = image
    }
}
