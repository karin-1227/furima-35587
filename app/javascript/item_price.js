window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxValue=(Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = addTaxValue;
    const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
  })
});


