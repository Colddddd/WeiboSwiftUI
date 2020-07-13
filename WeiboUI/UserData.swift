//
//  UserData.swift
//  WeiboUI
//
//  Created by 梁涛 on 2020/7/13.
//  Copyright © 2020 zzz. All rights reserved.
//

import Combine

class UserData: ObservableObject {
    @Published var hotList: PostList = getPostList("PostListData_hot_1.json")
    @Published var recommodList: PostList = getPostList("PostListData_recommend_1.json")

    private var hotDic: [Int: Int] = [:]
    private var recommondDic: [Int: Int] = [:]

    init() {
        for i in 0..<hotList.list.count {
            hotDic[hotList.list[i].id] = i
        }

        for i in 0..<recommodList.list.count {
            recommondDic[recommodList.list[i].id] = i
        }
    }
}

extension UserData {
    func getPublishPostList(for post: PostListType) -> PostList {
        switch post {
        case .hot:
            return hotList
        default:
            return recommodList
        }
    }

    func getPublishPost(for id: Int) -> Post? {
        if let index = hotDic[id] {
            return hotList.list[index]
        }

        if let index = recommondDic[id] {
            return recommodList.list[index]
        }

        return nil
    }

    func updatePublishPost(post: Post) {
        if let index = hotDic[post.id] {
            hotList.list[index] = post
        }

        if let index = recommondDic[post.id] {
            recommodList.list[index] = post
        }
    }
}
