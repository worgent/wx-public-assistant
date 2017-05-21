var xConfirm = function (msg, fn) {
    var dom = '<div class="confirm-window"><div class="confirm-heading">消息提示</div><div class="confirm-body"><div class="confirm-body-txt">' + msg + '</div></div><div class="confirm-footer"><div class="confirm-btn confirm-confirm-btn" tabindex="99">确定</div><div class="confirm-btn confirm-cancle-btn" tabindex="100">取消</div></div></div>';
    var style = '.confirm-cover{top:0;left:0;bottom:0;right:0;color:#555;font-family:"Microsoft Yahei";font-size:14px;padding:10px;z-index:1100;box-sizing:border-box;position:fixed;overflow:hidden;background-color:rgba(0,0,0,.5)}.confirm-cover .confirm-window{background-color:#fff;overflow:hidden;width:400px;position:absolute;z-index:1;top:50%;left:50%;margin:-120px 0 0 -200px;}.confirm-cover .confirm-heading{height:40px;line-height:40px;padding-left:10px;background:#393d42;color:#FFF;}.confirm-cover .confirm-body{display:table;width:100%;height:140px;overflow-x:hidden;overflow-y:auto;padding:20px;box-sizing:border-box;word-break:break-all;word-wrap:break-word;}.confirm-cover .confirm-body .confirm-body-txt{display:table-cell;vertical-align:middle;text-align:center;}.confirm-cover .confirm-footer{height:60px;padding:0 20px;line-height:50px;text-align:center;background:#F3F3F3;border-top:1px solid #EEE;}.confirm-cover .confirm-footer .confirm-btn{outline:0;display:inline-block;margin:12px 10px;padding:0 20px;cursor:pointer;font-size:16px;background:#FFF;height:32px;line-height:32px;color:#696969;border:1px solid #E1E5EA;border-radius:4px;}.confirm-footer .confirm-btn:hover{color:#333;border-color:#DDD;}';

    var body = document.querySelector("body");
    var confirmStyle = document.createElement("style");
    confirmStyle.id = "confirm-style";
    confirmStyle.innerHTML = style;
    if (!document.querySelector("#confirm-style")) {
        body.appendChild(confirmStyle);
    }
    var confirmCover = document.createElement("div");
    confirmCover.className = "confirm-cover";
    confirmCover.innerHTML = dom;
    if (document.querySelector(".confirm-cover")) {
        body.removeChild(document.querySelector(".confirm-cover"));
    }

    body.appendChild(confirmCover);

    function confirmActive() {
        fn();
        body.removeChild(confirmCover);
    }
    document.querySelector(".confirm-cancle-btn").onclick = function () {
        body.removeChild(confirmCover);
    };
    document.querySelector(".confirm-confirm-btn").onclick = function () {
        confirmActive();
    };

    document.querySelector(".confirm-confirm-btn").focus();
    document.querySelector(".confirm-confirm-btn").onkeyup = function () {
        var code = window.event.keyCode;
        if (code == 32 || code == 13) {
            confirmActive();
        } else if (code == 27) {
            body.removeChild(confirmCover);
        }
    };
};