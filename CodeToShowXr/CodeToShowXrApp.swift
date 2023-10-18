//
//  CodeToShowXrApp.swift
//  CodeToShowXr
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

@main
struct CodeToShowXrApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchesListView()
                .frame(maxWidth: 650)
        }
    }
}
