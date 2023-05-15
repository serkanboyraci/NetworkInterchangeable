//
//  UserViewModel.swift
//  NetworkInterchangeable
//
//  Created by Ali serkan Boyracı  on 25.04.2023.
//

import Foundation


class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    
    //let webservice = Webservice()
    
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        
        do {
            let users = try await service.download(Constants.Urls.userExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
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
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }
    
    
}
