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
  <title>购物车</title>
  <link rel="stylesheet" href="${ctx}/zzk/resource/zzk/dest/base.css">
  <script src="${ctx}/zzk/resource/zzk/js/flexible.js"></script>
</head>
<body>
<section class="voucher">
  <div class="voucher-main" id="voucherMain">
    <div class="voucher-cover">
      <c:choose>
        <c:when test='${"Z2".equals(sp)}'><img src="${ctx}/zzk/resource/zzk/temp/vouchercover48.png" width="100%"></c:when>
        <c:otherwise><img src="${ctx}/zzk/resource/zzk/temp/vouchercover.png" width="100%"></c:otherwise>
      </c:choose>
    </div>
    <div class="voucher-title"><span id="vt-title"><c:choose><c:when test='${"Z2".equals(sp)}'>转转卡尊享卡套餐兑换券</c:when><c:otherwise>转转卡优享卡套餐兑换券</c:otherwise></c:choose></span><span class="voucher-price pull-right">￥<c:choose><c:when test='${"Z2".equals(sp)}'>288</c:when><c:otherwise>200</c:otherwise></c:choose></span></div>
    <div class="voucher-info">
      <div class="voucher-info-hd">费用包含:</div>
      <div class="voucher-spot">1.景点套餐（20个景点）</div>
      <div class="voucher-spot"><span>A类景点 </span>2个，包括拙政园、虎丘。</div>
      <div class="voucher-spot">使用规则：持24h优享卡可在以上任意一个景点刷卡进入1次，持48h尊享卡可在以上所有景点各刷卡进入1次。</div>
      <div class="voucher-spot"><span>B类景点 </span>18个，包括寒山寺、沧浪亭、艺圃、可园、耦园、
        怡园、环秀山庄、姑苏水上游、盘门景区、陆巷古村、木渎古镇、震泽古镇、沙家浜、千灯古镇、沙溪古镇、
        白马涧生态园、水八仙生态文化园、桑蚕文化园。</div>
      <div class="voucher-spot">使用规则：每位持卡者可在以上所有景点各刷卡进入1次。</div>
      <div class="voucher-spot">2.苏州评弹博物馆主办评弹演出门票1张。</div>
      <div class="voucher-spot">3.价值35元苏州老字号伴手礼1份（持48h尊享卡可免费领取）</div>
      <div class="voucher-spot">4.使用手册1本，包括景点介绍、线路推荐、出行提示等信息。</div>
    </div>
  </div>
  <div class="select-box flex" data-target="#voucherOption">
    <div class="select-box-label flex-none">已选</div>
    <div class="select-box-val flex-auto text-ellipse"><c:choose><c:when test='${"Z2".equals(sp)}'>转转卡尊享卡套餐兑换券</c:when><c:otherwise>转转卡优享卡套餐兑换券</c:otherwise></c:choose>，1件</div>
    <div class="select-box-more flex-none"></div>
  </div>
</section>
<section class="select-main transition" id="voucherOption">
  <div class="select-main-hd">
    <div class="select-option-cover">
      <c:choose>
        <c:when test='${"Z2".equals(sp)}'><img src="${ctx}/zzk/resource/zzk/temp/vouchercover48.png" width="100%" height="100%"></c:when>
        <c:otherwise><img src="${ctx}/zzk/resource/zzk/temp/vouchercover.png" width="100%" height="100%"></c:otherwise>
      </c:choose>
    </div>
    <div class="select-option-m">
      <div class="select-option-title text-ellipse">转转卡兑换券</div>
      <div class="select-option-price">￥<c:choose><c:when test='${"Z2".equals(sp)}'>288</c:when><c:otherwise>200</c:otherwise></c:choose></div>
      <div class="select-option-meta text-ellipse">苏州通.<c:choose><c:when test='${"Z2".equals(sp)}'>转转卡尊享卡48h</c:when><c:otherwise>转转卡优享卡24h</c:otherwise></c:choose></div>
    </div>
  </div>
  <div class="select-main-bd">
    <dl id="packageOptions">
      <dt>套餐选择</dt>
      <dd class="button<c:if test='${"Z1".equals(sp)}'> active</c:if>" data-id="Z1" data-maxnum="5" data-minum="1" data-cover="${ctx}/zzk/resource/zzk/temp/vouchercover.png" data-meta="苏州通.转转卡优享卡24h" data-title="转转卡优享卡套餐兑换券" data-price="200">A套餐</dd>
      <dd class="button<c:if test='${"Z2".equals(sp)}'> active</c:if>" data-id="Z2" data-maxnum="6" data-minum="1" data-cover="${ctx}/zzk/resource/zzk/temp/vouchercover48.png" data-meta="苏州通.转转卡尊享卡48h" data-title="转转卡尊享卡套餐兑换券"  data-price="288">B套餐</dd>
    </dl>
    <dl class="flex" id="packageNum">
      <dt class="flex-auto">数量</dt>
      <dd class="active"><input class="step-number jnumber-input" type="text" name="count" value="1" data-maxnum = "5" data-minum="1" ></dd>
      <dd class="hide"><input class="step-number jnumber-input" type="text" name="count" value="1" data-maxnum = "6" data-minum="1" ></dd>
    </dl>
  </div>
  <div class="select-main-footer"><a class="button add-cart" href="${ctx}/zzk/addBuyVoucher">加入购物车</a></div>
  <div class="select-main-close">&times;</div>
