//
//  CategoryCollectionViewCell.swift
//  FoodUI
//
//  Created by Kunal Chavan on 03/10/22.
//

import UIKit

class ReservationCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        shadowDecorate()
    }

}
