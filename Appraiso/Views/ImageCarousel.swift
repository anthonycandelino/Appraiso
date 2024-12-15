//
//  ImageCarousel.swift
//  Appraiso
//
//  Created by Anthony Candelino on 2024-12-14.
//

import SwiftUI

struct ImageCarousel: View {
    let images = ["Slide 1", "Slide 2", "Slide 3", "Slide 4"] // Replace with your image names
    @State private var currentIndex = 0
    @State private var isForward = true // Direction tracker: true for forward, false for backward
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body: some View {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        ForEach(images.indices, id: \.self) { index in
                            Image(images[index])
                                .resizable()
                                .scaledToFill() // Ensures the image fills its space
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped() // Ensures images don't overflow
                        }
                    }
                    .frame(width: geometry.size.width * CGFloat(images.count), height: geometry.size.height)
                    .offset(x: -CGFloat(currentIndex) * geometry.size.width)
                    .animation(.easeInOut(duration: 0.5), value: currentIndex)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Use available screen space

                // Dots indicator
                HStack {
                    ForEach(images.indices, id: \.self) { index in
                        Circle()
                            .fill(currentIndex == index ? .accentColor : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top, 10)
            }
            .edgesIgnoringSafeArea(.all) // Ensures it spans the full screen
            .onReceive(timer) { _ in
                withAnimation {
                    if isForward {
                        // Move forward through the images
                        if currentIndex < images.count - 1 {
                            currentIndex += 1
                        } else {
                            // Reverse direction when reaching the last image
                            isForward = false
                            currentIndex -= 1
                        }
                    } else {
                        // Move backward through the images
                        if currentIndex > 0 {
                            currentIndex -= 1
                        } else {
                            // Reverse direction when reaching the first image
                            isForward = true
                            currentIndex += 1
                        }
                    }
                }
            }
        }
    }

    #Preview {
        ImageCarousel()
    }
