//
//  JobDataModel.swift
//  WorkVineApp
//
//  Created by user264764 on 7/11/24.
//

import SwiftUI
import Combine

class JobDataModel: ObservableObject {
    @Published var jobEntries: [JobEntry] = []
}
