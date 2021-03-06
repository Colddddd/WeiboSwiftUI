//
//  PostDetailView.swift
//  WeiboUI
//
//  Created by 梁涛 on 2020/7/7.
//  Copyright © 2020 zzz. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {

    let post: Post

    var body: some View {
        List {
            PostCell(post: post)
            .listRowInsets(EdgeInsets())

            ForEach(1...20, id: \.self) { i in
                Text("评论 \(i)")
            }
        }
        .navigationBarTitle("详情", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
