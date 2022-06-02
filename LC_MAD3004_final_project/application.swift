import Foundation

class Application {
    
    /*
     this class is responsible for controling the flow of the appplication and switching between views
     */
    
    var flag: Bool
    
    init () {
        self.flag = true
        // Initialize the store with some data
        store = [
            StockHolding(name: "A", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "B", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "C", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "D", price: 30.0, p_price: 20.0, holding: 5),
            StockHolding(name: "E", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "F", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "G", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "H", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "I", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "J", price: 10.0, p_price: 8.0, holding: 5),
        ]
        
//        sortArray(asc:true)
                
        // add more data too the store
        store.add(ForeignStockHolding(name: "K", price: 10.0, p_price: 8.0, holding: 5, rate: 1.3))
        store.add(ForeignStockHolding(name: "L", price: 10.0, p_price: 8.0, holding: 5, rate: 1.4))
        store.add(ForeignStockHolding(name: "M", price: 1.0, p_price: 0.5, holding: 5, rate: 1.2))
        
//        sortArray(asc:false)
    }
    
    func run() {
        while self.flag {
            print("********************************************")
            print("********************************************")
            print("********************************************\n")
            print("Choose An task you want to perform: ")
            print("1. Add Share")
            print("2. Inquire Stocks")
            print("3. exit")
            let input = readLine()
            switch input {
                case "1":
                    self.add_stocks() // add stocks view
                case "2":
                self.open_menu() // enquire about stocks
                case "3":
                self.exit() // exit app
                default:
                    print("\n\nPlease Try again",terminator: "\n\n")
            }
        }
        print("********************************************")
        print("********************************************")
        print("******************* Bye ********************")
        print("********************************************")
        print("********************************************",terminator:"\n\n\n\n\n\n\n")
    }
    
    func open_menu(){
        let menu = Menu()
        menu.open()
    }
    
    func add_stocks() {
        let add_share = NewShare()
        add_share.open()
    }
    
    func sortArray(asc flag: Bool) {
        let menu = Menu()
        menu.get_sorted_stock(by: "name", asc: flag)
    }
    
    func exit() {
        self.flag = false
    }
}
