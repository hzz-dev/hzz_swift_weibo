//
//  ContentView.swift
//  Shared
//
//  Created by Hu on 2021/3/16.
//

import SwiftUI

//当前image可能为空,在没加!之前image类型的optional可选类型,加了!以后就意味着当前image不为空
let image = UIImage(named: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg")!

struct ContentView: View {
    var body: some View {
        
        HStack {
            Image(uiImage: UIImage(named: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg")!)
//                设置图片可缩放
                .resizable()
//                 保持原图宽高比缩放
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    PostVIPBadge(vip: true)
//                    设置空间偏移量
                        .offset(x: 16, y: 16)
                )
            
//           对齐方式和控件之间的间隔
            VStack(alignment: .leading, spacing: 5) {
                Text("用户昵称")
                    .font(.system(size: 16))
                    .foregroundColor(.orange)
                
                Text("2021-03-16 00:00:00")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
//           上下左右间距
            .padding(.leading,10)
            
//          撑开控件到左右对齐
            Spacer()
            
            Button(action: {
                print("1122333")
            }, label: {
                Text("关注")
                    .font(.system(size: 16))
                    .foregroundColor(.orange)
                    .frame(width: 50, height: 26)
                    .overlay(
//                        画圆角矩形(view类型),指定半径
                        RoundedRectangle(cornerRadius: 13)
//                          画边框
                            .stroke(Color.orange,lineWidth: 1)
                    )
            })
        }
        
       
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
