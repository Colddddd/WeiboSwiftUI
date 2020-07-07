//
//  HomeNavigationBar.swift
//  WeiboUI
//
//  Created by 梁涛 on 2020/7/7.
//  Copyright © 2020 zzz. All rights reserved.
//

import SwiftUI

private let btnW: CGFloat = 60
private let btnH: CGFloat = 24


struct HomeNavigationBar: View {

    @State var Vpercent: CGFloat

    var body: some View {

        HStack(alignment: .top, spacing: 0) {

            // 拍照
            Button(action: {

            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit() // 先后写有区别
                    .frame(width: btnH, height: btnH)
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .padding(.top, 4)
            }

            Spacer()

            VStack(spacing: 2) {
                HStack() {
                    Text("推荐")
                        .bold()
                        .frame(width: btnW, height: btnH)
                        .opacity(Double(1 - Vpercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.Vpercent = 0
                            }
                    }
                    .padding(.top, 2)

                    Spacer()

                    Text("热门")
                        .bold()
                        .frame(width: btnW, height: btnH)
                        .opacity(Double(0.5 + Vpercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.Vpercent = 1
                            }
                    }
                }

                // 下划线
                //TODO: 了解 GeometryReader
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 4)
                        .offset(x: geometry.size.width * CGFloat((self.Vpercent - 0.5)) + btnW * CGFloat((0.5 - self.Vpercent)))
                }
                .frame(height: 6)
            }
            .frame(width: kscreenW * 0.5)

            Spacer()

            // 加好
            Button(action: {

            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit() // 先后写有区别
                    .frame(width: btnH, height: btnH)
                    .foregroundColor(.orange)
                    .padding(.horizontal, 10)
                    .padding(.top, 4)
            }
        }
        .frame(width: kscreenW)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(Vpercent: 0)
    }
}
