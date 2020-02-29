//
//  ConsoleIO.swift
//  tflReceiptCostCounter
//
//  Created by Ilias Pavlidakis on 29/02/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct ConsoleIO {

    private func write(message: String, to: ConsoleOutputType) {

        switch to {
            case .standard:
                print("\(message)")
            case .error:
                fputs("Error: \(message)\n", stderr)
        }
    }

    func log(_ message: String) { write(message: message, to: .standard) }

    func error(_ message: String) { write(message: message, to: .error) }
}
