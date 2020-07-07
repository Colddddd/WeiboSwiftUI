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
    
    init(_ type: BottomButton, _ title: String) {
        switch type {
        case .like:
            self.imageName = "heart"
            self.title = title
            self.color = Color.gray
        default:
            self.imageName = "message"
            self.title = title
            self.color = Color.gray
        }
    }
    
    var body: some View {
        Button(action: {
            print("点击了 喜欢 / 是")
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


struct PostCellBottomView_Previews: PreviewProvider {
    static var previews: some View {
        PostCellBottomView(.comment, "")
    }
}
