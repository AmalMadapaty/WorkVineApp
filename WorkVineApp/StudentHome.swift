//
//  StudentHome.swift
//  WorkVineApp
//
//  Created by user264764 on 7/9/24.
//

import Foundation
import SwiftUI

struct StudentHome: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false // Track search state

    var body: some View {
        let someColor = Color(red: 0/255, green: 44/255, blue: 92/255)
        let backColor = Color(red: 181/255, green: 202/255, blue: 231/255)
        VStack {
            VStack{
               Spacer()
                Spacer()
                Spacer()
                Button(action: {
                    // Action when button is tapped
                    self.isSearching.toggle() // Toggle search state
                    print("Search button tapped with text: \(searchText)")
                    // Implement your search logic here
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass") // Search icon
                        TextField("Search", text: $searchText, onEditingChanged: { editing in
                            // Optional: Handle editing changed event
                        }, onCommit: {
                            print("Search text committed: \(searchText)")
                            // Implement your search logic here
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(isSearching) // Disable text field when searching
                    }
                }
                .padding()
                .foregroundColor(.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(backColor)
                        .frame(width:500, height: 90)
                        .padding(.top, 10)
                    Text("Welcome Back User!")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 20)
                    Text("Here's what's new: ")
                        .padding(.top, 40)
                    
                }
                Spacer()
                ZStack{
                    Text("Jobs")
                        .font(.title)
                        .bold()
                        .padding(.bottom,480)
                        .padding(.trailing, 280)
                    
                    ZStack{
                        Rectangle()
                            .fill(someColor)
                            .frame(width: 90, height: 90)
                            .padding(.bottom, 355)
                            .padding(.trailing, 253)
                        Text("Icon")
                            .foregroundColor(.white)
                            .padding(.bottom, 355)
                            .padding(.trailing, 253)
                        VStack (alignment: .leading) {
                            Text("Jobs Listing")
                                .font(.title2)
                                .bold()
                            Text("Company/Business Name")
                                .font(.headline)
                            Text("City of Job")
                                .font(.headline)
                            Text("Period of Work")
                                .font(.headline)
                            
                        }
                        .padding(.leading, 60)
                        .padding(.bottom, 358)
                        Divider()
                            .background(.black)
                            .frame(width: 338, height: 5)
                            .bold()
                            .padding(.bottom, 240)
                        Rectangle()
                            .fill(someColor)
                            .frame(width: 90, height: 90)
                            .padding(.bottom, 125)
                            .padding(.trailing, 253)
                        Text("Icon")
                            .foregroundColor(.white)
                            .padding(.bottom, 125)
                            .padding(.trailing, 253)
                        VStack (alignment: .leading) {
                            Text("Jobs Listing")
                                .font(.title2)
                                .bold()
                            Text("Company/Business Name")
                                .font(.headline)
                            Text("City of Job")
                                .font(.headline)
                            Text("Period of Work")
                                .font(.headline)
                            
                        }
                        .padding(.leading, 60)
                        .padding(.bottom, 123)
                        Divider()
                            .background(.black)
                            .frame(width: 338, height: 5)
                            .bold()
                            .padding(.bottom, 10)
                        Rectangle()
                            .fill(someColor)
                            .frame(width: 90, height: 90)
                            .padding(.top, 108)
                            .padding(.trailing, 253)
                        Text("Icon")
                            .foregroundColor(.white)
                            .padding(.top, 108)
                            .padding(.trailing, 253)
                        VStack (alignment: .leading) {
                            Text("Jobs Listing")
                                .font(.title2)
                                .bold()
                            Text("Company/Business Name")
                                .font(.headline)
                            Text("City of Job")
                                .font(.headline)
                            Text("Period of Work")
                                .font(.headline)
                        }
                        .padding(.leading, 60)
                        .padding(.top, 108)
                        Divider()
                            .background(.black)
                            .frame(width: 338, height: 5)
                            .bold()
                            .padding(.top, 220)
                        Rectangle()
                            .fill(someColor)
                            .frame(width: 90, height: 90)
                            .padding(.top, 336)
                            .padding(.trailing, 253)
                        Text("Icon")
                            .foregroundColor(.white)
                            .padding(.top, 336)
                            .padding(.trailing, 253)
                        VStack (alignment: .leading) {
                            Text("Jobs Listing")
                                .font(.title2)
                                .bold()
                            Text("Company/Business Name")
                                .font(.headline)
                            Text("City of Job")
                                .font(.headline)
                            Text("Period of Work")
                                .font(.headline)
                            
                        }
                        .padding(.leading, 60)
                        .padding(.top, 336)
                        
                        
                        Divider()
                            .frame(width: 400, height: 3)
                            .background(.black)
                            .padding(.top, 490)
                        
                    }
                    .padding(.top, 30)
                }
                Spacer()
                HStack{
                    Button(action: {
                                           // Action for homeScreen button
                                           print("Home button tapped")
                                       }) {
                                           Image("homeScreen")
                                               .resizable()
                                               .frame(width: 60, height: 50)
                                               .padding(2)
                                               .background(Color.white)
                                               
                                               
                                       }
                                       
                                       Button(action: {
                                           // Action for jobScreen button
                                           print("Job button tapped")
                                       }) {
                                           Image("jobScreen")
                                               .resizable()
                                               .frame(width: 60, height: 50)
                                               .padding(.top, 10)
                                               .background(Color.white)
                                               
                                       }
                                       
                                       Button(action: {
                                           // Action for chatScreen button
                                           print("Chat button tapped")
                                       }) {
                                           Image("chatScreen")
                                               .resizable()
                                               .frame(width: 70, height: 50)
                                               .padding(2)
                                               .background(Color.white)
                                               
                                       }
                                       
                                       Button(action: {
                                           // Action for account button
                                           print("Account button tapped")
                                       }) {
                                           Image("account")
                                               .resizable()
                                               .frame(width: 45, height: 55)
                                               .padding(2)
                                               .background(Color.white)
                                               
                                       }
                                       
                                       Button(action: {
                                           // Action for notif button
                                           print("Notification button tapped")
                                       }) {
                                           Image("notif")
                                               .resizable()
                                               .frame(width: 60, height: 60)
                                               .padding(2)
                                               .background(Color.white)
                                               
                                               
                                       }
                }
                .padding(.bottom, 5)
                Spacer()
                
            }
        }
        .padding()
    }
}

struct StudentHome_Previews: PreviewProvider {
    static var previews: some View {
        StudentHome()
    }
}
