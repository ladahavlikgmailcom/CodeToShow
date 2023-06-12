//
//  DeviceRotationViewModifier.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

/// Implementation of "orientationDidChangeNotification" into application.
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
    /// Catch rotation notification and retun if isLandscape.
    /// - Parameter action: Completion handler to process changed value.
    /// - Returns: some View with changed content respect orientation.
    func onRotate(perform action: @escaping (Bool) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
