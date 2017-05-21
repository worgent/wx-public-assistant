<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
   /* out.print(request.getAttribute("pages"));*/
%>
<!DOCTYPE html>
<html>

<head>
    <title>在线尝试 Bootstrap 实例</title>
    <link href="/admin-lib/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/admin-lib/css/bootstrap-select.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/admin-lib/css/style.css">

    <link rel="stylesheet" href="/admin-lib/css/adminia.css" rel="stylesheet">

    <script src="/admin-lib/js/jquery.min.js"></script>
    <script src="/admin-lib/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script src="/admin-lib/js/bootstrap-select.js"></script>
    <script src="/admin-lib/js/bootstrap-datetimepicker.js"></script>
    <script src="/admin-lib/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/admin-lib/js/default.js"></script>

    <script src="/admin-lib/js/jquery.flot.js"></script>

    <script src="/admin-lib/js/line.js"></script>


</head>
<style type="text/css">

</style>

<body>
<div class="main">

    <div class="right col-xs-12">

        <h3>充值查询</h3>

        <form class="bs-example bs-example-form" role="form" id="formVal" action="/admin/czSearch.do" method="post" onsubmit="return czSerach()">
           <%-- <input type="hidden" value="1" name="pageNo"/>--%>
               <input type="hidden" value="${page.pageNo}" id="pageNo" name="pageNo"/>
            <div class="right-form">
                <div class="input-group input-myGroup">
                    <span class="input-group-addon input-group-lg">会员名称</span>
                    <input type="text" name="vipName" class="form-control" id="name" value="${vipName}" placeholder="会员名称">
                </div>
                <div class="input-group input-myGroup">
                    <span class="input-group-addon input-group-lg select-span">充值门店:</span>
                    <select name="mendian" class="selectpicker" data-size="5" id="mendian">
                        <option value="" <c:if test="${mendian != 1 }">selected</c:if>>请选择</option>
                        <option value="1" <c:if test="${mendian == 1 }">selected</c:if>>文化江山台球厅</option>

                    </select>
                </div>
                <div class="input-group input-myGroup">
                    <span class="input-group-addon input-group-lg">会员手机号:</span>
                    <input type="text" name="vipPhone" class="form-control" id="vipPhone" value="${vipPhone}" placeholder="填写手机号">
                </div>
                <div class="input-group input-myGroup date form_date" data-date="" data-date-format="" data-link-field="dtp_input2"
                     data-link-format="yyyy-mm-dd">

                    <span class="input-group-addon input-group-lg">充值时间:</span>
                    <input class="form-control" size="16" type="text" value="${czTime}" name="czTime" id="time" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>

                </div>

                <div class="input-group input-myGroup">
                    <span class="input-group-addon input-group-lg">充值金额:</span>
                    <input type="text" class="form-control money-min" name="czMoneyMin" value="${czMoneyMin}" id="czMoneyNum_1">
                    <span class="money-zhi">至</span>
                    <input type="text" class="form-control money-max" name="czMoneyMax" value="${czMoneyMax}" id="czMoneyNum_2">
                </div>
                <div class="right-button">
                    <button type="submit" class="btn btn-default">查询</button>
                    <button type="button" class="btn btn-default">导出</button>
                </div>
            </div>
        </form>

        <table class="table table-bordered table-hover dataTable">
            <thead>
            <tr class="info">
                <th>会员卡号</th>
                <th>姓名</th>
                <th>手机号码</th>
                <th>充值金额</th>
                <th>充值时间</th>
                <th>充值门店</th>

            </tr>
            </thead>
            <tbody id="tableData">

            <c:forEach items="${page.list}" var="czInfo">
                <tr>

                    <td>${czInfo.vipCardNumMapKey}</td>
                    <td> ${czInfo.vipNameMapKey}</td>
                    <td> ${czInfo.phoneMapKey} </td>
                    <td> ${czInfo.czMoneyMapKey} </td>
                    <td> ${czInfo.czTimeMapKey} </td>
                    <td> ${czInfo.mendianMapKey} </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%-- <div class="loadMore">
             <button type="button" class="btn btn-success">加载更多...</button>
         </div>--%>

        <div class="paging page_c">

        <span class="page">

            <input type="hidden" value="${page.totalCount}" id="totalCount" name="totalCount"/>
            <input type="hidden" value="${page.pageNo}" id="currentPageNo" name="currentPageNo"/>
            <input type="hidden" value="${page.totalPage}" id="totalPage" name="totalPage"/>
            <span class="gong">共</span>
                <var id="pagePiece" class="orange">${page.totalCount }</var>
            <span class="tiao">条</span>
                <var id="pageTotal">${page.pageNo }/${page.totalPage }</var>

            <select class="pageSelect" id="selectPage">
                <c:forEach begin="1" end="${page.totalPage }" var="curPage">
                    <option value="${curPage }"
                            <c:if test="${curPage == page.pageNo }">selected</c:if> >${curPage }</option>
                </c:forEach>
            </select>
        </span>
        </div>

    </div>


</div>

<script type="text/javascript">



    $("#selectPage").change(function () {
        var s= $(this).val();
        $("#pageNo").val($(this).val());
        $("#formVal").submit();


    })



    var gPageNo = 1;
    function czSerach() {
        var nameVal = $("#name").val().trim();
        var mendianVal = $("#mendian").val();
        var timeVal = $("#time").val();
        var vipPhoneVal = $("#vipPhone").val().trim();
        var czMoneyVal_1 = $("#czMoneyNum_1").val().trim();
        var czMoneyVal_2 = $("#czMoneyNum_2").val().trim();
        var currentPageNoVal = $("#pageNo").val();
        var totalPageVal = $("#totalPage").val();

       /* if(currentPageNoVal > totalPageVal){
            $("#pageNo").val("1");
        }
*/

        if (nameVal == "" & mendianVal == "" & timeVal == "" & vipPhoneVal == "" & czMoneyVal_1 == "" & czMoneyVal_2 == "") {
            alert("至少填写一项");
            return false;
        }

        if (vipPhoneVal != "") {
            if (!vipPhoneVal.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/)) {
                alert("请填写正确的手机号");
                $("#vipPhone").val("");
                return false;
            }
        }


        if (czMoneyVal_1 != "") {

            if (!czMoneyVal_1.match(/^[A-Za-z0-9_-]+$/)) {
                alert("请填写数字");
                $("#czMoneyNum_1").val("")
                return false;
            }
        }
        if (czMoneyVal_2 != "") {

            if (!czMoneyVal_2.match(/^[A-Za-z0-9_-]+$/)) {
                alert("请填写数字");
                $("#czMoneyNum_2").val("")
                return false;
            }
        }
        if (czMoneyVal_1 > czMoneyVal_2) {
            alert("起始金额大于结束金额");
            return false;
        }
        $("#tableData").empty();

    }



</script>
</body>
</html>