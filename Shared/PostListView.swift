//
//  PostListView.swift
//  hzz_swift_base
//
//  Created by Hu on 2021/3/16.
//

import SwiftUI

struct PostListView: View {
    init(){
//        去掉分割线
        UITableView.appearance().separatorStyle = .none
//        去掉点击效果
        UITableViewCell.appearance().selectionStyle = .none
    }
    var body: some View {
//      用数组初始化List,数组中的元素会被遍历,每一次取出一个元素,这个元素就是一条微博post,然后执行闭包里面的指令,通过post生成PostCell
//        List(postList.list,id:\.id) {post in
//            PostCell(post: post)
//                .listRowInsets(EdgeInsets())
//        }
        
 
        
//或者在Post数据模型中加Identifiable,这个属性规定必须在json数据中有id属性,可省略id:\.id
        
        List {
//             ForEach(postList.list,id:\.id) {post in
            ForEach(postList.list) {post in
//                ZStack 垂直屏幕排列
                ZStack{
                    PostCell(post: post)
                    NavigationLink(
                        destination: Text("Detail")){
                       EmptyView()
                    }
                    .hidden()
                }
                
//                   这么写EdgeInsets生效
                    .listRowInsets(EdgeInsets())
                    
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
//        nav导航栏
        NavigationView{
            PostListView()
                .navigationTitle("title")
//            隐藏navgationbar
                .navigationBarHidden(true)
            
        }
    }
}
