/* || Show menu on Store */
document.getElementById('show-menu').addEventListener('click', function () {
    var menu = document.getElementById('menu');
    if (menu.style.display === 'none' || menu.style.display === '') {
        menu.style.display = 'flex';
        var element = document.getElementById('show-x');
        element.className = 'fa-solid fa-xmark';
    } else {
        menu.style.display = 'none';
        var element = document.getElementById('show-x');
        element.className = 'fas fa-bars';
    }

})
document.addEventListener('DOMContentLoaded', function () {
    var showCategory = document.querySelector('#show-category');
    var showUser = document.querySelector('#show-user');
    var menuCategory = document.getElementById('menu-category');
    var menuUser = document.getElementById('menu-user');
    
    if (showCategory && menuCategory) {
        showCategory.addEventListener('click', function () {
            var currentDisplay = window.getComputedStyle(menuCategory).display;

            if (currentDisplay === 'none') {
                menuCategory.style.display = 'block';
            } else {
                menuCategory.style.display = 'none';
            }
        });
    } else {
        console.error('NGU');
    }
    if (showUser && menuUser) {
    	showUser.addEventListener('click', function () {
            var currentDisplay = window.getComputedStyle(menuUser).display;

            if (currentDisplay === 'none') {
            	menuUser.style.display = 'block';
            } else {
            	menuUser.style.display = 'none';
            }
        });
    } else {
        console.error('NGU');
    }
});
