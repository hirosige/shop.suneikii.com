$(document).ready(function () {
    $(document).on('click', '.search-overlay-btn', function () {
        $('.search-overlay').show();
    });

    $(document).on('click', '.search-close', function () {
        $('.search-overlay').hide();
    });

    $(document).on('mouseover', '.img-thumbnail-block img', function () {
        var imgSource = $(this).attr('src');
        var imgElement = $(this).closest('.img-block').find('.img-full-block img');

        if(imgSource !== imgElement.attr('src')) {
            imgElement.fadeOut(100, function () {
                imgElement.attr('src', imgSource);
                imgElement.fadeIn(100);
            });
        }
    });

    $(document).on('click', '.number-spinner button', function () {
        var btn = $(this),
            oldValue = btn.closest('.number-spinner').find('input').val().trim(),
            newVal = 0;
        
        if(isNaN(oldValue)) {
            oldValue = 0;
        } else if(oldValue <= 0) {
            oldValue = 0;
        }
        
        if (btn.attr('data-dir') == 'up') {
            newVal = parseInt(oldValue) + 1;
        } else {
            if (oldValue > 1) {
                newVal = parseInt(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        btn.closest('.number-spinner').find('input').val(newVal);
    });
});
