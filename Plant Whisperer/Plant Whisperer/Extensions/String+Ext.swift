//
//  String+Ext.swift
//  Plant Whisperer
//
//  Created by Jason Sanchez on 4/4/25.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
