<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../publics/jstl.jsp" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>编辑地址</title>
    <link rel="stylesheet" href="${ctx}/zzk/resource/zzk/dest/base.css">
    <link rel="stylesheet" href="${ctx}/zzk/resource/zzk/dest/LArea.min.css">
    <script src="${ctx}/zzk/resource/zzk/js/flexible.js"></script>
</head>
<body>
<section class="address">
    <form id="addressForm" action="${ctx}/zzk/saveAddress" method="post">
        <div class="form-group">
            <label>姓名：</label>
            <div class="control-group">
                <input class="form-control" type="text" name="name" value="<c:if test='${address != null}'>${address.custName}</c:if>" placeholder="请输入收货人姓名">
                <span class="control-clear">&times;</span>
            </div>
        </div>
        <div class="form-group">
            <label>手机号码：</label>
            <div class="control-group">
                <input class="form-control" type="tel" name="phone" value="<c:if test='${address != null}'>${address.custPhone}</c:if>" placeholder="请输入收货人手机号码">
                <span class="control-clear">&times;</span>
            </div>
        </div>
        <div class="form-group">
            <label>省市：</label>
            <!-- <div class="control-group"><input class="form-control" id="city" name="city" value="江西省,抚州市,黎川县" placeholder="请选择地址"></div> -->
            <div class="control-group no-smart">
                <input class="form-control control-loc" id="city" name="city" readonly= "readonly" value="<c:if test='${address != null}'>${address.location}</c:if>" placeholder="请选择地址">
            </div>
        </div>
        <div class="form-group">
            <label>详细地址：</label>
            <div class="control-group">
                <input class="form-control" name="detail" value="<c:if test='${address != null}'>${address.address}</c:if>" placeholder="长度在5-500之间">
                <span class="control-clear">&times;</span>
            </div>

        </div>
        <!-- <input type="hidden" id="cityIds" value="360000,361000,361022">           -->
        <input type="hidden" id="cityIds" name="cityIds" value="">
        <input type="hidden" id="addressId" name="addressId" value="<c:if test='${address != null}'>${address.addressId}</c:if>">
        <input type="hidden" id="isDefault" name="isDefault" value="<c:if test='${address != null}'>${address.isDefault}</c:if>">
    </form>
    <div class="address-submit">
        <button class="btn btn-block round btn-save">保存地址</button>
    </div>
</section>
<section class="popup transition" id="Popup">
    <div class="popup-inner">
        <div class="popup-content"></div>
        <div class="popup-action">
            <button class="btn btn-sm popup-cancel round"><span class="icn icn-cancel"></span>确定</button>
            <!-- <button class="btn btn-sm do-del round"><span class="icn icn-next"></span>确定</button> -->
        </div>
    </div>
</section>
<section class="popup-mask"></section>
<script src="${ctx}/zzk/resource/zzk/js/jquery.min.js"> </script>
<script src="${ctx}/zzk/resource/zzk/js/fastclick.js"> </script>
<script src="${ctx}/zzk/resource/zzk/js/base.js"></script>
<script src="${ctx}/zzk/resource/zzk/js/LArea.js"></script>
<script src="${ctx}/zzk/resource/zzk/js/LAreaData2.js"></script>
<script>
    jQuery(function(){
        $('.control-group').not('.no-smart').smartInput()
        var area1 = new LArea();
        area1.init({
            'trigger': '#city',
            'valueTo': '#cityIds',
            'keys': {
                id: 'value',
                name: 'text'
            },
            'type': 2,
            'data': [provs_data, citys_data, dists_data]
        });
        var cityids = $('#cityIds').val();
        var ProvinceCode,CityCode,AreaCode;
        if(cityids){
            cityids = cityids.split(',');

            for(var i=0;i<provs_data.length;i++){
                if (provs_data[i].value == cityids[0]) {
                    ProvinceCode = i
                }
            }
            for(var i=0;i<citys_data[cityids[0]].length;i++){
                if (citys_data[cityids[0]][i].value == cityids[1]) {
                    CityCode = i
                }
            }
            for(var i=0;i<dists_data[cityids[1]].length;i++){
                if (dists_data[cityids[1]][i].value == cityids[2]) {
                    AreaCode = i
                }
            }
            area1.value = [ProvinceCode, CityCode, AreaCode];//控制初始位置，注意：该方法并不会影响到input的value  ，是按顺序调用
        }

        //删除弹窗
        var pop = new Popup($('#Popup'), {
            maskClose: true,
            closeAfter: function(){
                if($('.btn-save').data('success')){
                    location.replace('${ctx}/zzk/addresses');
                }
            }
        });
        //ajax demo
        $('.btn-save').on('click', function(event){
            var  $this = $(this);
            event.preventDefault();

            var detail = $('input[name=detail]').val();

            if(detail.length < 5 || detail.length > 500){
                pop.updateContent('详细地址长度在5-500之间').show();
                return false;
            }

            var name = $('input[name=name]').val();

            if(!name){
                pop.updateContent('姓名不能为空!').show();
                return false;
            }

            var phone = $('input[name=phone]').val();

            if(!phone || !APP.phoneReg.test(phone)){
                pop.updateContent('手机号不正确!').show();
                return false;
            }

            var city = $('input[name=city]').val();

            if(!city){
                pop.updateContent('城市不能不选!').show();
                return false;
            }

            if($this.data('ajax')){ return  false }

            //打开一个加载器
            APP.showLoading();

            $this.data('ajax', true);
            $.ajax({
                url: '${ctx}/zzk/saveAddress',
                dataType: 'json',
                data: $('#addressForm').serialize()
            }).done(function(data){
                //关闭加载器
                APP.closeLoading();
                if(data.ret == 0){
                    $this.data('success', true);
                    pop.updateContent('地址添加成功!').show();
                }else{
                    $this.data('success', null);
                    pop.updateContent('地址添加失败!').show();
                }
            }).always(function(){
                $this.data('ajax', null);
            });
        });

    });
</script>
</body>
</html>