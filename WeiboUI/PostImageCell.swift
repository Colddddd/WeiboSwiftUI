//
//  PostImageCell.swift
//  WeiboUI
//
//  Created by zzz on 2020/7/6.
//  Copyright © 2020 zzz. All rights reserved.
//  多图 view

import SwiftUI

private let containerWidth = UIScreen.main.bounds.width - 30 // 左右间距
private let itemPadding: CGFloat = 6


struct PostImageCell: View {
    
    // 数组资源
    let images: [String]
    
    var body: some View {
        Group {
            if images.count == 1 {
                getPostImage(images.first!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: containerWidth, height: containerWidth * 0.75)
                    .clipped()
            } else if images.count == 2 {
                PostImageRowCell(images: images)
            } else if images.count == 3 {
                PostImageRowCell(images: images)
            } else if images.count == 4 {
                VStack() {
                    PostImageRowCell(images: Array(images[0...1]))
                    PostImageRowCell(images: Array(images[1...2]))
                }
            } else if images.count == 5 {
                VStack() {
                    PostImageRowCell(images: Array(images[0...1]))
                    PostImageRowCell(images: Array(images[1...3]))
                }
            } else if images.count == 6 {
                VStack() {
                    PostImageRowCell(images: Array(images[0...2]))
                    PostImageRowCell(images: Array(images[2...4]))
                }
            } else {
                
            }
        }
    }
}

struct PostImageRowCell: View {

    var images: [String]
    
    // 每个item 宽度
    var itemW: CGFloat {
        return (containerWidth - CGFloat(images.count - 1 ) * itemPadding) / CGFloat(images.count)
    }

    var body: some View {
        HStack(spacing: itemPadding) {
            ForEach(images, id: \.self) { imgUrl in
                getPostImage(imgUrl)
                .resizable()
                .scaledToFill()
                .frame(width: self.itemW, height: self.itemW)
                .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostImageCell(images: Array(postList.list[0].images[0...0]))
            PostImageCell(images: Array(postList.list[0].images[0...1]))
            PostImageCell(images: Array(postList.list[0].images[0...2]))
            PostImageCell(images: Array(postList.list[0].images[0...3]))
            PostImageCell(images: Array(postList.list[0].images[0...4]))
            PostImageCell(images: Array(postList.list[0].images[0...5]))
        }
        .previewLayout(.fixed(width: containerWidth, height: 400))
    }
}
