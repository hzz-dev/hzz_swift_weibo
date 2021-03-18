//
//  PostCell.swift
//  hzz_swift_base
//
//  Created by Hu on 2021/3/16.
//

import SwiftUI

//当前image可能为空,在没加!之前image类型的optional可选类型,加了!以后就意味着当前image不为空
//let image = UIImage(named: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg")!

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10 ) {
                HStack {
                    post.avatarImage
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
                        Text(post.name)
                            .font(.system(size: 16))
                            .foregroundColor(.orange)
                        
                        Text(post.date)
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                    }
        //           上下左右间距
                    .padding(.leading,10)
                    
                    if !post.isFollowed {
        //           撑开控件到左右对齐
                        Spacer()
                        
                        Button(action: {
                            print("1122333")
                        }) {
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
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            Text(post.text)
                .font(.system(size: 17))
            
            if !post.images.isEmpty {
//                loadImage(name: post.images[0])
//                    .resizable()
//                    .scaledToFill()
////                    UIScreen.main.bounds.width/height 屏幕的宽高
//                    .frame(width: UIScreen.main.bounds.width-30, height: (UIScreen.main.bounds.width-30)*0.75)
////                   裁掉图片超出部分
//                    .clipped()
                
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width-30)
            }
            
//          添加分割线
//            Divider()
            
            HStack (spacing:0){
                Spacer()
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black) {
                
                }
                
                Spacer()
                PostCellToolbarButton(image: post.isLiked ? "heart.fill" : "heart",
                        text: post.likeCountText,
                        color: post.isLiked ? .red : .black)
                {
                    
                }
                Spacer()
                
            }
            
//           画分割线
            Rectangle()
                .padding(.horizontal,-15)
                .frame(height:10)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
        }
        .padding(.horizontal,15)
        .padding(.top,15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
//        let userData = UserData()
        return PostCell(post:postList.list[0])
            
    }
}

