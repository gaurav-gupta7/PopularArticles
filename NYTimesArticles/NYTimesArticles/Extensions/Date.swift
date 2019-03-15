//
//  Date.swift
//  NYTimesArticles
//
//  Created by Gaurav Gupta on 13/03/19.
//  Copyright © 2019 Gaurav Gupta. All rights reserved.
//

import Foundation

extension Date {
    func stringInFormat(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
