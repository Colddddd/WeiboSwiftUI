//
//  PostListView.swift
//  WeiboUI
//
//  Created by zzz on 2020/7/6.
//  Copyright © 2020 zzz. All rights reserved.
//  列表view

import SwiftUI

struct PostListView: View {
    
    init() {
        // 修改 tableview 默认行为
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        // 遵循 Identifiable 协议， 可以默认以 id 为标识符
        List {
            ForEach(postList.list) { post in
                PostCell(post: post)
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
