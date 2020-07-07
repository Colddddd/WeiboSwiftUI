//
//  HomePageView.swift
//  WeiboUI
//
//  Created by 梁涛 on 2020/7/7.
//  Copyright © 2020 zzz. All rights reserved.
//

import SwiftUI

struct HomePageView: View {
    init() {
        // 修改 tableview 默认行为
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }

    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    PostListView(type: .recommond)
                        .frame(width: kscreenW)
                    PostListView(type: .hot)
                        .frame(width: kscreenW)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(Vpercent: 0))
            .navigationBarTitle("home", displayMode: .inline)
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
