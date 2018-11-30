import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

const searchBar = document.getElementById("query")
const searchResult = document.getElementById("search-result")

// if (searchBar) {
//   searchBar.addEventListener("keypress", event => {
//     if (event.keyCode === 13) {
//       console.log("test");
//       window.scrollIntoView(true)
//       // event.stopPropagation()
//     }
//   })
// }

// if (searchResult){
//   searchBar.scrollIntoView()
// }
