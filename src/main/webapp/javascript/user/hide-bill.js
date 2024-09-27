const hideInvoice = document.getElementById("hide-bill"),
bill = document.querySelector('.bill'),
body = document.querySelector('body'),
detail = document.querySelectorAll('.detail-btn');
hideInvoice.addEventListener('click', function() {
    bill.style.top = "-1000px";
})
detail.forEach( e => {
    e.addEventListener('click', function() {
        bill.style.top = "0";
    })
})