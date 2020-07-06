//
//  PostVIPBader.swift
//  WeiboUI
//
//  Created by zzz on 2020/7/6.
//  Copyright © 2020 zzz. All rights reserved.
//

import SwiftUI

struct PostVIPBader: View {
    let vip: Bool

    var body: some View {
        Group {
            if vip {
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .foregroundColor(.yellow)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white, lineWidth: 1)
                )
                    .offset(x: 16, y: 16)
            }
        }
    }
}

struct PostVIPBader_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBader(vip: true)
    }
}
