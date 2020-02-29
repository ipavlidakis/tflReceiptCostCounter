//
//  HelpAction.swift
//  tflReceiptCostCounter
//
//  Created by Ilias Pavlidakis on 29/02/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

struct HelpAction: Action {

    let inputs: [String] = []
    let usage: UsageTemplate
    let io: ConsoleIO

    func execute() { io.log(usage.description) }
}
