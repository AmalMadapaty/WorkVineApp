//
//  MyJobs.swift
//  WorkVineApp
//
//  Created by user264764 on 7/13/24.
//

import SwiftUI

struct MyJobs: View {
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false // Track search state
    @EnvironmentObject var dataModel: JobDataModel

    var body: some View {
        let someColor = Color(red: 0/255, green: 44/255, blue: 92/255)
        let backColor = Color(red: 181/255, green: 202/255, blue: 231/255)
        VStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(backColor)
                        .frame(width: 500, height: 90)
                        .padding(.bottom, 510)
                    Text("Your Jobs")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 510)
                    Divider()
                        .frame(width: 400, height: 3)
                        .background(.black)
                        .padding(.top, 790)
                    Rectangle()
                        .frame(width: 60, height: 60)
                        .padding(.top, 875)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                    Image("Home Button")
                        .resizable()
                        .frame(width: 55, height: 55)
                        .padding(.top, 875)
                        .padding(.trailing, 225)
                    Image("Account Button")
                        .resizable()
                        .frame(width: 55, height: 55)
                        .padding(.top, 878)
                        .padding(.leading, 210)
                    Image("My Jobs")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.top, 877)
                        .padding(.trailing, 5)
                }
                Spacer()
                ZStack {
                    VStack {
                        ForEach(dataModel.myJobs) { entry in
                            HStack {
                                if let photo = entry.photo {
                                    Image(uiImage: photo)
                                        .resizable()
                                        .frame(width: 90, height: 90)
                                } else {
                                    Rectangle()
                                        .fill(someColor)
                                        .frame(width: 90, height: 90)
                                }
                                VStack(alignment: .leading) {
                                    Text(entry.jobTitle)
                                        .font(.headline)
                                    Text(entry.companyName)
                                        .font(.subheadline)
                                    Text(entry.city)
                                        .font(.subheadline)
                                    Text(entry.period)
                                        .font(.subheadline)
                                    Text(entry.hourlyRate) // Display hourly rate
                                        .font(.subheadline)
                                }
                                .padding(.leading, 10)
                            }
                            .padding()
                            Divider()
                        }
                    }
                    .padding(.top, 130)
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct MyJobs_Previews: PreviewProvider {
    static var previews: some View {
        MyJobs().environmentObject(JobDataModel())
    }
}
