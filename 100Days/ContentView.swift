import SwiftUI
import AVKit

struct Video: Identifiable {
    let id = UUID()
    let url: URL
}

struct ContentView: View {
    let videos = [
        Video(url: URL(string: "https://www.w3schools.com/html/mov_bbb.mp4")!),
        Video(url: URL(string: "https://www.w3schools.com/html/movie.mp4")!),
        Video(url: URL(string: "https://www.w3schools.com/html/mov_bbb.mp4")!)
    ]
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView(videos: videos)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                Text("Search")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                UploadView()
                    .tabItem {
                        Image(systemName: "plus.app.fill")
                        Text("Upload")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView: View {
    let videos: [Video]
    let texts = [
        "I loved Kendrick's halftime show!",
        "Taylor Swift and Travis Kelce love song",
        "I need songs like Champagne Coast!",
        "Juice WRLD summer 2025!"
    ]
    
    @State private var selectedIndex = 0 // Track the selected index for snapping
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(videos) { video in
                            VideoPlayerView(videoURL: video.url)
                                .frame(height: 300)
                                .id(video.id) // Use `video.id` for proper identification
                                .onAppear {
                                    if selectedIndex != videos.firstIndex(where: { $0.id == video.id }) {
                                        selectedIndex = videos.firstIndex(where: { $0.id == video.id }) ?? 0
                                    }
                                }
                            
                            // Large text box between videos with random text
                            NavigationLink(destination: PostView()) {
                                Text(texts.randomElement() ?? "Default text")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 150)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .padding()
                                    .foregroundColor(.black)
                                    .accessibilityLabel("Random post text") // Added accessibility label
                                    .accessibilityHint("This is a random text post between videos.") // Optional
                            }
                        }
                    }
                    .onChange(of: selectedIndex) { newIndex in
                        withAnimation {
                            proxy.scrollTo(newIndex, anchor: .center)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct VideoPlayerView: View {
    let videoURL: URL
    @State private var player: AVPlayer?
    
    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayer(player: player)
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
                    .onTapGesture {
                        if player.timeControlStatus == .playing {
                            player.pause()
                        } else {
                            player.play()
                        }
                    }
                    .accessibilityLabel("Video player for \(videoURL.lastPathComponent)") // Accessibility label
                    .accessibilityHint("Tap to play or pause the video.") // Accessibility hint
                    .accessibilityElement() // Mark this element as accessible for VoiceOver
            } else {
                ProgressView("Loading video...") // Show loading indicator while video is initializing
                    .frame(height: 300)
                    .onAppear {
                        // Initialize player once
                        player = AVPlayer(url: videoURL)
                    }
                    .accessibilityLabel("Loading video...") // Added loading accessibility label
                    .accessibilityHint("This video is currently loading.") // Loading hint
                    .accessibilityElement() // Mark as accessible during loading
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
