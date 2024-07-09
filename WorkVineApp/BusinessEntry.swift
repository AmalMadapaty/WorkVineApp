//
//  BusinessEntry.swift
//  WorkVineApp
//
//  Created by user264764 on 7/9/24.
//

import Foundation
import SwiftUI
struct BusinessEntry: View {
    @State private var fields = ["Title of Job", "Name of Company", "Location", "Job Form (Hybrid, Remote, In Person)", "Job Description", "Salary"]
    @State private var values = ["", "", "", "", "", ""]
    var body: some View {
        VStack(spacing: 16) {
            Text("*New Entry:*")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Rectangle().fill(Color("iconColor")).frame(width:500, height: 60))
                .padding(.top, 30)
                .padding(.bottom, 10)
            ForEach(0..<fields.count, id: \.self) { index in
                TextField(fields[index], text: $values[index])
                    .padding(.bottom, 40)
                    .padding(.top, 20)
                    .padding(.leading)
                    .background(Color("backColor"))
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            }
            Button("Submit") {
                // Do something with the entered values
                print("Name: \(values[0])")
                print("Email: \(values[1])")
                print("Phone: \(values[2])")
            }
            Rectangle()
                .fill(.black)
                .frame(width: 500, height: 3)
            HStack{
                Image("homeIcon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 50)
                Image("plusIconc")
                    .resizable()
                    .frame(width: 45, height: 45)
                Image("personIcon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 50)
            }
        }
        .padding()
    }
}

    struct BusinessEntry_Previews: PreviewProvider {
        static var previews: some View {
            BusinessEntry()
        }
    }
