const pay = ()=> {
  Payjp.setPublicKey("pk_test_3127c09e1e20d635ed8e152a"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form")
  form.addEventListener("submit",(e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
  })
}

window.addEventListener("load", pay);