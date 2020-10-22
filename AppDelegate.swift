func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    {
        if let url = userActivity.webpageURL {
            let action = url.lastPathComponent
            var parameters: [String: String] = [:]
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                parameters[$0.name] = $0.value
            }
            if action == "pago-coupon" {
                validateToGoToExternLinkPayCupon(parameters)
            }
            
        }
        return true
    }
    
    func validateToGoToExternLinkPayCupon(_ parameters: [String: String]){
        
        if let id = parameters["id"] {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateInitialViewController() as? ViewController {}
            controller.id = id
            if let window = self.window {
                window.rootViewController = controller
            }
        }
    }