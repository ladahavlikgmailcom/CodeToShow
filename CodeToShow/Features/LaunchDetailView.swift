//
//  LaunchDetailView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct LaunchDetailView: View {

    // MARK: - State variables

#if os(visionOS) || os(tvOS) || os(watchOS) || os(macOS)
    private let isLandscape: Bool = false
#else
    @State private var isLandscape = UIDevice.current.orientation.isLandscape
#endif

    // MARK: - Local variables

    let data: StarlinkModel

    // MARK: - Body part

    var body: some View {
        Group {
            if isLandscape {
                HStack(spacing: 16) {
                    patch
                        .frame(maxWidth: 300, alignment: .leading)
                        .padding(.leading, 32)
                    ScrollView(showsIndicators: false) {
                        scrollable
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } else {
                ScrollView(showsIndicators: false) {
                    patch
                    scrollable
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                }
                .padding(.horizontal)
            }
        }
#if !os(tvOS) && !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
#if !os(visionOS) && !os(tvOS) && !os(watchOS) && !os(macOS)
        .onRotate { isLandscape in
            self.isLandscape = isLandscape
        }
#endif
    }

    // MARK: Body particles

    @ViewBuilder
    var patch: some View {
        AsyncImage(url: data.links.patch.small) { asyncImage in
            asyncImage.image?
                .resizable()
                .scaledToFit()
                .frame(width: 234, height: 234, alignment: .center)
        }
    }

    @ViewBuilder
    var scrollable: some View {
        header
        crew
        rocket
    }

    @ViewBuilder
    var header: some View {
        Text(data.name)
            .font(.title)
            .frame(maxWidth: .infinity)
        VStack(alignment: .leading) {
            LabeledContent("Date", value: data.dateUtc.formatted())
            LabeledContent("Flight number", value: "\(data.flightNumber)")
            if let launchDate = data.staticFireDateUtc {
                LabeledContent("Launch", value: launchDate.formatted())
            }
            LabeledContent("Mission state", value: data.success.handleSuccess())
            if let details = data.details {
                Text(details)
            }
        }
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    var crew: some View {
        if data.crew.count >= 1 {
            CrewView(crew: data.crew)
        }
    }

    @ViewBuilder
    var rocket: some View {
        if !data.rocket.isEmpty {
            RocketView(id: data.rocket)
        }
    }
}

// MARK: - Previews

#Preview {
    NavigationStack {
        LaunchDetailView(data: StarlinkModel.mock())
    }
}
