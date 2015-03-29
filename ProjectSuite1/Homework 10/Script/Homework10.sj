function Main()
{
  try
  { 
    var file = Files.FileNameByName("data10.csv");
  
    preparation();     
    
    Log.Message("Creating driver");
    var driver = DDT.CSVDriver(file);

    while(!driver.EOF())
    {
       var product = driver.Value(0);
       var quantity = driver.Value(1);
       var PPU = driver.Value(2);
       var discount = driver.Value(3);
       var total = driver.Value(4);
       var date = driver.Value(5);
       var cname = driver.Value(6);
       var street = driver.Value(7);
       var city = driver.Value(8);
       var state = driver.Value(9);
       var zip = driver.Value(10);
       var visa = driver.Value(11);
       var mc = driver.Value(12);
       var ae = driver.Value(13);
       var cardno = driver.Value(14);
       var expdate = driver.Value(15);
   
       new_order(product, quantity, PPU, discount, total, date, cname,
                       street, city, state, zip, visa, mc, ae, cardno, expdate);
              
       driver.Next();  
    }
    DDT.CloseDriver(file);
    Log.Message("Driver closed");
     
    delete_order();
    cleanup(); 
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}

function preparation()
{                 
  TestedApps.Orders.Run();     
}


function new_order(product, quantity, PPU, discount, total, date, cname,
                   street, city, state, zip, visa, mc, ae, cardno, expdate)
{
  var OrderParameter = Aliases.Orders.OrderForm;
  var MenuOrder = Aliases.Orders.MainForm.MainMenu;
  var OrdersList = Aliases.Orders.MainForm.OrdersView; 
  
  Log.AppendFolder("Adding order from " + cname);
  
  MenuOrder.Click("Orders|New order...");
  
  OrderParameter.ProductNames.SelectedIndex = product;
  OrderParameter.Quantity.wText = quantity;
  //OrderParameter.Price.wText = PPU;
  OrderParameter.Discount.wText = discount;
  //OrderParameter.Total.wText = total;
  
  OrderParameter.Customer.wText = cname;
  OrderParameter.Date.wDate = date;
  OrderParameter.Street.wText = street;
  OrderParameter.City.wText = city;
  OrderParameter.State.wText = state;
  OrderParameter.Zip.wText = zip;
  
  OrderParameter.AE.isChecked = ae;
  OrderParameter.Visa.isChecked = visa;
  OrderParameter.Mastercard.isChecked = mc;
  OrderParameter.CardNo.wText = cardno;
  OrderParameter.ExpDate.wDate = expdate;  
  
  OrderParameter.ButtonOK.Click();
  
  OrdersList.ClickItem(cname, 0);
  if (aqObject.CompareProperty(OrdersList.wSelectedItems, 0, cname, false))
    Log.Message("OK");
  else
    Log.Message("Not ok");
    
  Log.PopLogFolder();  
}

function delete_order()
{
  var OrdersList = Aliases.Orders.MainForm.OrdersView;
  
  while(OrdersList.FocusedItem)
    { 
      OrdersList.FocusedItem.Remove();
    }
  Log.Message("Orders deleted");  
}

function cleanup()
{
  TestedApps.Orders.Terminate();
}