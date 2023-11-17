//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 12/11/23.
//

import Foundation
import Vapor

public func loadEnvironmentVariables(fromFile fileName: String) {
    guard let filePath = Bundle.main.path(forResource: fileName, ofType: nil) else { return }

    let contents = try? String(contentsOfFile: filePath, encoding: .utf8)
    let lines = contents?.split(separator: "\n") ?? []

    for line in lines {
        let parts = line.split(separator: "=", maxSplits: 1, omittingEmptySubsequences: true)
        guard parts.count == 2 else { continue }
        let key = String(parts[0])
        let value = String(parts[1])
        setenv(key, value, 1)
    }
}
