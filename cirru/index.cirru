doctype

html
  head
    title "Fragile Table"
    meta (:charset utf-8)
    script(:src dist/vendor.min.js)
    link (:rel icon) (:href png/table.png)
    @if (@ dev)
      @block
        link (:rel stylesheet) (:href css/main.css)
        script (:defer) (:src build/main.js)
      @block
        link (:rel stylesheet) (:href dist/main.min.css)
        script (:defer) (:src dist/main.min.js)
  body