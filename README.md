# UIView-HUD
基于MBProgressHUD 封住Swift UIView分类



### 直接用View调用下面方法
```swift
 /// 显示提示字样，会自动消失
 ///
 /// - Parameter hint: 提示内容
 func showHint(hint : String,afterDelay : TimeInterval? = nil )
```

```swift
 /// 显示提示字样，带菊花，不会自动消失
 ///
 /// - Parameter hint: 提示内容
 func showActivity(hint : String? = nil)
```

```swift
 /// 隐藏hud
 func hidenHUD() 
```
