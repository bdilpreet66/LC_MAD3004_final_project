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
            StockHolding(name: "Bank of Montreal", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "Bank of Nova Scotia", price: 8.0, p_price: 8.0, holding: 5),
            StockHolding(name: "Barrick Gold", price: 10.0, p_price: 8.0, holding: 5),
            StockHolding(name: "Aecon Group", price: 5.0, p_price: 20.0, holding: 5),
            StockHolding(name: "CAE Inc", price: 4.5, p_price: 8.0, holding: 5),
            StockHolding(name: "Cameco", price: 8.0, p_price: 8.0, holding: 5),
            StockHolding(name: "Dollarama", price: 9.0, p_price: 8.0, holding: 5),
            StockHolding(name: "Enerplus", price: 11.0, p_price: 8.0, holding: 5),
            StockHolding(name: "Gibson Energy", price: 12.0, p_price: 8.0, holding: 5),
            StockHolding(name: "Maple Leaf Foods", price: 13.0, p_price: 8.0, holding: 5)
        ]
        
//        sortArray(asc:true)
                
        // add more data too the store
        store.add(ForeignStockHolding(name: "Microsoft Corporation Common", price: 10.0, p_price: 8.0, holding: 5, rate: 39.0))
        store.add(ForeignStockHolding(name: "Alphabet Inc.", price: 10.0, p_price: 8.0, holding: 5, rate: 39.0))
        store.add(ForeignStockHolding(name: "NVIDIA Corporation", price: 1.0, p_price: 0.5, holding: 5, rate: 39.0))
        
//        sortArray(asc:false)
    }
    
    func run() {
        while self.flag {
            print("********************************************")
            print("******************* HOME *******************")
            print("********************************************\n")
            print("Choose a task you want to perform: ")
            print("1. Add Share")
            print("2. Inquire Stocks")
            print("3. Exit")
            let input = readLine()
            switch input {
                case "1":
                    self.add_stocks() // add stocks view
                case "2":
                self.open_menu() // enquire about stocks
                case "3":
                self.exit() // exit app
                default:
                    print("\n\nPlease try again",terminator: "\n\n")
            }
        }
        print("********************************************")
        print("********************************************")
        print("***************** Goodbye! *****************")
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
        menu.get_sorted_stock(asc: flag)
    }
    
    func exit() {
        self.flag = false
    }
}
