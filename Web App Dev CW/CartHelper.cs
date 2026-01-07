using System.Collections.Generic;
using System.Web;
using Web_App_Dev_CW;
using System.Linq;

public static class CartHelper
{
    // Get the cart from the session
    public static List<CartItem> GetCart()
    {
        List<CartItem> cart = HttpContext.Current.Session["Cart"] as List<CartItem>;

        // If the cart is null, create a new cart
        if (cart == null)
        {
            cart = new List<CartItem>();
            HttpContext.Current.Session["Cart"] = cart;
        }

        return cart;
    }

    // Add an item to the cart (if it exists, increase the quantity)
    public static void AddToCart(CartItem item)
    {
        var cart = GetCart();

        // Check if the item already exists in the cart based on key fields (ProductName, Colour, Capacity, etc.)
        var existingItem = cart.FirstOrDefault(i => i.ProductName == item.ProductName
                                                    && i.Colour == item.Colour
                                                    && i.Capacity == item.Capacity
                                                    && i.Memory == item.Memory
                                                    && i.Chipset == item.Chipset
                                                    && i.PowerAdapter == item.PowerAdapter
                                                    && i.Engraving == item.Engraving
                                                    && i.NoiseCancellation == item.NoiseCancellation);

        if (existingItem != null)
        {
            // If it exists, increase the quantity
            existingItem.Quantity += item.Quantity;
        }
        else
        {
            // Otherwise, add the new item
            cart.Add(item);
        }

        // Update the cart in session
        HttpContext.Current.Session["Cart"] = cart;
    }

    // Remove an item from the cart
    public static void RemoveFromCart(string productName, string colour, string capacity, string memory,
                                      string chipset, string powerAdapter, string engraving, string noiseCancellation)
    {
        var cart = GetCart();

        var itemToRemove = cart.FirstOrDefault(i => i.ProductName == productName
                                                    && i.Colour == colour
                                                    && i.Capacity == capacity
                                                    && i.Memory == memory
                                                    && i.Chipset == chipset
                                                    && i.PowerAdapter == powerAdapter
                                                    && i.Engraving == engraving
                                                    && i.NoiseCancellation == noiseCancellation);

        if (itemToRemove != null)
        {
            cart.Remove(itemToRemove);
        }

        HttpContext.Current.Session["Cart"] = cart;
    }

    // Clear the cart
    public static void ClearCart()
    {
        HttpContext.Current.Session["Cart"] = new List<CartItem>();
    }
}
