//
//  ErrorView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct ErrorView: View {

    // MARK: - Local variables

    let data: ErrorModel
    var handler: () -> Void

    // MARK: - Body Part

    var body: some View {
        VStack {
            data.errorPicture
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(maxWidth: 100, maxHeight: 100)
            Text(data.errorText)
                .font(.headline)
            Button("Refresh", action: handler)
                .padding(.top)
        }
    }
}

// MARK: - Previews

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(
            data:
                ErrorModel(
                    errorPicture: Image(systemName: "exclamationmark.shield.fill"),
                    errorText: "Sample error text to show."),
            handler: {}
        )
    }
}
