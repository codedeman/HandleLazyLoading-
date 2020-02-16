//
//  SearchTextField.swift
//  HandleLazyLoading
//
//  Created by Apple on 2/16/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SearchTextField: UITextField {
    var activityIndicator : UIActivityIndicatorView!
    
    override func awakeFromNib() {
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)
        activityIndicator.frame = self.bounds
    }
    
    func startAnimating () {
        activityIndicator.startAnimating()
    }
    func stopAnimating () {
        activityIndicator.stopAnimating()
    }

}
