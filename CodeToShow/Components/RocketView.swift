//
//  RocketView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct RocketView: View {

    // MARK: - Local variables

    let configuration: RocketConfiguration

    // MARK: - Body part

    var body: some View {
        VStack(alignment: .leading) {
            Text("Rocket")
                .font(.title2)
            LabeledContent("Name", value: configuration.fullName ?? configuration.name)
            if let manufacturer = configuration.manufacturer {
                LabeledContent("Company", value: manufacturer.name)
                if let country = manufacturer.country?.first {
                    LabeledContent("Country", value: country.name)
                }
            }
            if let description = configuration.description, !description.isEmpty {
                Text(description)
            }
            AsyncImage(url: configuration.image?.url) { asyncImage in
                asyncImage.image?
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

// MARK: - Previews

#Preview {
    if let configuration = LaunchModel.mock().rocket?.configuration {
        RocketView(configuration: configuration)
            .padding()
    }
}
