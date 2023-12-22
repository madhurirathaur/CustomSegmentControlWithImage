//
//  ContentView.swift
//  SegmentWithImage
//
//  Created by MVijay on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedSegment: Int
    var body: some View {
        VStack {
            Text("Custom segment with Image").padding()
            CustomSegmentWithImage(segments: [Mode.easy, Mode.medium,  Mode.advanced], completion: { item in
                print(Mode(rawValue: item)?.title ?? "")
            })
        }
    }
}

//Custom segment with image
struct CustomSegmentWithImage: View {
    var segments: [Segmentable]
    @State var selectedIndex = 1
    var completion: (Int) -> Void
    var body: some View {
        HStack(spacing: 0) {
            
            ForEach(0..<segments.count, id: \.self) { index in
                SegmentWithImage(segmentDetails: segments [index], segementIndex: index, totalCount: segments.count, selectedIndex: $selectedIndex)
                    .padding (.horizontal, 0.2)
            }
        }
        .background (.black)
        .cornerRadius(50)
        .onChange (of: selectedIndex) { newValue in
            completion (newValue)
        }
        Spacer (minLength: 0)
    }
}
 


enum Mode : Int, Segmentable {
    case easy
    case medium
    case advanced
    
    var title: String {
        switch self {
        case .easy:
            "Easy"
        case .medium:
            "Medium"
        case .advanced:
            "advanced"
        }
    }
                
    
    var imageSelected: String {
        switch self {
        case .easy:
            return "die.face.1"
        case .medium:
            return "die.face.2"
        case .advanced:
            return "die.face.3"
        }
    }
    
    var imageUnselected: String {
        switch self {
        case .easy:
            return "die.face.1.fill"
        case .medium:
            return "die.face.2.fill"
        case .advanced:
            return "die.face.3.fill"
        }
    }
}



#Preview {
    CustomSegmentWithImage(segments: [Mode.easy, Mode.advanced, Mode.medium], completion: { item in
        print(item)
    })
}



