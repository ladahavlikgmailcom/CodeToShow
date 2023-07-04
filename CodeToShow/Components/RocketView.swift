//
//  RocketView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct RocketView: View {

    // MARK: - View Model

    var vm: RocketViewModel

    // MARK: - Initializer

    init(id: String) {
        self.vm = RocketViewModel(id: id)
    }

    // preview initializer
    init(data: RocketModel) {
        self.vm = RocketViewModel(data: data)
    }

    // MARK: - Body part

    var body: some View {
        if let data = vm.data {
            VStack(alignment: .leading) {
                Text("Rocket")
                    .font(.title2)
                LabeledContent("Name", value: data.name)
                LabeledContent("Company", value: data.company)
                LabeledContent("Country", value: data.country)
                LabeledContent("Stages", value: "\(data.stages)")
                LabeledContent("Boosters", value: "\(data.boosters)")
                Text(data.description)
                AsyncImage(url: vm.data?.flickrImages.first) { asyncImage in
                    asyncImage.image?
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
}

// MARK: - Previews

#Preview {
    RocketView(data: RocketModel.mock())
        .padding()
}
