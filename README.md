# About
**Transport For London (TFL)** provides the option to it's customers to download a CSV file that contains their travelling information for the past 7 days or for a specific month, up to 1 year from now. However, the generate CSV file contains entries with the cost of each trip without providing the total cost of all the trips in the file.

**tflReceiptCostCounter** is a command-line tool that reads the generated CSV file, sums up the trips and provides you with the total spent.

This tool can be handy for people who rely on those CSV files from TFL to submit expenses.

# Usage
- To show the help dialog
```bash
./tflReceiptCostCounter --help
./tflReceiptCostCounter -h
```
- To calculate the sum of daily travels from a CSV file
```bash
./tflReceiptCostCounter --input <path to your csv file>
./tflReceiptCostCounter -i <path to your csv file>
```

# Install
Grab the generated artifact from the latest sucessful action: https://github.com/ipavlidakis/tflReceiptCostCounter/actions?query=workflow%3ASwift+is%3Asuccess

# Next steps
A day after I created this tool, Apple published the https://github.com/apple/swift-argument-parser. My next plans are to migrate from my custom argument parser to the one provided by Apple.
