//
//  CategoriesTableViewCell.swift
//  FoodUI
//
//  Created by Kunal Chavan on 03/10/22.
//

import UIKit

class NearByPopularTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let identifier = String(describing: NearByPopularCollectionViewCell.self)
        collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}

extension NearByPopularTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NearByPopularCollectionViewCell.self), for: indexPath)
        cell.layer.cornerRadius = 8
        cell.shadowDecorate()
        return cell
    }
}

extension NearByPopularTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 180)
    }
}

