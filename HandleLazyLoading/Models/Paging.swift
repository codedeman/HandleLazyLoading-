//
//  Paging.swift
//  HandleLazyLoading
//
//  Created by Apple on 2/16/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

public class Paging {

    // MARK: Properties
    public var totalPages: Int?
    public var numberOfElements: Int32?
    public var currentSize: Int = 20
    public var currentPage: Int?

    init(totalPages: Int, elements: Int32, currentPage: Int) {
        self.totalPages = totalPages
        self.numberOfElements = elements
        self.currentPage = currentPage
    }
}
