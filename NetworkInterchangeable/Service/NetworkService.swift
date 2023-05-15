//
//  NetworkService.swift
//  NetworkInterchangeable
//
//  Created by Ali serkan Boyracı  on 15.05.2023.
//

import Foundation

protocol NetworkService {
    func download(_ resource: String) async throws -> [User]
    
    var type : String { get }
}
