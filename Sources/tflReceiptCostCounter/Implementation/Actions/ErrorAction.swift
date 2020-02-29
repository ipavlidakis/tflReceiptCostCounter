//
//  ErrorAction.swift
//  tflReceiptCostCounter
//
//  Created by Ilias Pavlidakis on 29/02/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct ErrorAction: Action {

    let inputs: [String]
    let io: ConsoleIO

    func execute() { inputs.forEach { io.error($0) } }
}