</section><!--voucherOption-->
<section class="select-mask"></section>

<section class="popup transition" id="cartPopup">
  <div class="cart-success">
    <div class="popup-content">您的订单已成功加入购物车！</div>
    <div class="popup-action">
      <button class="btn btn-sm go-check-out round"><span class="icn icn-bag"></span>结账</button>
      <button class="btn btn-sm go-buy-more round"><span class="icn icn-cart"></span>加购</button>
    </div>
  </div>
  <div class="cart-fail">
    <div class="popup-content">加入购物车失败！</div>
    <div class="popup-action">
      <button class="btn btn-sm go-check-fail round"><span class="icn icn-next"></span>确定</button>
    </div>
  </div>
</section>
<section class="popup-mask"></section>

<footer class="footer"><a class="button add-cart" href="${ctx}/zzk/addBuyVoucher">加入购物车</a></footer>
<!-- <section class="global-nav">
  <ul class="flex">
    <li class="flex-1"><a href="./index.html"><span class="icn-palance"></span><strong>首页</strong></a></li>
    <li class="flex-1"><a href="./my-orders.html"><span class="icn-board"></span><strong>我的订单</strong></a></li>
    <li class="flex-1"><a href="./cart.html"><span class="icn-cart"></span><strong>我的购物车</strong></a></li>
  </ul>
</section>    -->
<script src="${ctx}/zzk/resource/zzk/js/jquery.min.js"> </script>
<script src="${ctx}/zzk/resource/zzk/js/fastclick.js"> </script>
<script src="${ctx}/zzk/resource/zzk/js/base.js"></script>
<script>
  jQuery(function(){
    //选择套餐条
    $('.select-box').selectBox({
      closeCb: function($val){
        $val.html($('#packageOptions dd.active').data('title') + '，' +  $('#packageNum dd.active .step-number').val() + '件');
      }
    });

    //数字加减器插件
    $('.step-number').jnumber();

    var cache = cache ||  {};

    //初始化vouchers购物车
    vouchers.init();
    var vStore = vouchers.store;

    //更改套餐
    $('#packageOptions .button').on('click', function(){
      var dataset = $(this).data(),
              index = $(this).index();
      $(this).addClass('active').siblings('.button').removeClass('active');
      //数字加减器
      $('#packageNum dd').eq(index - 1).toggleClass('active hide').siblings('dd').toggleClass('active hide');

      $('.select-option-cover img').attr('src' , dataset.cover);
      $('.select-option-meta').html(dataset.meta);
      $('.select-option-price').html('￥' + dataset.price);


      $('#voucherMain .voucher-cover img').attr('src' , dataset.cover);
      $('#vt-title').text(dataset.title);
      $('#voucherMain .voucher-title .voucher-price').html('￥' + dataset.price);


      if(!cache[dataset.id]){
        cache[dataset.id] = $('#voucherMain').html();
        //todo 根据套餐ID 更新
      }
      $('#voucherMain').html(cache[dataset.id]);
    });


    //加入购物车弹窗
    var pop1 = new Popup($('#cartPopup'), {
      maskClose: true
    });

    $('.add-cart').on('click', function(event){
      var packageId = $('#packageOptions .button.active').data('id'),
              packageMoney = $('#packageOptions .button.active').data('price'),
              packageMax = $('#packageOptions .button.active').data('maxnum'),
              packageNum = parseInt($('#packageNum dd.active .step-number').val()),
              $this = $(this);

      event.preventDefault();

      //购物车
      if(vStore[packageId]){//已经存在的
        vouchers.add(packageId, Math.min(packageMax, vStore[packageId].num + packageNum))
      }else{
        vouchers.add(packageId, packageNum);
      }

      if($this.data('ajax')){ return  false }

      //打开一个加载器
      APP.showLoading();

      $this.data('ajax', true);
      $.ajax({
        url: '${ctx}/zzk/addBuyVoucher',
        dataType: 'json',
        type: 'post',
        data: {
          packageType: packageId,
          packageMoney: packageMoney,
          packageNum: packageNum
        }
      }).done(function(data){
        //关闭加载器
        APP.closeLoading();
        if(data.ret == 0){
          pop1.$popup.find('.cart-success').show().siblings().hide();
        }else{
          pop1.$popup.find('.cart-fail').show().siblings().hide();
        }
        pop1.show();
      }).always(function(){
        $this.data('ajax', null);
      });

      //关闭套餐选择器
      $('#voucherOption .select-main-close').trigger('click');

      // pop1.show();
    });

    //加购
    $('.go-buy-more').on('click', function(){
      //回退两页
      history.go(-2);
      //或者
      //window.location.href = '';
      //pop1.hide()
    });

    //去结算
    $('.go-check-out').on('click', function(){
      window.location.href = '${ctx}/zzk/cart';
      //pop1.hide()
    });
    //失败
    $('.go-check-fail').on('click', function(){
      // window.location.href = './cart.html';
      pop1.hide()
    });
  });
</script>
</body>
</html>