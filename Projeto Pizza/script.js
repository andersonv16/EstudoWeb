const seleciona = (el) => document.querySelector(el);
const selecionaTudo = (el) => document.querySelectorAll(el);

pizzaJson.map((item, index) => {
  let pizzaItem = seleciona(".models .pizza-item").cloneNode(true);
  pizzaItem.querySelector(".pizza-item--name").innerHTML = item.name;
  pizzaItem.querySelector(
    ".pizza-item--price"
  ).innerHTML = `R$ ${item.price.toFixed(2)}`;
  pizzaItem.querySelector(".pizza-item--desc").innerHTML = item.description;
  pizzaItem.querySelector(".pizza-item--img img").src = item.img;
  pizzaItem.querySelector("a").addEventListener("click", (e) => {
    e.preventDefault();

    seleciona(".pizzaWindowArea").style.opacity = 0;
    seleciona(".pizzaWindowArea").style.display = "flex";
    setTimeout(() => {
      seleciona(".pizzaWindowArea").style.opacity = 1;
    }, 200);
  });

  seleciona(".pizza-area").append(pizzaItem);
});
