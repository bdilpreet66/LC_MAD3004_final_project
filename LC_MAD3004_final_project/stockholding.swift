import Foundation

class StockHolding: NSObject {
    /*
     def - this class is used to store the share data for a company along with the amount owned by the user.
     
     Parent Class: NSObject
                    The root class of most Objective-C class hierarchies, from which subclasses inherit a basic interface to the runtime system and the ability to behave as Objective-C objects.
                    (for more info please visit https://developer.apple.com/documentation/objectivec/nsobject)
     
     Properties:
         companyName - Name of the company for the shares (String)
         currentSharePrice - current price of the shares (Double)
         purchaseSharePrice - price of the shares at the time of purchase (String)
         numberOfShares - no of shares bought (String)
     
     Constructor:
        parameters:
             name - name of the company the share belongs to
             price - current price of the share
             p_price - purchase price of the share
             holding - number of shares bought
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
    
    /* Parameters */
    var companyName: String
    var currentSharePrice: Double
    var purchaseSharePrice: Double
    var numberOfShares: Int
    
    // Constructor
    init(name companyName: String, price currentSharePrice: Double, p_price purchaseSharePrice: Double, holding numberOfShares: Int) {
        self.companyName = companyName
        self.currentSharePrice = currentSharePrice
        self.purchaseSharePrice = purchaseSharePrice
        self.numberOfShares = numberOfShares
    }
    
    /* class methods */
    
    func costInDollars() -> Float{
        return Float(self.purchaseSharePrice) * Float(self.numberOfShares)
    }
    
    func valueInDollars() -> Float{
        return Float(self.currentSharePrice) * Float(self.numberOfShares)
    }
    
    // Accessors - these methods are used to get a property or change the value of a property
    
    var name: String {
            get { return self.companyName}
            set { self.companyName = newValue }
        }
    
    var price: Double {
            get { return self.currentSharePrice}
            set { self.currentSharePrice = newValue }
        }
    
    var p_price: Double {
            get { return self.purchaseSharePrice}
            set { self.purchaseSharePrice = newValue }
        }
    
    var holding: Int {
            get { return self.numberOfShares}
            set { self.numberOfShares = newValue }
        }
  
}
