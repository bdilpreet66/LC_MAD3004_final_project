class ForeignStockHolding: StockHolding {
    /*
     def - this class is used to store the conversion rates from local currency to cad.
     
     Parent Class: StockHolding
                    class used to store the share data for a company along with the amount owned by the user.
     
     Properties:
        conversionRate: used to convert the local currency to canadian dollars
     
     Constructor:
        parameters:
            rate - Conversion rate from local currency to cad
        return: None
     
     Methods:
         costInDollars ->
                def: return the total amount spent on this shares
                parameters: None
                return: float
         valueInDollars ->
                def: return the total value of the shares holding
                parameters: None
                return: float
     */
    
    // parameters
    var conversionRate: Float
    
    
    // Constructor
    init(name companyName: String, price currentSharePrice: Double, p_price purchaseSharePrice: Double, holding numberOfShares: Int, rate conversionRate: Float) {
        self.conversionRate = conversionRate
        
        super.init(name: companyName, price: currentSharePrice, p_price: purchaseSharePrice, holding: numberOfShares)
    }
    
    /* class methods */
    
    override func costInDollars() -> Float {
        return Float(self.purchaseSharePrice) * Float(self.numberOfShares) * conversionRate
    }
    
    override func valueInDollars() -> Float {
        return Float(self.currentSharePrice) * Float(self.numberOfShares) * conversionRate
    }
    
    // Accessors - these methods are used to get a property or change the value of a property
    
    var rate: Float {
            get { return self.conversionRate}
            set { self.conversionRate = newValue }
        }
}
