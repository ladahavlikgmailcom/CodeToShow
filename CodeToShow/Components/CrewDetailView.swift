//
//  CrewDetailView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct CrewDetailView: View {

    // MARK: - Local variables

    let member: CrewMember

    // MARK: - Body part

    var body: some View {
        VStack(alignment: .leading) {
            Text(member.role.role)
                .font(.headline)
            AsyncImage(url: member.astronaut.image?.url) { asyncImage in
                asyncImage.image?
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            LabeledContent("Name", value: member.astronaut.name)
            if let agency = member.astronaut.agency {
                LabeledContent("Agency", value: agency.name)
            }
        }
    }
}

// MARK: - Previews

#Preview {
    if let member = LaunchModel.mock().crew.first {
        CrewDetailView(member: member)
            .padding()
    }
}
