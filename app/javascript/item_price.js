function selling() {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    const salesProf = document.getElementById("profit")
    salesProf.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1))
  })
}

window.addEventListener('load', selling)