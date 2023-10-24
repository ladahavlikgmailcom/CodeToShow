//
//  LaunchesListView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct LaunchesListView: View {

    // MARK: - ViewModel

    @Bindable var vm: LaunchesListViewModel = LaunchesListViewModel()

    // MARK: - Body part

    var body: some View {
        NavigationStack {
            Group {
                if vm.showError {
                    ErrorView(data: vm.errorModel!) {
                        vm.loadData()
                    }
                } else {
                    listContent
                }
            }
            .navigationTitle("Missions")
#if !os(watchOS) && !os(macOS)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    toolbarItemContent
                }
            }
#endif
            .navigationDestination(for: StarlinkModel.self) { item in
                LaunchDetailView(data: item)
            }
        }
        .searchable(text: $vm.searchText)
        .refreshable { vm.loadData() }
    }

    // MARK: - View particles

    var listContent: some View {
        List {
            ForEach(vm.dataModel, id: \.id) { item in
                NavigationLink(value: item) {
                    LaunchRowView(data: item)
                }
            }
        }
    }

    @ViewBuilder
    var toolbarItemContent: some View {
#if !os(watchOS)
        Menu {
            Group {
                ForEach(SortingEnum.allCases, id: \.self) { item in
                    Button(item.localized, action: { vm.sortData(sortingEnum: item) })
                }
            }
        } label: {
            Image(systemName: "arrow.up.arrow.down.circle")
        }
#endif
    }
}

// MARK: - Previews

#Preview {
    LaunchesListView()
}
