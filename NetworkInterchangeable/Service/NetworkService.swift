//
//  NetworkService.swift
//  NetworkInterchangeable
//
//  Created by Ali serkan Boyracı  on 15.05.2023.
//

import Foundation

protocol NetworkService {
    
    var type : String { get }
    
    func download(_ resource: String) async throws -> [User]
    
   
}
