//
//  SearchViewController+CollectionView.swift
//  HandleLazyLoading
//
//  Created by Apple on 2/16/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

extension SearchViewController{

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches.searchResults.count
    }
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return searches.searchResults.count
//
//    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrPhotoCell.identifier, for: indexPath) as! FlickrPhotoCell

        cell.imageView.isUserInteractionEnabled = true
        
        return cell
        
    }
    
    
    
}
