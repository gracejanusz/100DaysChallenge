import SwiftUI

struct UploadView: View {
    @State private var songTitle: String = ""
    @State private var artistName: String = ""
    @State private var review: String = ""
    @State private var rating: Int = 0 // Rating from 0 to 5

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Upload")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 10)

            // Song Title Input
            HStack {
                Text("Song Title:")
                    .bold()
                TextField("Type", text: $songTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            // Artist Name Input
            HStack {
                Text("Artist Name:")
                    .bold()
                TextField("Type", text: $artistName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            // Review Input
            VStack(alignment: .leading) {
                Text("Review:")
                    .bold()
                TextEditor(text: $review)
                    .frame(height: 150)
                    .border(Color.gray, width: 1)
                    .cornerRadius(5)
                    .padding(.top, 5)
            }

            // Rating System
            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < rating ? "music.note" : "music.note")
                        .foregroundColor(index < rating ? .blue : .gray)
                        .onTapGesture {
                            rating = index + 1
                        }
                }
            }
            .padding(.vertical)

            // Action Buttons
            HStack {
                Button(action: {
                    songTitle = ""
                    artistName = ""
                    review = ""
                    rating = 0
                }) {
                    Text("Delete")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    // Handle post action
                    print("Posted: \(songTitle) by \(artistName), Review: \(review), Rating: \(rating)")
                }) {
                    Text("Post")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
