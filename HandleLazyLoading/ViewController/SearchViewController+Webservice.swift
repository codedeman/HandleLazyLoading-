//
//  SearchViewController+Webservice.swift
//  HandleLazyLoading
//
//  Created by Apple on 2/16/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

extension SearchViewController{

    func callSearchApi (searchText: String, pageNo: Int) {

        flickr.searchFlickrForTerm(searchText, page: pageNo) { (results, paging, error) in
            
            self.searchTextField.stopAnimating()

            if let paging = paging, paging.currentPage == 1 {
                ImageDownloadManager.shared.cancelAll()
               self.searches.searchResults.removeAll()
                self.collectionView?.reloadData()
            }
            
            if let error = error {
                // 2
                // log any errors to the console. In production display these errors to user
                print("Error searching: \(error)")
                return
            }
            
            if let results = results {

                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
                self.searches.searchResults.append(contentsOf: results.searchResults)
                for photo in self.searches.searchResults {
                    print("URL:  \(photo.flickrImageURL()?.absoluteString ?? "")")
                }
                self.paging = paging
                self.collectionView?.reloadData()
            }
            
            self.loadMore = false

            
            
            
            
        }
    
    }
}
