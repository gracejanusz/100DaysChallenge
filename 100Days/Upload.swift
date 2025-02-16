//
//  Upload.swift
//  100Days
//
//  Created by 24AeliyaGrover on 2/15/25.
//

import SwiftUI

struct Upload: View {
    @State private var songTitle: String = ""
    @State private var artistName: String = ""
    @State private var review: String = ""
    @State private var rating: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Upload").font(.largeTitle).bold()
            
            Text("Song Title")
                .font(.headline)
            TextField("Enter song title...", text: $songTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // Artist Name Input
            Text("Artist Name")
                .font(.headline)
            TextField("Enter artist name...", text: $artistName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Review:")
            TextEditor(text: $review)
                .frame(height: 150)
                .border(Color.gray, width: 1)
                .cornerRadius(5)
            
            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ? "music.note" : "music.note")
                        .foregroundColor(index <= rating ? .blue : .gray)
                        .onTapGesture {
                            rating = index
                        }
                }
            }
            .font(.title2)
            
            HStack {
                Button(action: {
                    songTitle = ""
                    artistName = ""
                    review = ""
                    rating = 0
                }) {
                    Text("Delete")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Handle post action
                }) {
                    Text("Post")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        Upload()
    }
}
