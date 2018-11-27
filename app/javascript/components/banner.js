import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find your coffees", "Find the best coffees"],
    typeSpeed: 60,
    loop: false
  });
};

export { loadDynamicBannerText };
