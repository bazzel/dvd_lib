$(function() {
    // Ajaxify links with a target attribute set to 'replace'
    // and replace the li with contains the link
    // with the response.
    $('ul li a[target$=replace]').livequery("click",
    function() {
        var aObj = $(this);
        $.get(
        this.href,
        function(data) {
            aObj.parents('li').after(data).remove();
        });
        return false;
    });

    $('#recording_seen').livequery('change',
    function() {
        $(this).parents('form').ajaxSubmit({
            success: function(responseText, statusText) {
              $('#recording_' + responseText + '').toggleClass('seen');
//                alert(responseText);
//                alert(statusText);
            }
        });
        return false;
    });

});