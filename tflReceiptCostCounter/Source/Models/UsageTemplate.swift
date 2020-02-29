//
//  UsageTemplate.swift
//  tflReceiptCostCounter
//
//  Created by Ilias Pavlidakis on 29/02/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct UsageTemplate: CustomStringConvertible {

    let executableName: String
    private var options: [UsageOption]

    init() {

        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent

        self.init(executableName: executableName, options: [])
    }

    private init(executableName: String, options: [UsageOption]) {

        self.executableName = executableName
        self.options = options
    }

    mutating func addUsageOption(
        short: String,
        long: String? = nil,
        inputs: [String] = [],
        separator: String = " ",
        message: String
    ) {
        options.append(UsageOption(
            executableName: executableName,
            short: short,
            long: long,
            inputs: inputs,
            separator: separator,
            message: message))
    }

    var description: String { options.map { $0.description }.joined(separator: "\n") }

    func option(for option: String) -> UsageOption? {

        let normalized: String = {
            if option.hasPrefix("--") {
                return String(option.dropFirst(2))
            } else if option.hasPrefix("-") {
                return String(option.dropFirst(1))
            } else {
                return option
            }
        }()

        return options.first { $0.long == normalized || $0.short == normalized }
    }

    func isValidOption(_ option: String) -> Bool {

        return self.option(for: option) != nil
    }

    func areParametersRight(for option: String, parameters: [String]) -> Bool {

        guard let option = self.option(for: option) else { return false }

        guard parameters.count == option.numberOfInputsRequired else { return false }

        return true
    }
}
