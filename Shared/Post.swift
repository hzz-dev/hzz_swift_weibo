//
//  Post.swift
//  PostDemo
//
//  Created by xiaoyouxinqing on 1/6/20.
//  Copyright © 2020 xiaoyouxinqing. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

//结构体对应数组
struct PostList: Codable {
    var list: [Post]
}

//Codable 方便解析Json数据类型转换成数据模型 Decodable & Encodable

//Data Model
//Identifiable 必须有id属性
struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String // image name
    let vip: Bool
    let name: String
    let date: String // yyyy-MM-dd HH:mm:ss
    
    var isFollowed: Bool
    
    let text: String
    let images: [String] // image names
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

//拓展 extension可以拓展某一个类型,给类型添加只读属性也可以添加函数
extension Post {
    var avatarImage: Image {
        return loadImage(name: avatar)
    }
//    计算属性
    var commentCountText: String {
        if commentCount <= 0 { return "评论" }
        if commentCount < 1000 { return "\(commentCount)" }
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    var likeCountText: String {
        if likeCount <= 0 { return "点赞" }
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
}

 let postList = loadPostListData("PostListData_recommend_1.json")

func loadPostListData(_ fileName: String) -> PostList {
//guard 容错判断
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Can not find \(fileName) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load \(url)")
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Can not parse post list json data")
    }
    return list
}

func loadImage(name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
