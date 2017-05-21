<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
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

    <script src="//admin-lib/js/jquery.flot.js"></script>
    <script src="/admin-lib/js/line.js"></script>

</head>
<style type="text/css">
 
</style>

<body>
    <div class="main">
        
        <div class="right col-xs-12">



            <!--用户充值统计-->
            <h3>用户消费统计</h3>
            <div class="serach-user-cz col-xs-12">

                <div class="user-cz-select-group">
                    <span>按月份查看</span>
                    <select name="type" class="selectpicker" data-size="5">
                        <option>请选择</option>
                        <option>科幻</option>
                        <option>剧情</option>
                        <option>犯罪</option>
                        <option>西部</option>
                        <option>爱情</option>
                    </select>
                    <!--</div>
                <div class="user-cz-select-group">-->
                    <select name="type" class="selectpicker" data-size="5">
                        <option>请选择</option>
                        <option>科幻</option>
                        <option>剧情</option>
                        <option>犯罪</option>
                        <option>西部</option>
                        <option>爱情</option>
                    </select>
                    <span>本月消费金额：0</span>
                </div>

            </div>

            <div class="span9">
                <div class="widget">

                    <div class="widget-header">
                        <h3>Line Chart</h3>
                    </div>
                    <div class="widget-content">
                        <div id="line-chart" class="chart-holder"></div>
                    </div>
                </div>
            </div>


            


        </div>


    </div>

    <script type="text/javascript">
  
       

        
    </script>
</body>

</html>