//
//  UsageOption.swift
//  tflReceiptCostCounter
//
//  Created by Ilias Pavlidakis on 29/02/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct UsageOption: CustomStringConvertible {

    let executableName: String
    let short: String
    let long: String?
    let numberOfInputsRequired: Int
    let inputs: [String]
    let separator: String
    let message: String

    init(executableName: String,
         short: String,
         long: String? = nil,
         inputs: [String] = [],
         separator: String = " ",
         message: String
    ) {
        self.executableName = executableName
        self.short = short
        self.long = long
        self.numberOfInputsRequired = inputs.count
        self.inputs = inputs
        self.separator = separator
        self.message = message
    }

    var description: String {

        var result = "\(executableName) -\(short)"

        if let long = self.long {
            result = "\(result) or --\(long)"
        }

        let inputsString = inputs.joined(separator: separator)

        if !inputsString.isEmpty {
            result = "\(result) \(inputsString)"
        }

        result = "\(result) => \(message)"

        return result
    }
}

