//
//  HomeView.swift
//  Getway Network
//
//  Created by Rebin Aziz on 11/12/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            TabView {
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
            }.navigationTitle("Getway Network")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: logoutButton)
                .accentColor(.black)
        }
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            Text("Logout").foregroundColor(.black)
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
