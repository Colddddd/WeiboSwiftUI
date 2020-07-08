//
//  HomePageView.swift
//  WeiboUI
//
//  Created by 梁涛 on 2020/7/7.
//  Copyright © 2020 zzz. All rights reserved.
//

import SwiftUI

struct HomePageView: View {

    @State var precent: CGFloat = 0

    init() {
        // 修改 tableview 默认行为
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }

    var body: some View {
        NavigationView {
            // GeometryReader 里面要加 self
            GeometryReader { gem in
                ScrollViewController(pageW: gem.size.width, contentSize: CGSize(width: gem.size.width * 2, height: gem.size.height),
                                     precent: self.$precent,
                                     content:{
                                        HStack {
                                            PostListView(type: .recommond)
                                                .frame(width: kscreenW)
                                            PostListView(type: .hot)
                                                .frame(width: kscreenW)
                                        }
                })
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(Vpercent: $precent))
            .navigationBarTitle("home", displayMode: .inline)
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
