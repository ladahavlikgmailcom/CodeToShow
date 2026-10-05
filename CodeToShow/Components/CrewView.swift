//
//  CrewView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct CrewView: View {

    // MARK: - Local variables

    var crew: [CrewMember]

    // MARK: - Body part

    var body: some View {
        VStack(alignment: .leading) {
            Text("Crew")
                .font(.title2)
                .padding(.bottom)
            ForEach(crew) { member in
                CrewDetailView(member: member)
                    .padding(.bottom)
            }
        }
    }
}

// MARK: - Previews

#Preview {
    ScrollView {
        CrewView(crew: LaunchModel.mock().crew)
    }
    .padding()
}
