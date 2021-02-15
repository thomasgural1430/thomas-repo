//jshint esversion:6

//selecting filter buttons
const btnL = document.querySelector(".filter-btn-l");
const btnH = document.querySelector(".filter-btn-h");

//selecting product section in product.html
const product = document.querySelector(".products");

var productDisplay2 = "";

const productDetails = [
  {
    img: "/images/products/shirt1.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 400,
  },
  {
    img: "/images/products/shirt2.jpg",
    productName: "Men Printed Shirt",
    productPrice: 850,
  },
  {
    img: "/images/products/shirt3.jpg",
    productName: "Men Printed Shirt",
    productPrice: 580,
  },
  {
    img: "/images/products/shirt4.jpg",
    productName: "Men Slim Printed T-Shirt",
    productPrice: 620,
  },
  {
    img: "/images/products/shirt5.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 1000,
  },
  {
    img: "/images/products/shirt6.jpg",
    productName: "Men Slim Printed T-Shirt",
    productPrice: 590,
  },
  {
    img: "/images/products/shirt7.jpg",
    productName: "Men Slim Printed T-Shirt",
    productPrice: 880,
  },
  {
    img: "/images/products/shirt8.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 600,
  },
  {
    img: "/images/products/jeans1.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 770,
  },
  {
    img: "/images/products/jeans2.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 940,
  },
  {
    img: "/images/products/jeans3.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 1052,
  },
  {
    img: "/images/products/jeans4.jpeg",
    productName: "Men Slim Printed Shirt",
    productPrice: 2566,
  },
  {
    img: "/images/products/sandos1.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 233,
  },
  {
    img: "/images/products/sandos2.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 658,
  },
  {
    img: "/images/products/sandos3.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 320,
  },
  {
    img: "/images/products/sandos4.jpg",
    productName: "Men Slim Printed Shirt",
    productPrice: 450,
  },
];

btnL.addEventListener("click", lowToHigh);
btnH.addEventListener("click", highToLow);

function lowToHigh() {
  productDetails.sort(function (a, b) {
    // console.log(a.productPrice, b.age);
    return a.productPrice - b.productPrice;
  });
  productDisplay2 = "";
  productDisplay();
}
function highToLow() {
  productDetails.sort(function (a, b) {
    //   console.log(a.productPrice, b.age);
    return b.productPrice - a.productPrice;
  });
  productDisplay2 = "";
  productDisplay();
}

// console.log(employees);

function productDisplay() {
  for (let i = 0; i < productDetails.length; i++) {
    productDisplay2 += `<a href="#"><div class="col"><div class="img"><img src="${productDetails[i].img}"alt="shirt1" /></div><div class="product-details"><p class="product-name">${productDetails[i].productName}<p><span class="product-price">Rs. ${productDetails[i].productPrice}</span></div></div></a>`;
    product.innerHTML = productDisplay2;
  }
}

productDisplay();

// btn.addEventListener("click", productDisplay);
// console.log(productDetails[0].img);
// function productDisplay() {
//   productDisplay2 += `<a href="#"></a><div class="col"><div class="img"><img src="${productDetails[0].img}"alt="shirt1" /></div><hr /><div class="product-details"><p class="product-name">Men Slim Printed Casual Tshirt<p><span class="product-price">Rs. 400</span></div></div></a>`;
//   product.innerHTML = productDisplay2;
// }
