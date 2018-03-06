//: Playground - noun: a place where people can play

import UIKit



class Preferences <T: Equatable>  {
    
    let sharedPreferences = UserDefaults.standard
    let key: String
    let defaultValue: T
    
    init(key: String, defaultValue: T) {
        
        self.key = key
        self.defaultValue = defaultValue
    }
    var isSet : Bool{
        return getItem() != defaultValue
    }
    var value: T {
        set {
             insertItem(item: newValue)
        }
        get { return getItem()  }
    }
    public func remove() {
        sharedPreferences.removeObject(forKey: key)
    }
    
    private func insertItem(item: T)  {
              sharedPreferences.set(item, forKey: self.key)
        
    }
    private func getItem() -> T {
        guard let item = sharedPreferences.object(forKey: self.key) as? T else {
            return defaultValue
        }
         return item
    }
    
}


