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

    let data: StarlinkModel

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
        AsyncImage(url: data.links.patch.small) { asyncImage in
            asyncImage.resizable()
        } placeholder: {
            Image(systemName: "slash.circle")
                .resizable()
                .foregroundColor(.gray)
        }
    }

    var textInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(data.name)
                .font(.title3)
            Text("Flight number \(data.flightNumber)")
            Text("Date \(data.dateUtc.formatted())")
            Text("Mission state \(data.success.handleSuccess())")
        }
    }
}

// MARK: - Previews

#Preview {
    LaunchRowView(data: StarlinkModel.mock())
        .padding()
}
