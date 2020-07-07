//
//  PostListView.swift
//  WeiboUI
//
//  Created by zzz on 2020/7/6.
//  Copyright © 2020 zzz. All rights reserved.
//  列表view

import SwiftUI

let kscreenW: CGFloat = UIScreen.main.bounds.width

struct PostListView: View {

    let type: PostListType

    var data: PostList {
        switch type {
        case .hot:
            return getPostList("PostListData_hot_1.json")
        default:
            return getPostList("PostListData_recommend_1.json")
        }
    }

    var body: some View {
        // 遵循 Identifiable 协议， 可以默认以 id 为标识符
        List {
            ForEach(data.list) { post in
                // 跳转,直接放入cell 会有个 箭头
                /*
                NavigationLink(destination: Text("de")) {
                    PostCell(post: post)
                }
                .listRowInsets(EdgeInsets())
                */

                ZStack { // 垂直屏幕方向
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
                       EmptyView()
                    }
                    .hidden()
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        // 导航
        NavigationView {
            PostListView(type: .hot)
            .navigationBarTitle("微博")
            .navigationBarHidden(true) // 必须设置title
        }
    }
}
