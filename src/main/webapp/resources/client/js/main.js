/*  ---------------------------------------------------
    Template Name: Male Fashion
    Description: Male Fashion - ecommerce teplate
    Author: Colorib
    Author URI: https://www.colorib.com/
    Version: 1.0
    Created: Colorib
---------------------------------------------------------  */

'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Gallery filter
        --------------------*/
        $('.filter__controls li').on('click', function () {
            $('.filter__controls li').removeClass('active');
            $(this).addClass('active');
        });
        if ($('.product__filter').length > 0) {
            var containerEl = document.querySelector('.product__filter');
            var mixer = mixitup(containerEl);
        }
    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Search Switch
    $('.search-switch').on('click', function () {
        $('.search-model').fadeIn(400);
    });

    $('.search-close-switch').on('click', function () {
        $('.search-model').fadeOut(400, function () {
            $('#search-input').val('');
        });
    });

    /*------------------
		Navigation
	--------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*------------------
        Accordin Active
    --------------------*/
    $('.collapse').on('shown.bs.collapse', function () {
        $(this).prev().addClass('active');
    });

    $('.collapse').on('hidden.bs.collapse', function () {
        $(this).prev().removeClass('active');
    });

    //Canvas Menu
    $(".canvas__open").on('click', function () {
        $(".offcanvas-menu-wrapper").addClass("active");
        $(".offcanvas-menu-overlay").addClass("active");
    });

    $(".offcanvas-menu-overlay").on('click', function () {
        $(".offcanvas-menu-wrapper").removeClass("active");
        $(".offcanvas-menu-overlay").removeClass("active");
    });

    /*-----------------------
        Hero Slider
    ------------------------*/
    $(".hero__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='arrow_left'><span/>", "<span class='arrow_right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: false
    });

    /*--------------------------
        Select
    ----------------------------*/
    $("select").niceSelect();

    /*-------------------
		Radio Btn
	--------------------- */
    $(".product__color__select label, .shop__sidebar__size label, .product__details__option__size label").on('click', function () {
        $(".product__color__select label, .shop__sidebar__size label, .product__details__option__size label").removeClass('active');
        $(this).addClass('active');
    });

    /*-------------------
		Scroll
	--------------------- */
    $(".nice-scroll").niceScroll({
        cursorcolor: "#0d0d0d",
        cursorwidth: "5px",
        background: "#e5e5e5",
        cursorborder: "",
        autohidemode: true,
        horizrailenabled: false
    });

    /*------------------
        CountDown
    --------------------*/
    // For demo preview start
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    if(mm == 12) {
        mm = '01';
        yyyy = yyyy + 1;
    } else {
        mm = parseInt(mm) + 1;
        mm = String(mm).padStart(2, '0');
    }
    var timerdate = mm + '/' + dd + '/' + yyyy;
    // For demo preview end


    // Uncomment below and use your date //

    /* var timerdate = "2020/12/30" */

    $("#countdown").countdown(timerdate, function (event) {
        $(this).html(event.strftime("<div class='cd-item'><span>%D</span> <p>Days</p> </div>" + "<div class='cd-item'><span>%H</span> <p>Hours</p> </div>" + "<div class='cd-item'><span>%M</span> <p>Minutes</p> </div>" + "<div class='cd-item'><span>%S</span> <p>Seconds</p> </div>"));
    });

    /*------------------
		Magnific
	--------------------*/
    $('.video-popup').magnificPopup({
        type: 'iframe'
    });

    /*-------------------
		Quantity change
	--------------------- */
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="fa fa-angle-up inc qtybtn"></span>');
    proQty.append('<span class="fa fa-angle-down dec qtybtn"></span>');


    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find('input').val(newVal);
    });

    var proQty = $('.pro-qty-2');
    proQty.prepend('<span class="fa fa-angle-left dec qtybtn"></span>');
    proQty.append('<span class="fa fa-angle-right inc qtybtn"></span>');
    proQty.on('click', '.qtybtn', function () {
        let change = 0;
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
            change = 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
                change = -1;
            } else {
                newVal = 1;
            }
        }
        // $button.parent().find('input').val(newVal);
        const input =$button.parent().find('input');
        input.val(newVal);

        // set form index
        const index = input.attr("data-cart-detail-index")
        const el = document.getElementById(`cartDetails${index}.quantity`);
        $(el).val(newVal);

        
        //  get price
        const price = input.attr('data-cart-detail-price');
        const id = input.attr('data-cart-detail-id');
        
        const priceElement = $(`[data-cart-detail-id="${id}"]`);
        if (priceElement){
            const newPrice = +price * newVal;
            priceElement.text(formatCurrency(newPrice.toFixed(2)) + " VNĐ");
        }
        // update total price
        const totalPriceElement = $(`[data-cart-total-price]`);
        if (totalPriceElement && totalPriceElement.length){
            const currentTotalPrice = totalPriceElement.first().attr("data-cart-total-price");
            let newTotal = +currentTotalPrice ;
            if(change == 0){
                newTotal = +currentTotalPrice;
            }
            else{
                newTotal = change * (+price) + +currentTotalPrice;
            }
            // reset change
            change =0 ;
            // update 
            totalPriceElement?.each(function(index,element){
                $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2)) + " VNĐ");
                $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);
            });
        }
        
    });

    function formatCurrency(value){
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            currency: 'VND',
            minimumFractionDigits: 0
        });
        let formattedValue = formatter.format(value);
        formattedValue = formattedValue.replace(/\./g, ',');
        return formattedValue;
    }
    /*------------------
        Achieve Counter
    --------------------*/
    $('.cn_num').each(function () {
        $(this).prop('Counter', 0).animate({
            Counter: $(this).text()
        }, {
            duration: 4000,
            easing: 'swing',
            step: function (now) {
                $(this).text(Math.ceil(now));
            }
        });
    });

    /*-------------------
		Filter
	--------------------- */
    $('#btnFilter').on('click', function(event){
        event.preventDefault();
        let categoryArr = [];
        let brandArr = [];
        let priceArr = [];
        // category filter
        $("#categoryFilter .form-check-input:checked").each(function(){
            categoryArr.push($(this).val());
        });
        // brand filter
        $("#brandFilter .form-check-input:checked").each(function(){
            brandArr.push($(this).val());
        });
        // price filter
        $("#priceFilter .form-check-input:checked").each(function(){
            priceArr.push($(this).val());
        });

        // console.log(categoryArr, brandArr, priceArr);
        // debugger
       // sort order
       let sortValue = $('input[name="radio-sort"]:checked').val();

       const currentUrl = new URL(window.location.href);
       const searchParams = currentUrl.searchParams;

       searchParams.set('page', 1);
       searchParams.set('sort', sortValue);

       if (categoryArr.length > 0){
        searchParams.set('category', categoryArr.join(','));
       }
       if (brandArr.length > 0){
        searchParams.set('brand', brandArr.join(','));
       }
       if (priceArr.length > 0){
        searchParams.set('price', priceArr.join(','));
       }

       window.location.href = currentUrl.toString();
    });





})(jQuery);