/**
 * Created with JetBrains RubyMine.
 * User: matej
 * Date: 4/16/13
 * Time: 7:04 PM
 * To change this template use File | Settings | File Templates.
 */

function incr_clicks(data){

    $.ajax({
        type: 'POST',
        url: '/clicks/'+data
    })

}