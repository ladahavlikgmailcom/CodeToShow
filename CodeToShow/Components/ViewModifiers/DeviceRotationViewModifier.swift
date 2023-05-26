//
//  DeviceRotationViewModifier.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {

    // MARK: - Local variable

    let action: (Bool) -> Void

    // MARK: - Body part

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation.isLandscape)
            }
    }
}

// MARK: - View extension

extension View {
    /// catch rotation notification and retun if isLandscape
    func onRotate(perform action: @escaping (Bool) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
