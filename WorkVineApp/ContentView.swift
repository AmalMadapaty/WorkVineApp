//
//  ContentView.swift
//  WorkVineApp
//
//  Created by user264764 on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var jobDataModel = JobDataModel()
    @State private var jobTitle = ""
    @State private var companyName = ""
    @State private var city = ""
    @State private var period = ""
    @State private var hourlyRate = ""
    @State private var selectedImage: UIImage? = nil
    @State private var showingForm = false
    @State private var showingImagePicker = false

    var body: some View {
        TabView {
            OtherHome()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AddJobFormView(
                jobTitle: $jobTitle,
                companyName: $companyName,
                city: $city,
                period: $period,
                hourlyRate: $hourlyRate,
                selectedImage: $selectedImage,
                showingForm: $showingForm,
                showingImagePicker: $showingImagePicker,
                submitJobEntry: {
                    // Add your submit job entry logic here
                    print("Job Entry Submitted")
                }
            )
            .tabItem {
                Image(systemName: "plus.circle")
                Text("New")
            }
            BusinessProfile()
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
    ContentView()
}
