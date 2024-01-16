![Meikade-icon](https://avatars.githubusercontent.com/u/75824180?s=100&v=4)
#  Muzei Swift API
[![Platform](http://img.shields.io/badge/Platform-iOS/iPadOS/macOS/watchOS/visionOS-blue.svg)](https://developer.apple.com/iphone/index.action)
![License](https://img.shields.io/github/license/Rminsh/MuzeiSwiftAPI)

[Muzei](https://muzei.co/) is an app that serves as a living museum for your device's home screen. This package is designed to load [Muzei's API](http://api.muzei.co/) and retrieve the URL for today's featured art or archive list. You can check out the original project [here](http://code.muzei.co/) 



## 📋 Requirements
- iOS: 15.0 or later.
- macOS: 12.0 or later.
- watchOS: 8.0 or later.
- visionOS: 1.0 or later.



## ⚒️ Installation
You can install using the Swift Package Manager.
1. In Xcode, select "File" > "Add Package Dependencies".
2. Copy & paste the following into the "Search or Enter Package URL" search bar.
```
https://github.com/Rminsh/MuzeiSwiftAPI.git
```
3. Xcode will fetch the repository & the "MuzeiSwiftAPI" library will be added to your project.



## 📱 Usage examples

### Featured Art
```swift
import SwiftUI
import MuzeiSwiftAPI

struct FeaturedView: View {
    
    @State var url: URL? = nil
    
    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .aspectRatio(contentMode: .fit)
        .frame(minWidth: 512, minHeight: 512)
        .task {
            let service = MuzeiService()
            do {
                let response = try await service.getFeatured()
                url = URL(string: response.imageURI)
            } catch {
                print(error)
            }
        }
    }
}

```

### Archived arts

```swift
import SwiftUI
import MuzeiSwiftAPI

struct ArchiveView: View {
    
    @State var artworks: Artworks = []
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 250))]) {
                ForEach(artworks, id: \.thumbURL) { artwork in
                    AsyncImage(url: URL(string: artwork.thumbURL)) { image in
                        image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(minHeight: 250)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .overlay(alignment: .bottom) {
                        Text(artwork.title)
                            .background(.regularMaterial)
                    }
                }
            }
        }
        .task {
            let service = MuzeiService()
            do {
                /// You can specify any previous months that you like
                /// Note: Current month and future months does not work
                let lastMonth = Date.now.addingTimeInterval(-24 * 60 * 60 * 30)  
                artworks = try await service.getArchive(date: .custom(date: lastMonth))
            } catch {
                print(error)
            }
        }
    }
}
```



## 🧩 Contribute 

Want to contribute? I would really appreciate a hand with the development to add more features in this package.
Feel free to Fork, edit, then pull!

