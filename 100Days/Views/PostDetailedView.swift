import SwiftUI

struct PostDetailView: View {
    let postTitle: String
    let userName: String = "USERNAME"
    let postTime: String = "Time Date"
    let comments: String = "Comments:"

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // User Information
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(userName)
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal)

            // Post Title
            Text(postTitle)
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)

            // Image Placeholder
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 200)
                .overlay(Text("Image or Content Here")
                            .foregroundColor(.black).opacity(0.6))

            // Ranking/Scale System
            HStack {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Spacer()
            }
            .padding(.horizontal)

            // Time and Date
            Text(postTime)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)

            // Comments Section
            Text(comments)
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
        .navigationTitle(postTitle)
        .padding()
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(postTitle: "Sample Post Title")
    }
}
