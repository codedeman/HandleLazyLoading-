//
//  CustomFooterView.swift
//  HandleLazyLoading
//
//  Created by Apple on 2/15/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CustomFooterView: UICollectionReusableView {

    @IBOutlet weak var refreshControlIndicator: UIActivityIndicatorView!
    var isAnimatingFinal:Bool = false
    var currentTransform:CGAffineTransform?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //reset the animation
       func prepareInitialAnimation() {
           self.isAnimatingFinal = false
           self.refreshControlIndicator?.stopAnimating()
           self.refreshControlIndicator?.transform = CGAffineTransform.init(scaleX: 0.0, y: 0.0)
       }
    
    
    func setTransform(inTransform:CGAffineTransform, scaleFactor:CGFloat) {
        if isAnimatingFinal {
            return
        }
        self.currentTransform = inTransform
        self.refreshControlIndicator?.transform = CGAffineTransform.init(scaleX: scaleFactor, y: scaleFactor)
    }
    func startAnimate() {
        self.isAnimatingFinal = true
        self.refreshControlIndicator?.startAnimating()
    }
    
    func stopAnimate() {
        self.isAnimatingFinal = false
        self.refreshControlIndicator?.stopAnimating()
    }
    
    func animateFinal() {
          if isAnimatingFinal {
              return
          }
          self.isAnimatingFinal = true
          UIView.animate(withDuration: 0.2) {
              self.refreshControlIndicator?.transform = CGAffineTransform.identity
          }
      }
    
}
