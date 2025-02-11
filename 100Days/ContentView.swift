import SwiftUI
import AVKit

struct Video: Identifiable {
    let id = UUID()
    let url: String
}

struct ContentView: View {
    let videos = [
        Video(url: "https://www.w3schools.com/html/mov_bbb.mp4"),
        Video(url: "https://www.w3schools.com/html/movie.mp4"),
        Video(url: "https://www.w3schools.com/html/mov_bbb.mp4")
    ]
    
    var body: some View {
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
            Text("Upload")
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
        ScrollViewReader { proxy in // For scroll snapping
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(videos.indices, id: \ .self) { index in
                        VideoPlayerView(videoURL: videos[index].url)
                            .frame(height: 300) // Set fixed height for each video
                            .id(index) // Give each video a unique identifier for scrolling
                            .onAppear {
                                if selectedIndex != index {
                                    selectedIndex = index
                                }
                            }
                        
                        // Large text box between videos with random text
                        Text(texts.randomElement() ?? "Default text")
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding()
                    }
                }
                .onChange(of: selectedIndex) { newIndex in
                    withAnimation {
                        proxy.scrollTo(newIndex, anchor: .center) // Scroll to the selected video with snapping effect
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct VideoPlayerView: View {
    let videoURL: String
    @State private var player: AVPlayer? = nil
    @State private var isPlaying = true
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .frame(maxWidth: .infinity) // Fill width of the container
                .frame(height: 300) // Set fixed height for video player
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    player = AVPlayer(url: URL(string: videoURL)!)
                    player?.play()
                }
                .onDisappear {
                    player?.pause()
                    player = nil
                }
                .onTapGesture {
                    if player?.timeControlStatus == .playing {
                        player?.pause()
                    } else {
                        player?.play()
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
