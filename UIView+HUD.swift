import UIKit
import MBProgressHUD

extension UIView {
    
    // MARK:- RuntimeKey   动态绑属性
    fileprivate struct RuntimeHUDKey {
        static let kProgressHUD = UnsafeRawPointer.init(bitPattern: "kProgressHUD".hashValue)
    }
    
    // MARK:- HUD
    /**   =================================  HUD蒙版提示  ======================================  **/
    // 蒙版提示HUD
    var HUD: MBProgressHUD? {
        set {
            objc_setAssociatedObject(self, UIView.RuntimeHUDKey.kProgressHUD!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        get {
            return  objc_getAssociatedObject(self, UIView.RuntimeHUDKey.kProgressHUD!) as? MBProgressHUD
        }
    }
    
    /// 创建hud
    private func createHUD()  {
        if self.HUD != nil {
            return
        }
        
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        
        hud.margin = 10
        
        hud.bezelView.color = UIColor.black
        
        hud.bezelView.style = .blur
        
        hud.contentColor = UIColor.white
                
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 14)
        
        self.HUD = hud
    }
    
    /// 显示提示字样，会自动消失
    ///
    /// - Parameter hint: 提示内容
    func showHint(hint : String,afterDelay : TimeInterval? = nil ) {
        createHUD()
        
        self.endEditing(true)
        
        self.HUD?.mode = .text
       
        self.HUD?.detailsLabel.text = hint
        
        self.HUD?.hide(animated: true, afterDelay: afterDelay == nil ? 2.0 : afterDelay!)
        
        self.HUD = nil
    }
    
    /// 显示提示字样，带菊花，不会自动消失
    ///
    /// - Parameter hint: 提示内容
    func showActivity(hint : String? = nil) {
        createHUD()
       
        self.endEditing(true)
        
        self.HUD?.mode = .indeterminate
       
        self.HUD?.backgroundView.isUserInteractionEnabled = false
       
        if hint != nil {
        
            self.HUD?.detailsLabel.text = hint
        }
        //self.HUD = nil
    }
    
    /// 隐藏hud
    func hidenHUD()  {
        if self.HUD == nil {
            return
        }
        self.HUD?.hide(animated: true)
        self.HUD = nil
    }
}
