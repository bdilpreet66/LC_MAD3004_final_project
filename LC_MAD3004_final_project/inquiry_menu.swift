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
                    get_sorted_stock(by:"name", asc:true)
                case "6":
                    get_sorted_stock(by:"price", asc:nil)
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
    
    func get_sorted_stock(by: String, asc: Bool?) {
        var sorted_arr: NSMutableArray = []
        var cur_arr = [Int]()
        for i in 0..<store.count{
            cur_arr.append(i)
        }
        while cur_arr.count > 0 {
            var pointer = 0
            for idx in cur_arr {
                if let obj = store[idx] as? ForeignStockHolding {
                    if let test_obj = store[pointer] as? ForeignStockHolding {
                        if by == "price" {
                            if obj.valueInDollars() < test_obj.valueInDollars() {
                                pointer = idx
                            }
                        } else if by == "name" {
                            if obj.name.caseInsensitiveCompare(test_obj.name) == ((asc!) ? .orderedAscending : .orderedDescending) {
                                pointer = idx
                            }
                        }
                    } else if let test_obj = store[pointer] as? StockHolding {
                        if by == "price" {
                            if obj.valueInDollars() < test_obj.valueInDollars() {
                                pointer = idx
                            }
                        } else if by == "name" {
                            if obj.name.caseInsensitiveCompare(test_obj.name) == ((asc!) ? .orderedAscending : .orderedDescending) {
                                pointer = idx
                            }
                        }
                    }
                } else if let obj = store[idx] as? ForeignStockHolding {
                    if let test_obj = store[pointer] as? ForeignStockHolding {
                        if by == "price" {
                            if obj.valueInDollars() < test_obj.valueInDollars() {
                                pointer = idx
                            }
                        } else if by == "name" {
                            if obj.name.caseInsensitiveCompare(test_obj.name) == ((asc!) ? .orderedAscending : .orderedDescending) {
                                pointer = idx
                            }
                        }
                    } else if let test_obj = store[pointer] as? StockHolding {
                        if by == "price" {
                            if obj.valueInDollars() < test_obj.valueInDollars() {
                                pointer = idx
                            }
                        } else if by == "name" {
                            if obj.name.caseInsensitiveCompare(test_obj.name) == ((asc!) ? .orderedAscending : .orderedDescending) {
                                pointer = idx
                            }
                        }
                    }
                }            }
            sorted_arr.add(store[cur_arr[pointer]])
            cur_arr.remove(at: pointer)
        }
        
        for item in sorted_arr {
            if let obj = item as? ForeignStockHolding {
                print("|||||||||||||||||||||||||||||||||||||||||||||")
                print("Name: \(obj.name)")
                print("Share price: \(obj.price)")
                print("Purchasing price: \(obj.p_price)")
                print("total shares: \(obj.holding)")
                print("Cost In Dollars: \(obj.costInDollars())")
                print("Value In Dollars: \(obj.valueInDollars())")
            } else {
                if let obj = item as? StockHolding {
                    print("|||||||||||||||||||||||||||||||||||||||||||||")
                    print("Name: \(obj.name)")
                    print("Share price: \(obj.price)")
                    print("Purchasing price: \(obj.p_price)")
                    print("total shares: \(obj.holding)")
                    print("Cost In Dollars: \(obj.costInDollars())")
                    print("Value In Dollars: \(obj.valueInDollars())")
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
