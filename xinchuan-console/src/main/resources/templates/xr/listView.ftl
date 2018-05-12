<!DOCTYPE html>
<html>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>团队管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">招聘管理</a>
        <a>
          <cite>招聘列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <form class="layui-row" action="/xr/listView" method="get" id="pageForm">
        <div class="layui-form layui-col-md12 x-so">
            <input class="layui-input" placeholder="开始日" name="startTime" id="startDate"
                   value="${seracheForm.startDate!""}">
            <input class="layui-input" placeholder="截止日" name="endTime" id="endDate" value="${seracheForm.endDate!""}">
            <input name="postName" id="postName" placeholder="请输入岗位名称" class="layui-input"
                   value="${seracheForm.postName!""}">
            <input type="hidden" name="currentPage" id="currentPage" value="${recruitList.currentPage}">
            <input type="hidden" id="totalCount" value="${recruitList.totalCount}">
            <button type="button" onclick="serachForm()" class="layui-btn"><i class="layui-icon">&#xe615;</i></button>
        </div>
    </form>
   <#-- <span class="x-right" style="line-height:40px">共有数据：${recruitList.totalCount}条</span>-->
    <table class="layui-table">
        <thead>
        <tr>
         <#--   <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i
                        class="layui-icon">&#xe605;</i></div>
            </th>-->
            <th>ID</th>
            <th>岗位名称</th>
            <th>岗位职责</th>
            <th>岗位要求</th>
            <th>状态</th>
            <th>时间</th>
            <th>操作</th>
        </thead>
    <#if recruitList.list ??>
        <#list recruitList.list as recruit>
        <tbody>
        <tr>
           <#-- <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${recruit.id}'><i
                        class="layui-icon">&#xe605;</i>
                </div>
            </td>-->
            <td width="5%">${recruit.id}</td>
            <td width="15%">${recruit.postName}</td>
            <td  width="25%"> ${recruit.duty!''} </td>
            <td width="25%">${recruit.requirements!""}</td>
            <td width="5%">
             <#if recruit.isShow==1>
                    <span class="layui-btn layui-btn-disabled layui-btn-mini">未发布</span>
             <#else>
                    <span class="layui-btn layui-btn-normal layui-btn-mini">已发布</span>
             </#if>
            </td>
            <td width="10%">${recruit.createTime}</td>
            <td class="td-manage" width="10%">
                <a  title="发布" onclick="member_enable(this,${recruit.id},${recruit.isShow})" href="javascript:;">
                    <i class="layui-icon">&#xe601;</i>
                </a>
                <a title="编辑" onclick="x_admin_show('编辑','addView?id='+${recruit.id})" href="javascript:;">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,${recruit.id})" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        </tbody>
        </#list>
    </#if>
    </table>
    <div id="page" style="text-align: center"> </div>
</div>
<script type="text/javascript" src="/common/pagination.js"></script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#startDate' //指定元素
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#endDate' //指定元素
        });
    });

    /*删除所有*/
    function member_del(object, id) {
        var _this = this;
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.ajax({
                url: './delOne',
                dataType: 'JSON',
                type: 'POST',
                data: {
                    id: id
                },
                success: function (e) {
                    $(_this).parents("tr").remove();
                    $("#currentPage").val(0);
                    location.reload();
                    layer.close();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }
            })
        });
    }

    function member_enable(object, id, isShow) {
        layer.confirm('确认要' + (isShow == 1 ? '发布' : '停止发布') + '吗？', function (index) {
            //发异步删除数据
            $.ajax({
                url: './enable',
                dataType: 'JSON',
                type: 'POST',
                data: {
                    id: id,
                    isShow: isShow == 0 ? 1 : 0
                },
                success: function (e) {
                    $("#currentPage").val(0);
                    location.reload();
                    layer.msg('已' + (isShow == 0 ? '发布' : '停止发布') + '!', {icon: 1, time: 1000});
                }
            })
            layer.close();
        });
    }
    function serachForm() {
        $("#currentPage").val(0);
        $("#pageForm").submit();
    }
</script>
</body>

</html>