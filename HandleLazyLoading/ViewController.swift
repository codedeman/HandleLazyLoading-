//
//  ViewController.swift
//  HandleLazyLoading
//
//  Created by Apple on 2/15/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet lazy var detailLabel: UILabel? = {
    
        let label =  UILabel()
        
        label.textColor = UIColor.black
        label.text = "What the hell"
//        label.font = UIFont(name: “KannadaSangamMN”, size: 14.0)
        
        
        return label;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel?.text = "Innnn"
        // Do any additional setup after loading the view.
    }


}

