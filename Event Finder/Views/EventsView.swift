//
//  EventsView.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

import SwiftUI
import SDWebImage

struct EventsView: View {
    var events: [Event]
    
    var body: some View {
        List(self.events) { event in
            HStack {
                // Load the image into the view if one exists
                if let imageString = event.images.first?.url {
                    if let imageUrl = URL(string: imageString) {
                        if let currentImage = NSImage(contentsOf: imageUrl) {
                            //                            let currentImage = NSImageView(image: currentNSImage)
                            //                            currentImage.sd_setImage(with: imageUrl)
                            Image(nsImage: currentImage)
                                .resizable()
                                .frame(width: 128.0, height: 128.0)
                        }
                    }
                }
                VStack {
                    // Print the event name in large letters
                    Text(event.name)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
        
                    // Print various event details
                    Text("Event Date: " + (event.dates?.start?.localDate ?? "TBA"))
                    Text("Price range: $\(event.priceRanges?.first?.minString ?? "TBA") - $\(event.priceRanges?.first?.maxString ?? "TBA")")
                    let url = event.url
                    let link = "[Learn More & Buy Tickets](\(url))"
                    Text(.init(link))
                        .foregroundColor(.blue)
                }
            }
            Divider()
        }
    }
}

/*struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}*/
