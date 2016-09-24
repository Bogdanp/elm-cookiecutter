import "../css/app.scss";
import Elm from "../elm/Main.elm";

const handleClicks = (event) => {
  if (event.target.tagName.toLowerCase() === "a") {
    const loc = event.target.getAttribute("href");

    if (!loc || loc.match(/[^:]*:?\/\//)) {
      return;
    }

    event.preventDefault();
    window.history.pushState({}, "", loc);
    window.dispatchEvent(new window.PopStateEvent("popstate", {}));
  }
};

window.setup = (el, context) => {
  context.now = (new Date).getTime();

  let app = Elm.Main.embed(el, context);

  document.onclick = handleClicks;
};
