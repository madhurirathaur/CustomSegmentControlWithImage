//
//  SegmentWithImage.swift
//  SegmentWithImage
//
//  Created by MVijay on 22/12/23.
//

import SwiftUI

//Protocol for segment with image and text
protocol Segmentable {
    var title: String { get }
    var imageSelected: String { get }
    var imageUnselected: String { get }
}

//Each segment View
struct SegmentWithImage: View {
    var segmentDetails: Segmentable
    var segementIndex: Int
    var totalCount: Int
    @Binding var selectedIndex: Int
    var body: some View {
        HStack(spacing: 8) {
            
            Image (systemName: selectedIndex == segementIndex ? segmentDetails.imageSelected : segmentDetails.imageUnselected)
                .frame(width: 25, height: 25, alignment: .center)
                .foregroundColor(selectedIndex == segementIndex ? .white : .gray)
            Text (segmentDetails.title)
                .foregroundColor(selectedIndex == segementIndex ? .white : .black)
                .lineLimit (1)
                .font (getFont())
        }
        
        .frame(width:getEachSegmentWidth())
        .padding(.vertical, 10)
        .background(selectedIndex == segementIndex ? .blue : .yellow)
        .onTapGesture {
            selectedIndex = segementIndex
        }
    }
    func getFont() -> Font {
        (selectedIndex == segementIndex) ? .system (size: 16, weight: .semibold): .system(size: 15, weight: .regular)
    }
    // To get each segment width based on screen size
    func getEachSegmentWidth()-> CGFloat {
        return ((UIScreen.main.bounds.width - 40) / CGFloat(totalCount))
    }
}

