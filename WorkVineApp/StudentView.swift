//
//  StudentView.swift
//  WorkVineApp
//
//  Created by Katie Vo on 7/17/24.
//

import SwiftUI

struct StudentView: View {
    @StateObject private var jobDataModel = JobDataModel()
    var body: some View {
        TabView{
            StudentHome()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            MyJobs()
                .tabItem {
                    Image(systemName: "folder")
                    Text("My Jobs")
                }
            StudentAcc()
                .padding(.top, 40)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .environmentObject(jobDataModel)
    }
}

#Preview {
    StudentView()
}
