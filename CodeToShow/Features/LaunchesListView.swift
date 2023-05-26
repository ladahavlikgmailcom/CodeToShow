//
//  LaunchesListView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct LaunchesListView: View {

    // MARK: - ViewModel

    @StateObject private var vm: LaunchesListViewModel = LaunchesListViewModel()

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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    toolbarItemContent
                }
            }
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

    var toolbarItemContent: some View {
        Menu {
            Group {
                ForEach(SortingEnum.allCases, id: \.self) { item in
                    Button(item.rawValue, action: { vm.sortData(sortingEnum: item) })
                }
            }
        } label: {
            Image(systemName: "arrow.up.arrow.down.circle")
        }
    }
}

// MARK: - Previews

struct LaunchesListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesListView()
    }
}
