/**
 * Created with JetBrains RubyMine.
 * User: matej
 * Date: 4/25/13
 * Time: 10:01 PM
 * To change this template use File | Settings | File Templates.
 */

var array_clicks = new Array( );

$(document).ready(

    function(e){
        delete window.array_clicks;
        $("map area").on("click", function(event){
            event.preventDefault();
            var data = $(this).data('body');
            if(array_clicks.length >= 3){
                alert("Nemôžete zvoliť viac ako 3 časti tela.");
                return;
            }

            for(var i = 0; i < array_clicks.length; i++){
                if(data == array_clicks[i]){
                    alert("Nemôžete zvoliť to isté znovu.");
                    return;
                }
            }

            window.array_clicks[window.array_clicks.length] = data;
            $('#selectedPart'.concat(array_clicks.length.toString())).css({
                                   'left': event.pageX - 20,
                                   'top': event.pageY - 20,
                                   'display': 'block',
                                   'position': 'absolute',
                                   'z-index': '50'
            });
    });

});

$(document).ready(

    function(){
        $('.submit').live('click', function(ev) {
        var clicks = "";

        for(var i = 0; i < array_clicks.length; i++){
            if(i == (array_clicks.length -1)){
                clicks = clicks + "q[]=" + array_clicks[i]
            }
            else{
                clicks = clicks + "q[]=" + array_clicks[i] + "&";
            }
        };

        $.ajax({
                type: "GET",
                url: "/drugs/body_clicked_search?".concat(clicks),
                success: window.location.href = "/drugs/body_clicked_search?" + clicks
            });

    });

});