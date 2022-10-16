//
//  CategoriesTableViewCell.swift
//  FoodUI
//
//  Created by Kunal Chavan on 03/10/22.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let identifier = String(describing: CategoryCollectionViewCell.self)
        collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}

extension CategoriesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath)
        cell.layer.cornerRadius = 8
        cell.shadowDecorate()
        return cell
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 170)
    }
}

