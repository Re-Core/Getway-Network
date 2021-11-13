//
//  UserListView.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/26/20.
//

import SwiftUI


struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String

    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1 ..< 20) { _ in
                    NavigationLink(
                        destination: LazyView(ProfileView()),
                        label: {
                            UserCell()
                                .padding(.leading)
                        })
                }
            }
        }
    }
}
