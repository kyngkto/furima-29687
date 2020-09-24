const pay = ()=> {
  Payjp.setPublicKey("pk_test_3127c09e1e20d635ed8e152a"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit",(e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
      postal_code: formData.get("postal_code"),
      area_id: formData.get("area_id"),
      city: formData.get("city"),
      house_number: formData.get("house_number"),
      building_name: formData.get("building_name"),
      phone_number: formData.get("phone_number"),
    };
    Payjp.createToken(card, (status, response) => {
      console.log(status)
      console.log(response)
    })
  })
}

window.addEventListener("load", pay);