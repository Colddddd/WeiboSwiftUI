//
//  PostCell.swift
//  WeiboUI
//
//  Created by zzz on 2020/7/6.
//  Copyright © 2020 zzz. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    
    let post: Post
    
    var body: some View {
        
        VStack() {
            // 水平布局
            HStack() {
                Image(uiImage: UIImage(named: post.avatar)!)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .overlay(
                        PostVIPBader(vip: post.vip)
                )
                
                VStack (alignment: .leading, spacing: 5) {
                    Text(post.name)
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                        .lineLimit(1) // 文本限制
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading,10)
                
                // 占位
                Spacer()
                
                if !post.isFollowed {
                    Button(action: {
                        print("点击了关注")
                    }) {
                        Text("关注")
                            .font(.system(size: 14))
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 26)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.orange, lineWidth: 1)
                        )
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            // 内容
            Text(post.text)
            
            // 图片
            if !post.images.isEmpty {
                getPostImage(post.images.first!)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 30, height: (UIScreen.main.bounds.width - 30) * 0.75)
                .clipped()
            }
            
            Divider()
            
            // 底部视图
            HStack() {
                Spacer()
                PostCellBottomView(.like, post.likeString)
                Spacer()
                PostCellBottomView(.comment, post.CommentString)
                Spacer()
            }
            
            // 分割线
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color.init(red: 238/255, green: 238/255, blue: 238/255))
            
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}

// 放在.xcassets目录下的图片可以用Image(name)，一般文件夹里的图片不行


/**
  .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))

 -> horizontal
 
 
 */
