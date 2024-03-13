function product_price() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  itemPrice.addEventListener('input', () => {
      const price = itemPrice.value;
      
      const taxPrice = Math.floor(price * 0.1);
      const saleProfit = price - taxPrice;
      
      addTaxPrice.innerHTML = taxPrice;
      profit.innerHTML = saleProfit;
  });
};
window.addEventListener('load', product_price);
window.addEventListener("turbo:render", product_price);