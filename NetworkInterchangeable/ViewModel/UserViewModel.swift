//
//  UserViewModel.swift
//  NetworkInterchangeable
//
//  Created by Ali serkan Boyracı  on 25.04.2023.
//

import Foundation


class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    
    let webservice = Webservice()
    
    func downloadUsers() async {
        
        do {
            let users = try await webservice.download(<#T##resource: String##String#>)
        } catch {
            print(error)
        }
        
    }
    
}

struct UserViewModel {
    
    let user : User
    var id : Int {
        user.id
    }
    
    var name : String {
        user.username
    }
    
    var emmail : String {
        user.email
    }
    
    
}
