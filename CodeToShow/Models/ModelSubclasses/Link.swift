//
//  Link.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Link: Codable {

    // MARK: - Structure

    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: URL?
    let webcast: URL?
    let youtubeID: String?
    let article: URL?
    let wikipedia: URL?

    // MARK: - Initializer

    // swiftlint:disable:next line_length
    init(patch: Patch, reddit: Reddit, flickr: Flickr, presskit: URL?, webcast: URL?, youtubeID: String?, article: URL?, wikipedia: URL?) {
        self.patch = patch
        self.reddit = reddit
        self.flickr = flickr
        self.presskit = presskit
        self.webcast = webcast
        self.youtubeID = youtubeID
        self.article = article
        self.wikipedia = wikipedia
    }
}
