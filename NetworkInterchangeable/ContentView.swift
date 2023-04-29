//
//  ContentView.swift
//  NetworkInterchangeable
//
//  Created by Ali serkan Boyracı  on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel :
        UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel()
    }
    
    
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) { user in
            VStack {
                Text(user.name)
                Text(user.username)
                Text(user.email)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
