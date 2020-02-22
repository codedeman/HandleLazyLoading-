//
//  SearchViewController.swift
//  HandleLazyLoading
//
//  Created by Apple on 2/16/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SearchViewController: UICollectionViewController {
  
    @IBOutlet weak var searchTextField: SearchTextField!
    var footerView:CustomFooterView?
    var searches = FlickrSearchResults()
    let flickr = Flickr()
    var itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    var paging : Paging?
    var loadMore: Bool = false
    var selectedCellFrame: CGRect?
    var selectedIndexPath: IndexPath?
    let footerViewReuseIdentifier = "RefreshFooterView"


    override func viewDidLoad() {
        super.viewDidLoad()
        
         collectionView?.register(UINib(nibName: "CustomFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerViewReuseIdentifier)

        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func photoForIndexPath(indexPath: IndexPath) -> FlickrPhoto {
        return searches.searchResults[(indexPath as NSIndexPath).row]
    }

    
}

// MARK: UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.paging = nil
        self.loadMore = true
        guard let searchText = textField.text, searchText.count > 0 else {
            ImageDownloadManager.shared.cancelAll()
            self.searches.searchResults.removeAll()
            self.collectionView?.reloadData()
            self.loadMore = false
            return true
        }
        searchTextField.startAnimating()
        self.callSearchApi(searchText: searchText, pageNo: 1)
    
        return true
    }
}






