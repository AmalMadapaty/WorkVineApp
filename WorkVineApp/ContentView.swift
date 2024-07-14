//
//  ContentView.swift
//  WorkVineApp
//
//  Created by user264764 on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var jobDataModel = JobDataModel()
    var body: some View {
        TabView{
            OtherHome()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            BusinessEntry()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("New")
                }
            BusinessProfile()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .environmentObject(jobDataModel)
    }
}

#Preview {
    ContentView()
}
