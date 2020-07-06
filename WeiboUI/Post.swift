//
//  Post.swift
//  WeiboUI
//
//  Created by zzz on 2020/7/6.
//  Copyright © 2020 zzz. All rights reserved.
//

import SwiftUI

let postList = getPostList("PostListData_recommend_1.json")

struct PostList: Codable {
    var list: [Post]
}

// model
struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String
    let vip: Bool
    let name: String
    let date: String
    var isFollowed: Bool
    
    let text: String
    let images: [String]
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    var likeString: String {
        if likeCount == 0 { return "点赞" }
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1f k", Double(likeCount) / 1000)
    }
    
    var CommentString: String {
        if commentCount == 0 { return "评论" }
        if commentCount < 1000 { return "\(commentCount)" }
        return String(format: "%.1f k", Double(commentCount) / 1000)
    }
}

func getPostList(_ fileName: String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("url 错误")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("data 错误")
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("解析 错误")
    }
    return list
}

func getPostImage(_ name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
