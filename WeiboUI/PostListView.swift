//
//  PostListView.swift
//  WeiboUI
//
//  Created by zzz on 2020/7/6.
//  Copyright © 2020 zzz. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
//        List(postList.list, id: \.id) { post in
//            PostCell(post: post)
//        } 无效
        
        // 遵循 Identifiable 协议， 可以 默认以 id 为 标识符
        List {
            ForEach(postList.list) { post in
                PostCell(post: post)
                .listRowInsets(EdgeInsets())
            }
        }
    }
    /*
     去除tableview 默认分割线
     
     一般来说点击cell  会打印 里面所有的 buttom action 方法
     
     需要修改button  样式
     */
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
