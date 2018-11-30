import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

const searchBar = document.querySelector("query");
const searchResult = document.getElementById("search-result");
const testMe = document.getElementById("testme");


// if (searchBar) {
//   searchBar.addEventListener("keypress", event => {
//     if (event.keyCode === 13) {
//       console.log("test");
//       window.scrollIntoView(true)
//       // event.stopPropagation()
//     }
//   })
// }

// if (testMe) {
//   testMe.addEventListener("submit", event => {
//     console.log("coucou");
//       searchBar.scrollIntoView();
//   });
// };


// if (searchResult){
//   searchBar.scrollIntoView()
// }
