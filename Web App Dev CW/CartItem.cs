using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_App_Dev_CW
{
    public class CartItem
    {
        public string ProductName { get; set; }
        public string Colour { get; set; }
        public string Capacity { get; set; }
        public string Chipset { get; set; }
        public string Memory { get; set; }
        public string PowerAdapter { get; set; }
        public string Engraving { get; set; }
        public string NoiseCancellation { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public string Category { get; set; } 
    }

}