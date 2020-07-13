//
//  PostCellBottomView.swift
//  WeiboUI
//
//  Created by zzz on 2020/7/6.
//  Copyright © 2020 zzz. All rights reserved.
//  cell bottom view

import SwiftUI

// 枚举按钮样式
enum BottomButton {
    case like
    case comment
}

struct PostCellBottomView: View {
    
    let imageName: String
    let title: String
    let color: Color
    let type: BottomButton
    var post: Post

    @EnvironmentObject var userData: UserData

    init(_ type: BottomButton, _ title: String, _ post: Post) {
        self.type = type
        self.post = post

        switch type {
        case .like:
            self.imageName = self.post.isLiked ? "heart.fill" : "heart"
            self.title = title
            self.color = Color.red
        default:
            self.imageName = "message"
            self.title = title
            self.color = Color.gray
        }
    }
    
    var body: some View {
        Button(action: {
            switch self.type {
            case .comment:
                print("zz")
                
            case .like:
                var post = self.post
                if !post.isLiked {
                    post.likeCount += 1
                    post.isLiked = true
                } else {
                    post.likeCount -= 1
                    post.isLiked = false
                }

                self.userData.updatePublishPost(post: post)
            }
        }) {
            Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 18, height: 18)
            
            Text(title)
                .font(.system(size: 16))

        }
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

