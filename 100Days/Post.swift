//
//  Post.swift
//  100Days
//
//  Created by grace janusz on 2/10/25.
//

import Foundation

struct Post {
    var username: String
    var songTitle: String
    var artist: String
    var image: String // This can be a URL string or an image name
    var ranking: Int // We can use an integer to store a ranking scale (e.g., 1-5)
    var time: String // Time of the post (e.g., "Feb 10, 2025 5:00 PM")
    var comments: String
}
