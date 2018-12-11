/**
 * Created by tarena on 18-11-30.
 */


function check_login() {
    $.get('/check_login/',function (data) {
        console.log(data);
        var html = "";
        if(data.loginStatus == 1){
            //有登录信息,欢迎xxx登录
            html += "欢迎:"+data.loginname;
            html += "&nbsp;&nbsp;&nbsp;&nbsp;";
            html += "<a href='/logout/'>退出</a>";
        }else{
            html += "<a href='/login/' id='login' target='_blank'>登录</a>";
            html += "<a href='/register/' id='register' target='_blank'>注册</a>";

        }
        console.log(html);
        $("#check_login").html(html);

    },'json');
}

$(document).ready(function() {
    check_login();
});