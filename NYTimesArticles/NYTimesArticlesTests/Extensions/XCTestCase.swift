
//
//  XCTestCase.swift
//  NYTimesArticlesTests
//
//  Created by Gaurav Gupta on 14/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import XCTest

extension XCTestCase {
    func loadStub(name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
}
