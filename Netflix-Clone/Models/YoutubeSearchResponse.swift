//
//  YoutubeSearchResponse.swift
//  Netflix-Clone
//
//  Created by Ferid Suleymanzade on 07.11.24.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
