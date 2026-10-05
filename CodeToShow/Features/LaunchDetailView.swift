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

    // MARK: - ViewModel

    @State private var vm = LaunchDetailViewModel()

    // MARK: - Local variables

    /// Launch from the list, it is shown until the detail is loaded.
    let data: LaunchModel

    /// Launch with all values which are available.
    private var launch: LaunchModel {
        vm.detail ?? data
    }

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
        .task {
            await vm.loadDetail(id: data.id)
        }
    }

    // MARK: Body particles

    @ViewBuilder
    var patch: some View {
        AsyncImage(url: launch.image?.url) { asyncImage in
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
        Text(launch.name)
            .font(.title)
            .frame(maxWidth: .infinity)
        VStack(alignment: .leading) {
            LabeledContent("Date", value: launch.net?.formatted() ?? "Not known".localized())
            LabeledContent("Mission state", value: launch.isSuccess.handleSuccess())
            if let details = launch.mission?.description, !details.isEmpty {
                Text(details)
            }
        }
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    var crew: some View {
        if !launch.crew.isEmpty {
            CrewView(crew: launch.crew)
        }
    }

    @ViewBuilder
    var rocket: some View {
        if let configuration = launch.rocket?.configuration {
            RocketView(configuration: configuration)
        }
    }
}

// MARK: - Previews

#Preview {
    NavigationStack {
        LaunchDetailView(data: LaunchModel.mock())
    }
}
