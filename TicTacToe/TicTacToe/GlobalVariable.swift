class GlobalVariables {
    
    // These are the properties you can store in your singleton
    var cCount: Int = 0
    var hCount: Int = 0
    var tCount: Int = 0
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
