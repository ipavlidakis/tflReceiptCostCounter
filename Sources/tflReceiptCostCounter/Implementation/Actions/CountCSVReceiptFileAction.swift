//
//  CountCSVReceiptFileAction.swift
//  tflReceiptCostCounter
//
//  Created by Ilias Pavlidakis on 29/02/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct CountCSVReceiptFileAction: Action {

    let inputs: [String]
    let io: ConsoleIO

    func execute() {

        guard let filePath = inputs.first else {
            io.error("Invalid path")
            return
        }

        let url = URL(fileURLWithPath: filePath)
        guard
            let fileHandle = try?FileHandle(forReadingFrom: url),
            let string = String(data: fileHandle.readDataToEndOfFile(), encoding: .utf8)
            else {
                io.error("Invalid path or content")
                return
        }

        let payments: [TFLPayment] = Array(string.components(separatedBy: .newlines).dropFirst()).compactMap {
            let components = $0.components(separatedBy: ",")
            guard components.count == 2, let value = Float(components.last!) else { return nil }

            return TFLPayment(date: components.first!, price: abs(value))
        }

        let sum = payments.reduce(0) { $0 + $1.price }

        io.log("✅ You spent £\(sum) in total")
    }
}
