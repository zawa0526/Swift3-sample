//: Playground - noun: a place where people can play

import UIKit

let stars = String(repeating: " ★ ", count: 10)
print(stars)

print ("キャリッジ\rリターン")
print ("ライン\nフィールド")

// 更新された値を知る（辞書）
// 宣言
var members = [String:Int]()

func upadateMembers(theKey:String, newVal:Int) {
    if let oldVal = members.updateValue(newVal, forKey: theKey) {
        print("\(theKey)の値を\(oldVal)から\(newVal)に更新しました")
    } else {
        print("\(theKey):\(newVal)を追加しました")
    }
    print(members)
}

members = ["東京":15, "大阪":12, "札幌":9]
upadateMembers(theKey: "大阪", newVal: 17)
upadateMembers(theKey: "沖縄", newVal: 14)

for member in members {
    print(member)
}

// タプルで受け取る
for (key, val) in members {
    print("\(key): \(val)")
}