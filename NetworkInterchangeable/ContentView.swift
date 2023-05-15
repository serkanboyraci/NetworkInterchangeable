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
        self.userListViewModel = UserListViewModel(service: LocalService())
    }
    
    
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) { user in
            VStack {
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth:.infinity, alignment: .leading)
                Text(user.username)
                    .foregroundColor(.green)
                    .frame(maxWidth:.infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.red)
                    .frame(maxWidth:.infinity, alignment: .leading)
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
