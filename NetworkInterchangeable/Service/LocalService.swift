//
//  LocalService.swift
//  NetworkInterchangeable
//
//  Created by Ali serkan Boyracı  on 1.05.2023.
//

import Foundation

class LocalService {
    
    func download(_ resource: String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource not found.")
        }
    }
}
