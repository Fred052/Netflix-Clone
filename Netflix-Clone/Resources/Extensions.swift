//
//  Extensions.swift
//  Netflix-Clone
//
//  Created by Ferid Suleymanzade on 30.10.24.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
