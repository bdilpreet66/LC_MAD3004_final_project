import Foundation

class NewShare {
    func open() {
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("||               Add Shares                ||")
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        
        //print("\nPlease enter the no of shares you want to add: ")
        
        /*let input = readLine()
        if let int_input = Int(input!) {
            var stock_no = 1
            while stock_no <= int_input {
                print("\n Enter details for share # \(stock_no)")
                */
                print("Company Name: ")
                if let name = readLine() {
                    // check if the share exists or not
                    if self.check_name(share: name) {
                        print("Current Price: ")
                        let price = readLine()
                        if let double_price = Double(price!){
                            print("Purchasing Price: ")
                            let p_price = readLine()
                            if let double_p_price = Double(p_price!){
                                print("No of Shares: ")
                                let amount = readLine()
                                if let int_amount = Int(amount!){
                                    print("Is th price in local curreny[y] or not[n]")
                                    let choice = readLine()
                                    if choice == "y" {
                                        save_stock(name,double_price,double_p_price,int_amount)
                                    } else if choice == "n" {
                                        print("Conversion rate: ")
                                        let rate = readLine()
                                        if let float_rate = Float(rate!){
                                            save_foreign_stock(name,double_price,double_p_price,int_amount,float_rate)
                                        } else {
                                            print("ERROR! Please enter a decimal")
                                            //break
                                            
                                        }
                                    } else {
                                        print("Invalid Choice Please Try again")
                                    }
                                } else {
                                    print("Amount must be a integer")
                                    //continue
                                }
                            } else {
                                print("Please enter a decimal")
                                //continue
                            }
                        } else {
                            print("Please enter a decimal")
                            //continue
                        }
                    } else {
                        print("Share for that company already exists")
                        //continue
                    }
                }
                /*
                stock_no += 1
            }
        } else {
            print("ERROR! Please enter integer value")
        }
        */
        
        print("|||||||||||||||||||||||||||||||||||||||||||||")
        print("||              Shares Added               ||")
        print("|||||||||||||||||||||||||||||||||||||||||||||")
    }
    
    func save_foreign_stock(_ companyName: String, _ currentSharePrice: Double, _ purchaseSharePrice: Double, _ amount: Int, _ rate: Float) {
        let obj = ForeignStockHolding(
            name: companyName,
            price: currentSharePrice,
            p_price: purchaseSharePrice,
            holding: amount,
            rate: rate
        )
        store.add(obj)
    }
    
    func save_stock(_ companyName: String, _ currentSharePrice: Double, _ purchaseSharePrice: Double, _ amount: Int){
        let obj = StockHolding(
            name: companyName,
            price: currentSharePrice,
            p_price: purchaseSharePrice,
            holding: amount)
        store.add(obj)
    }
    
    func check_name(share name: String) -> Bool {
        for c_item in store {
            if let obj = c_item as? ForeignStockHolding {
                if obj.name == name {
                    return false
                }
            } else {
                if let obj = c_item as? StockHolding {
                    if obj.name == name {
                        return false
                    }
                }
            }
        }
        return true
    }
}
