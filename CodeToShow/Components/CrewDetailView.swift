//
//  CrewDetailView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct CrewDetailView: View {

    // MARK: - View Model

    var vm: CrewDetailViewModel

    // MARK: - Initializer

    init(crew: Crew) {
        self.vm = CrewDetailViewModel(crew: crew)
    }

    // preview initializer
    init(data: CrewModel) {
        self.vm = CrewDetailViewModel(data: data)
    }

    // MARK: - Body part

    var body: some View {
        if let data = vm.data {
            VStack(alignment: .leading) {
                Text(vm.crew.role)
                    .font(.headline)
                AsyncImage(url: vm.data?.image) { asyncImage in
                    asyncImage.image?
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                LabeledContent("Name", value: data.name)
                LabeledContent("Agency", value: data.agency)
            }
        }
    }
}

// MARK: - Previews

#Preview {
    CrewDetailView(data: CrewModel.mock())
        .padding()
}
