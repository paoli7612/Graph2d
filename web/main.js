var world = document.getElementById('world')

var selected = null
world.onmousemove = function (event) {
    if (selected && event.buttons) {
        selected.style.left = event.x + "px";
        selected.style.top = event.y + "px";
    } else if (event.buttons) {
        selected = world.querySelectorAll( ":hover" )[0]
    } else {
        selected = null
    }
}

var new_vertex = function() {
    var v = document.createElement('input');
    v.classList.add('vertex')
    world.appendChild(v);
}
