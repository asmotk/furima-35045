window.addEventListener('load', function() {
  const ItemPrice = document.getElementById("item-price");
  const TaxPrice = document.getElementById("add-tax-price");
  const ProfitPrice = document.getElementById("profit");

  ItemPrice.addEventListener('input', function() {
    TaxPrice.innerHTML = Math.floor(ItemPrice.value / 10);
    ProfitPrice.innerHTML = ItemPrice.value - Math.floor(ItemPrice.value / 10);
  });
})
