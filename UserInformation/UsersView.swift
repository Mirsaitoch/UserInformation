//
//  UsersView.swift
//  UserInformation
//
//  Created by Мирсаит Сабирзянов on 03.12.2023.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
    var body: some View {
        List(users){ user in
            Section{
                NavigationLink(){
                    DetailView(user: user)
                }label: {
                    HStack{
                        Text(user.name)
                        Text("\(user.age)")
                            .fontWeight(.black)
                    }
                }
            }
        }
    }
    
    init(online: Bool, sort: SortDescriptor<User>) {
        _users = Query(filter: #Predicate<User>{ user in
            if(online == false){
                return true
            }
            else if(online == user.isActive){
                return true
            }
            else{
                return false
            }
        }
        , sort: [sort])
    }
}

#Preview {
    UsersView()
}
