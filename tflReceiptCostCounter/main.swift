//
//  main.swift
//  tflReceiptCostCounter
//
//  Created by Ilias Pavlidakis on 29/02/2020.
//  Copyright © 2020 Ilias Pavlidakis. All rights reserved.
//

import Foundation

let io = ConsoleIO()
let executor = TFLPaymentCounter()

executor.fetchOption(
    for: Array(CommandLine.arguments.dropFirst()))
    .execute()

