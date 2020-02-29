//
//  TFLPaymentCounter.swift
//  tflReceiptCostCounter
//
//  Created by Ilias Pavlidakis on 29/02/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

final class TFLPaymentCounter {

    private lazy var io: ConsoleIO = ConsoleIO()
    private lazy var usage: UsageTemplate = makeUsageTemplate()

    private func makeUsageTemplate() -> UsageTemplate {

        var template = UsageTemplate()

        template.addUsageOption(short: "h", long: "help",message: "Shows this dialog")
        template.addUsageOption(short: "i", long: "input", inputs: ["filepath"], message: "Reads the given file")

        return template
    }

    func fetchOption(for arguments: [String]) -> Action {

        guard arguments.count >= 1 else {
            return ErrorAction(inputs: ["Invalid parameters. Try again"], io: io)
        }

        var args = arguments
        let argument = args.removeFirst()

        guard usage.areParametersRight(for: argument, parameters: args) else {
            return ErrorAction(inputs: ["Invalid parameters. Try again"], io: io)
        }

        let option = usage.option(for: argument)

        switch option?.short {
            case "h":
                return HelpAction(usage: usage, io: io)
            case "i":
                return CountCSVReceiptFileAction(inputs: args, io: io)
            default:
                return ErrorAction(inputs: ["Invalid argument. Try again"], io: io)
        }
    }
}
