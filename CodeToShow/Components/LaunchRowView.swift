//
//  LaunchRowView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct LaunchRowView: View {

    // MARK: - Local variables

    let data: LaunchModel

    // MARK: - Body part

    var body: some View {
#if os(watchOS)
        VStack {
            smallPatch
                .frame(maxWidth: 40, maxHeight: 40)
            textInfo
        }
#else
        HStack {
            smallPatch
                .frame(maxWidth: 100, maxHeight: 100)
            textInfo
                .frame(maxWidth: .infinity, alignment: .leading)
        }
#endif
    }

    // MARK: - Body particles

    var smallPatch: some View {
        AsyncImage(url: data.image?.thumbnail) { asyncImage in
            asyncImage
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "slash.circle")
                .resizable()
                .foregroundStyle(.gray)
        }
    }

    var textInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(data.name)
                .font(.title3)
            Text("Date \(data.net?.formatted() ?? "Not known".localized())")
            Text("Mission state \(data.isSuccess.handleSuccess())")
        }
    }
}

// MARK: - Previews

#Preview {
    LaunchRowView(data: LaunchModel.mock())
        .padding()
}
