//
//  PostView.swift
//  100Days
//
//  Created by grace janusz on 2/10/25.
//
import SwiftUI

struct PostView: View {
    var post: Post // Accept a Post object

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // User Information
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(post.username)
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal)

            // Song Information
            VStack(alignment: .leading) {
                Text(post.songTitle)
                    .font(.title3)
                    .bold()
                Text(post.artist)
                    .font(.subheadline)
            }
            .padding(.horizontal)

            // Image Placeholder (using the post's image)
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 200)
                .overlay(Text("Album Art or Image")
                            .foregroundColor(.black).opacity(0.6))

            // Ranking/Scale System
            HStack {
                ForEach(0..<post.ranking) { _ in
                    Image(systemName: "music.note")
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding(.horizontal)

            // Time, Date, and Comments
            Text(post.time)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)

            Text("Comments:")
                .font(.subheadline)
                .bold()
                .padding(.horizontal)

            // Comment Box Placeholder
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
                .frame(height: 40)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample Post object for the preview
        let samplePost = Post(
            username: "Grace Janusz",
            songTitle: "Song Title Example",
            artist: "Artist Name",
            image: "album_art.png", // This would be the actual image name or URL
            ranking: 4,
            time: "Feb 10, 2025 5:00 PM",
            comments: "Great track!"
        )
        
        PostView(post: samplePost)
    }
}
