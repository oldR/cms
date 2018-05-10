<!doctype html>
<html lang="en">
<html>
<head>
    <meta charset="UTF-8">
    <title>团队列表--增加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
</head>

<body>
<div class="x-body">
    <form class="layui-form" id="myForm">
        <div class="layui-form-item">
            <label for="L_userIcon" class="layui-form-label">
                <span class="x-red">*</span>头像
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_userIcon" name="userIcon" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_name" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_name" name="name" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_position" class="layui-form-label">
                <span class="x-red">*</span>岗位
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_position" name="position" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_profile" class="layui-form-label">
                <span class="x-red">*</span>简介
            </label>
            <div class="layui-input-inline">
                <textarea name="profile" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_createTime" class="layui-form-label">
                <span class="x-red">*</span>加入时间
            </label>
            <input type="text" id="L_createTime" name="createTime" required lay-verify="required"
                   autocomplete="off" class="layui-input">
        </div>

        <div class="layui-form-item">
            <label for="L_isShow" class="layui-form-label">
                <span class="x-red">*</span>是否显示
            </label>
           <#-- <input type="checkbox" name="isShow" lay-skin="switch" lay-text="YES|NO">-->
            <input type="text" id="L_isShow" name="isShow" required lay-verify="required"
                   autocomplete="off" class="layui-input">
        </div>

        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="add" lay-submit="add" onclick="add()">
                增加
            </button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>

    </form>
</div>
<script>

      function  add() {
        var form=$("#myForm").serialize();
          $.ajax({
              type:'POST',
              dataType:'json',
              data:{
                  xcTeamManage:form
              },
              url:'saveTeamManager',
              success:function (result) {
                  if(result.success){

                  }
              },
              error:function () {

              }
          })
      }

</script>
</body>

</html>