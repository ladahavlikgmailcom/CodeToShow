//
//  CrewView.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct CrewView: View {

    // MARK: - Local variables

    var crew: [Crew]

    // MARK: - Body part

    var body: some View {
        VStack(alignment: .leading) {
            Text("Crew")
                .font(.title2)
                .padding(.bottom)
            ForEach(crew, id: \.crew) { item in
                CrewDetailView(crew: item)
                    .padding(.bottom)
            }
        }
    }
}

// MARK: - Previews

#Preview {
    ScrollView {
        CrewView(crew: [
            Crew(crew: "62dd7196202306255024d13c", role: "Commander"),
            Crew(crew: "62dd71c9202306255024d13d", role: "Pilot"),
            Crew(crew: "62dd7210202306255024d13e", role: "Mission Specialist 1"),
            Crew(crew: "62dd7253202306255024d13f", role: "Mission Specialist 2")
        ])
    }
}
