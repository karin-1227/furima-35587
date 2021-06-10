const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("product_purchase[number]"),
      exp_month: formData.get("product_purchase[exp_month]"),
      exp_year: `20${formData.get("product_purchase[exp_year]")}`,
      cvc: formData.get("product_purchase[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("charge-form").removeAttribute("product_purchase[number]");
      document.getElementById("charge-form").removeAttribute("product_purchase[exp_month]");
      document.getElementById("charge-form").removeAttribute("product_purchase[exp_year]");
      document.getElementById("charge-form").removeAttribute("product_purchase[cvc]");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);