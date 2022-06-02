import Foundation


class Menu {
    var flag: Bool
    
    init () {
        self.flag = true
    }
    
    func open() {
        while self.flag {
            print("|||||||||||||||||||||||||||||||||||||||||||||")
            print("||                  Menu                   ||")
            print("|||||||||||||||||||||||||||||||||||||||||||||")
            print("\nChoose An task you want to perform: ")
            print("1. Display stock information with the lowest value")
            print("2. Display stock with the highest value")
            print("3. Display the most profitable stock")
            print("4. Display the least profitable stock")
            print("5. List all stocks sorted by company name (A-Z)")
            print("6. List all stocks sorted from the lowest value to the highest value")
            print("7. Back")
            
            let input = readLine()
            switch input {
                case "1":
                    lowest_value_stock()
                case "2":
                    highest_value_stock()
                case "3":
                    most_profitable_stock()
                case "4":
                    least_profitable_stock()
                case "5":
                    print("|||||||||||||||||||||||||||||||||||||||||||||")
                    print("||   maybe you expect me to do something   ||")
                    print("|||||||||||||||||||||||||||||||||||||||||||||")
                case "6":
                    print("|||||||||||||||||||||||||||||||||||||||||||||")
                    print("||        that's a lot of pressure         ||")
                    print("|||||||||||||||||||||||||||||||||||||||||||||")
                case "7":
                    self.exit()
                default:
                    print("\n\nPlease Try again",terminator: "\n\n")
            }
        }
        
        
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("||               going back                ||")
        print("|||||||||||||||||||||||||||||||||||||||||||||")
    }
    
    /*
        this function uses holding amount, current share price and purchase share price to get least profitable share
        profit = (current_price - purchasing_cost) * holding_amount
     */
    func least_profitable_stock(){
        print("\n|||||||||||||||||||||||||||||||||||||||||||||")
        var s_obj = store[0]
        for c_item in store{
            if let obj = c_item as? StockHolding {
                if let smallest = s_obj as? StockHolding{
                    if (obj.price - obj.p_price) * Double(obj.holding) < (smallest.price - smallest.p_price) * Double(smallest.holding) {
                        s_obj = obj
                    }
                }
            }
        }
        
        if let obj = s_obj as? ForeignStockHolding {
            print("The least profitable share is: ")
            print("Name: \(obj.name)")
            print("Share price: \(obj.price)")
            print("Purchasing price: \(obj.p_price)")
            print("total shares: \(obj.holding)")
            print("Cost In Dollars: \(obj.costInDollars())")
            print("Value In Dollars: \(obj.valueInDollars())")
        } else {
            if let obj = s_obj as? StockHolding {
                print("The least profitable share is: ")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("total shares: \(obj.holding)")
                print("Cost In Dollars: \(obj.costInDollars())")
                print("Value In Dollars: \(obj.valueInDollars())")
            }
        }
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("Press enter to continue")
        readLine()
    }
    
    /*
        this function uses holding amount, current share price and purchase share price to get most profitable share
        profit = (current_price - purchasing_cost) * holding_amount
     */
    func most_profitable_stock(){
        print("\n|||||||||||||||||||||||||||||||||||||||||||||")
        var l_obj = store[0]
        for c_item in store{
            if let obj = c_item as? StockHolding {
                if let largest = l_obj as? StockHolding{
                    if (obj.price - obj.p_price) * Double(obj.holding) > (largest.price - largest.p_price) * Double(largest.holding) {
                        l_obj = obj
                    }
                }
            }
        }
        
        if let obj = l_obj as? ForeignStockHolding {
            print("The most profitable share is: ")
            print("Name: \(obj.name)")
            print("Share price: \(obj.price)")
            print("Purchasing price: \(obj.p_price)")
            print("total shares: \(obj.holding)")
            print("Cost In Dollars: \(obj.costInDollars())")
            print("Value In Dollars: \(obj.valueInDollars())")
        } else {
            if let obj = l_obj as? StockHolding {
                print("The most profitable share is: ")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("total shares: \(obj.holding)")
                print("Cost In Dollars: \(obj.costInDollars())")
                print("Value In Dollars: \(obj.valueInDollars())")
            }
        }
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("Press enter to continue")
        readLine()
    }
    
    /* this function uses current share price to get the lowest valued share */
    func highest_value_stock(){
        print("\n|||||||||||||||||||||||||||||||||||||||||||||")
        var l_obj = store[0]
        for c_item in store{
            if let obj = c_item as? StockHolding {
                if let largest = l_obj as? StockHolding{
                    if obj.price > largest.price {
                        l_obj = obj
                    }
                }
            }
        }
        
        if let obj = l_obj as? ForeignStockHolding {
            print("The share with the highest value is: ")
            print("Name: \(obj.name)")
            print("Share price: \(obj.price)")
            print("Purchasing price: \(obj.p_price)")
            print("total shares: \(obj.holding)")
            print("Cost In Dollars: \(obj.costInDollars())")
            print("Value In Dollars: \(obj.valueInDollars())")
        } else {
            if let obj = l_obj as? StockHolding {
                print("The share with the highest value is: ")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("total shares: \(obj.holding)")
                print("Cost In Dollars: \(obj.costInDollars())")
                print("Value In Dollars: \(obj.valueInDollars())")
            }
        }
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("Press enter to continue")
        readLine()
    }
    
    
    /* this function uses current share price to get the lowest valued share */
    func lowest_value_stock(){
        print("\n|||||||||||||||||||||||||||||||||||||||||||||")
        var s_obj = store[0]
        for c_item in store{
            if let obj = c_item as? StockHolding {
                if let smallest = s_obj as? StockHolding{
                    if obj.price < smallest.price {
                        s_obj = obj
                    }
                }
            }
        }
        
        if let obj = s_obj as? ForeignStockHolding {
            print("The share with the lowest value is: ")
            print("Name: \(obj.name)")
            print("Share price: \(obj.price)")
            print("Purchasing price: \(obj.p_price)")
            print("total shares: \(obj.holding)")
            print("Cost In Dollars: \(obj.costInDollars())")
            print("Value In Dollars: \(obj.valueInDollars())")
        } else {
            if let obj = s_obj as? StockHolding {
                print("The share with the lowest value is: ")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("total shares: \(obj.holding)")
                print("Cost In Dollars: \(obj.costInDollars())")
                print("Value In Dollars: \(obj.valueInDollars())")
            }
        }
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("Press enter to continue")
        readLine()
    }

    func exit(){
        self.flag = false
    }
}
