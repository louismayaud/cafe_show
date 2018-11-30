import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

const searchBar = document.querySelector("query");
const searchResult = document.getElementById("search-result");
const testMe = document.getElementById("testme");

// if (testMe) {
//   testMe.addEventListener("submit", event => {
//     console.log("coucou");
//       searchBar.scrollIntoView();
//   });
// };

// if (searchResult){
//   searchBar.scrollIntoView()
// }
