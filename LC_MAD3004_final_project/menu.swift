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
                    get_sorted_stock(asc:true)
                case "6":
                    sort_by_price()
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
            if let obj = c_item as? ForeignStockHolding {
                if let smallest = s_obj as? ForeignStockHolding{
                    if (obj.price - obj.p_price) * Double(obj.holding) * Double(obj.rate) < (smallest.price - smallest.p_price) * Double(smallest.holding) * Double(smallest.rate) {
                        s_obj = obj
                    }
                } else if let smallest = s_obj as? StockHolding{
                    if (obj.price - obj.p_price) * Double(obj.holding) < (smallest.price - smallest.p_price) * Double(smallest.holding) {
                        s_obj = obj
                    }
                }
            } else if let obj = c_item as? StockHolding {
                if let smallest = s_obj as? ForeignStockHolding{
                    if (obj.price - obj.p_price) * Double(obj.holding) < (smallest.price - smallest.p_price) * Double(smallest.holding) * Double(smallest.rate) {
                        s_obj = obj
                    }
                } else if let smallest = s_obj as? StockHolding{
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
            print("Total shares: \(obj.holding)")
            print("Cost in Dollars: \(obj.costInDollars())")
            print("Value in Dollars: \(obj.valueInDollars())")
        } else {
            if let obj = s_obj as? StockHolding {
                print("The least profitable share is: ")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("Total shares: \(obj.holding)")
                print("Cost in Dollars: \(obj.costInDollars())")
                print("Value in Dollars: \(obj.valueInDollars())")
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
            if let obj = c_item as? ForeignStockHolding {
                if let largest = l_obj as? ForeignStockHolding{
                    if (obj.price - obj.p_price) * Double(obj.holding) * Double(obj.rate) > (largest.price - largest.p_price) * Double(largest.holding) * Double(largest.rate) {
                        l_obj = obj
                    }
                } else if let largest = l_obj as? StockHolding{
                    if (obj.price - obj.p_price) * Double(obj.holding) > (largest.price - largest.p_price) * Double(largest.holding) {
                        l_obj = obj
                    }
                }
            } else if let obj = c_item as? StockHolding {
                if let largest = l_obj as? ForeignStockHolding{
                    if (obj.price - obj.p_price) * Double(obj.holding) > (largest.price - largest.p_price) * Double(largest.holding) * Double(largest.rate) {
                        l_obj = obj
                    }
                } else if let largest = l_obj as? StockHolding{
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
            print("Total shares: \(obj.holding)")
            print("Cost in Dollars: \(obj.costInDollars())")
            print("Value in Dollars: \(obj.valueInDollars())")
        } else {
            if let obj = l_obj as? StockHolding {
                print("The most profitable share is: ")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("Total shares: \(obj.holding)")
                print("Cost in Dollars: \(obj.costInDollars())")
                print("Value in Dollars: \(obj.valueInDollars())")
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
            if let obj = c_item as? ForeignStockHolding {
                if let largest = l_obj as? ForeignStockHolding{
                    if obj.valueInDollars() > largest.valueInDollars() {
                        l_obj = obj
                    }
                } else if let largest = l_obj as? StockHolding{
                    if obj.valueInDollars() > largest.valueInDollars() {
                        l_obj = obj
                    }
                }
            } else if let obj = c_item as? StockHolding {
                if let largest = l_obj as? ForeignStockHolding{
                    if obj.valueInDollars() > largest.valueInDollars() {
                        l_obj = obj
                    }
                } else if let largest = l_obj as? StockHolding{
                    if obj.valueInDollars() > largest.valueInDollars() {
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
            print("Total shares: \(obj.holding)")
            print("Cost in Dollars: \(obj.costInDollars())")
            print("Value in Dollars: \(obj.valueInDollars())")
        } else {
            if let obj = l_obj as? StockHolding {
                print("The share with the highest value is: ")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("Total shares: \(obj.holding)")
                print("Cost in Dollars: \(obj.costInDollars())")
                print("Value in Dollars: \(obj.valueInDollars())")
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
            if let obj = c_item as? ForeignStockHolding {
                if let smallest = s_obj as? ForeignStockHolding{
                    if obj.valueInDollars() < smallest.valueInDollars() {
                        s_obj = obj
                    }
                } else if let smallest = s_obj as? StockHolding{
                    if obj.valueInDollars() < smallest.valueInDollars() {
                        s_obj = obj
                    }
                }
            } else if let obj = c_item as? StockHolding {
                if let smallest = s_obj as? ForeignStockHolding{
                    if obj.valueInDollars() < smallest.valueInDollars() {
                        s_obj = obj
                    }
                } else if let smallest = s_obj as? StockHolding{
                    if obj.valueInDollars() < smallest.valueInDollars() {
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
            print("Total shares: \(obj.holding)")
            print("Cost In Dollars: \(obj.costInDollars())")
            print("Value In Dollars: \(obj.valueInDollars())")
        } else {
            if let obj = s_obj as? StockHolding {
                print("The share with the lowest value is: ")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("Total shares: \(obj.holding)")
                print("Cost in Dollars: \(obj.costInDollars())")
                print("Value in Dollars: \(obj.valueInDollars())")
            }
        }
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("Press enter to continue")
        readLine()
    }
    
    func sort_by_price() {
        var sorted_arr: NSMutableArray = []
        var myhash = [Int:Bool]()
        while [Int](myhash.keys).count < store.count {
            var smallest: Int?
            for idx in 0..<store.count {
                if smallest == nil {
                    if myhash[idx] != true {
                        smallest = idx
                    }
                } else if myhash[idx] != true {
                    if let obj = store[idx] as? ForeignStockHolding {
                        if let s_obj = store[smallest!] as? ForeignStockHolding {
                            if obj.valueInDollars() < s_obj.valueInDollars() {
                                smallest = idx
                            }
                        } else if let s_obj = store[smallest!] as? StockHolding {
                            if obj.valueInDollars() < s_obj.valueInDollars() {
                                smallest = idx
                            }
                        }
                    } else if let obj = store[idx] as? StockHolding {
                        if let s_obj = store[smallest!] as? ForeignStockHolding {
                            if obj.valueInDollars() < s_obj.valueInDollars() {
                                smallest = idx
                            }
                        } else if let s_obj = store[smallest!] as? StockHolding {
                            if obj.valueInDollars() < s_obj.valueInDollars() {
                                smallest = idx
                            }
                        }
                    }
                }
            }
            sorted_arr.add(store[smallest!])
            myhash[smallest!] = true
        }
        
        for item in sorted_arr {
            if let obj = item as? ForeignStockHolding {
                print("|||||||||||||||||||||||||||||||||||||||||||||")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("Total shares: \(obj.holding)")
                print("Cost in Dollars: \(obj.costInDollars())")
                print("Value in Dollars: \(obj.valueInDollars())")
            } else {
                if let obj = item as? StockHolding {
                    print("|||||||||||||||||||||||||||||||||||||||||||||")
                    print("Name: \(obj.name)")
                    print("Share price: \(obj.price)")
                    print("Purchasing price: \(obj.p_price)")
                    print("Total shares: \(obj.holding)")
                    print("Cost in Dollars: \(obj.costInDollars())")
                    print("Value in Dollars: \(obj.valueInDollars())")
                }
            }
        }
        
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("Press enter to continue")
        readLine()
    }
    
    func get_sorted_stock(asc: Bool){
        var sorted_arr = [String]()
        
        for item in store{
            if let obj = item as? StockHolding {
                sorted_arr.append(obj.name)
            }
        }
        
        sorted_arr.sort()
        
        for name in sorted_arr {
            for item in store {
                if let obj = item as? ForeignStockHolding {
                    if obj.name == name {
                        print("|||||||||||||||||||||||||||||||||||||||||||||")
                        print("Name: \(obj.name)")
                        print("Share price: \(obj.price)")
                        print("Purchasing price: \(obj.p_price)")
                        print("Total shares: \(obj.holding)")
                        print("Cost in Dollars: \(obj.costInDollars())")
                        print("Value in Dollars: \(obj.valueInDollars())")
                    }
                } else if let obj = item as? StockHolding {
                    if obj.name == name {
                        print("|||||||||||||||||||||||||||||||||||||||||||||")
                        print("Name: \(obj.name)")
                        print("Share price: \(obj.price)")
                        print("Purchasing price: \(obj.p_price)")
                        print("Total shares: \(obj.holding)")
                        print("Cost in Dollars: \(obj.costInDollars())")
                        print("Value in Dollars: \(obj.valueInDollars())")
                    }
                }
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
