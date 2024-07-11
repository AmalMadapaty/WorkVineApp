//
//  BusinessHome.swift
//  WorkVineApp
//
//  Created by user264764 on 7/9/24.
//

import Foundation
import SwiftUI

struct OtherHome: View {
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 10).stroke(Color.black)
                    .frame(width: 360, height: 40)
                HStack{
                    Image("searchImage")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.top, 5)
                    Text("Search")
                        .padding(.trailing, 250)
                }
            }
            .padding(.bottom, 15)
            Text("**Welcome Back User!**")
                .font(.largeTitle)
                .background(Rectangle().fill(Color("backColor")).frame(width:500, height: 60))
            Text("**Here's what's new:**")
                .background(Rectangle().fill(Color("backColor")).frame(width: 500, height: 40))
            Text("_Current Applicants:_")
                .padding(.top, 10)
                .padding(.trailing, 180)
            ScrollView{
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("iconColor"))
                            .frame(width:70, height:70)
                        Text("Icon")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).stroke(Color.black)
                            .frame(width:250, height:85)
                        VStack{
                            Text("**Name**")
                                .font(.title2)
                                .padding(.trailing, 170)
                            Text("*Contact Info*")
                                .padding(.trailing, 136)
                            Text("Link to Bio")
                                .underline()
                                .padding(.trailing, 150)
                        }
                    }
                    .padding(.bottom, 5)
                }
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("iconColor"))
                            .frame(width:70, height:70)
                        Text("Icon")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).stroke(Color.black)
                            .frame(width:250, height:85)
                        VStack{
                            Text("**Name**")
                                .font(.title2)
                                .padding(.trailing, 170)
                            Text("*Contact Info*")
                                .padding(.trailing, 136)
                            Text("Link to Bio")
                                .underline()
                                .padding(.trailing, 150)
                        }
                    }
                    .padding(.bottom, 5)
                }
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("iconColor"))
                            .frame(width:70, height:70)
                        Text("Icon")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).stroke(Color.black)
                            .frame(width:250, height:85)
                        VStack{
                            Text("**Name**")
                                .font(.title2)
                                .padding(.trailing, 170)
                            Text("*Contact Info*")
                                .padding(.trailing, 136)
                            Text("Link to Bio")
                                .underline()
                                .padding(.trailing, 150)
                        }
                    }
                    .padding(.bottom, 5)
                }
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("iconColor"))
                            .frame(width:70, height:70)
                        Text("Icon")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).stroke(Color.black)
                            .frame(width:250, height:85)
                        VStack{
                            Text("**Name**")
                                .font(.title2)
                                .padding(.trailing, 170)
                            Text("*Contact Info*")
                                .padding(.trailing, 136)
                            Text("Link to Bio")
                                .underline()
                                .padding(.trailing, 150)
                        }
                    }
                    .padding(.bottom, 5)
                }
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("iconColor"))
                            .frame(width:70, height:70)
                        Text("Icon")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).stroke(Color.black)
                            .frame(width:250, height:85)
                        VStack{
                            Text("**Name**")
                                .font(.title2)
                                .padding(.trailing, 170)
                            Text("*Contact Info*")
                                .padding(.trailing, 136)
                            Text("Link to Bio")
                                .underline()
                                .padding(.trailing, 150)
                        }
                    }
                    .padding(.bottom, 5)
                    
                }
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("iconColor"))
                            .frame(width:70, height:70)
                        Text("Icon")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).stroke(Color.black)
                            .frame(width:250, height:85)
                        VStack{
                            Text("**Name**")
                                .font(.title2)
                                .padding(.trailing, 170)
                            Text("*Contact Info*")
                                .padding(.trailing, 136)
                            Text("Link to Bio")
                                .underline()
                                .padding(.trailing, 150)
                        }
                    }
                    .padding(.bottom, 5)
                    
                }
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("iconColor"))
                            .frame(width:70, height:70)
                        Text("Icon")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 10)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).stroke(Color.black)
                            .frame(width:250, height:85)
                        VStack{
                            Text("**Name**")
                                .font(.title2)
                                .padding(.trailing, 170)
                            Text("*Contact Info*")
                                .padding(.trailing, 136)
                            Text("Link to Bio")
                                .underline()
                                .padding(.trailing, 150)
                        }
                    }
                    .padding(.bottom, 5)
                    
                }
            }
            }
        .padding()
        Rectangle()
            .fill(.black)
            .frame(width: 500, height: 3)
            .padding(5)
        HStack {
            Image("homeIconc")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 50)
            
            NavigationLink(destination: BusinessEntry()) {
                Image("plusIcon")
                    .resizable()
                    .frame(width: 45, height: 45)
            }
            
            Image("personIcon")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.leading, 50)
        }
    }
}
struct OtherHome_Previews: PreviewProvider {
    static var previews: some View {
        OtherHome()
    }
}
