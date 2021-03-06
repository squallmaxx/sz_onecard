﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CG_CashGiftChange.aspx.cs" Inherits="ASP_CashGift_CG_CashGiftChange" %>
<%@ Register Src="../../CardReader.ascx" TagName="CardReader" TagPrefix="cr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>利金卡换卡</title>
    <link rel="stylesheet" type="text/css" href="../../css/frame.css" />
    <script type="text/javascript" src="../../js/print.js"></script>
    <link href="../../css/card.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function assignGiftFunc(cardNoId, cardInfo) 
        {
            assignValue('hiddenCardno', cardInfo.cardNo);
            assignValue('hiddenASn', cardInfo.appSn);
            assignValue('hiddensDate', cardInfo.appStartDate);
            assignValue('hiddeneDate', cardInfo.appEndDate);
            assignValue('hiddencMoney', cardInfo.balance );
            assignValue('hiddenWallet2', (cardInfo.wallet2 / 100).toFixed(2));
            assignValue('hiddentradeno', cardInfo.tradeNo);
        }

        function readOldCashCard() {
            assignValue('txtCardNo', $get('txtOCardno').value);
            return ReadCashGiftInfo(assignGiftFunc);
        }

        function readNewCashCard() {
            assignValue('txtCardNo', $get('txtNCardno').value);
            return ReadCashGiftInfo(assignGiftFunc);
        }
       
    </script>
</head>
<body>
	<cr:CardReader id="cardReader" runat="server" />    

    <form id="form1" runat="server">
<div class="tb">
利金卡->换卡
</div>
<ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true" ID="ScriptManager2" />
          <script type="text/javascript" language="javascript">
                var swpmIntance = Sys.WebForms.PageRequestManager.getInstance();
                swpmIntance.add_initializeRequest(BeginRequestHandler);
                swpmIntance.add_pageLoading(EndRequestHandler);
				function BeginRequestHandler(sender, args){
				try {MyExtShow('请等待', '正在提交后台处理中...'); } catch(ex){}
				}
				function EndRequestHandler(sender, args) {
				try {MyExtHide(); } catch(ex){}
				}
          </script>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <aspControls:PrintShouJu ID="ptnShouJu" runat="server" PrintArea="ptnShouJu1" />
            <aspControls:PrintPingZheng ID="ptnPingZheng" runat="server" PrintArea="ptnPingZheng1" />
    <asp:BulletedList ID="bulMsgShow" runat="server">
    </asp:BulletedList>
    <script runat="server" >public override void ErrorMsgShow(){ErrorMsgHelper(bulMsgShow);}</script>       
<div class="con">
  <div class="card">旧卡信息</div>
  <div class="kuang5">
 <table width="95%" border="0" cellpadding="0" cellspacing="0" class="text20">
  <tr>
    <td width="10%"><div align="right">旧卡卡号:</div></td>
    <td width="13%"><asp:TextBox ID="txtOCardno" CssClass="labeltext" maxlength="16" runat="server"></asp:TextBox></td>
    <td width="9%"><div align="right">钱包1:</div></td>
    <td width="12%"><asp:TextBox ID="OldcMoney" CssClass="labeltext" runat="server"></asp:TextBox></td>
    <td width="9%"><div align="right">换卡类型:</div></td>
    <td width="22%"><asp:DropDownList ID="selReasonType" AutoPostBack="true" OnSelectedIndexChanged="selReasonType_SelectedIndexChanged" runat="server"></asp:DropDownList></td>
    <td width="11%"><asp:Button ID="btnReadCard" CssClass="button1" runat="server" Text="读卡" 
        OnClientClick="return readOldCashCard()"  OnClick="btnReadCard_Click" /></td>
    <td width="14%">
    <asp:Button ID="btnDBRead" CssClass="button1" Enabled="false" runat="server" Text="读数据库"
    	  OnClientClick="return warnCheck()" /></td>
  </tr>
  <tr>
    <td><div align="right">结束日期:</div></td>
    <td><asp:TextBox ID="OsDate" CssClass="labeltext" runat="server" Text=""></asp:TextBox></td>
    <td><div align="right">钱包2:</div></td>
    <td><asp:TextBox ID="ODeposit" CssClass="labeltext" runat="server" Text=""></asp:TextBox></td>
    <td><div align="right">卡片状态:</div></td>
    <td><asp:TextBox ID="RESSTATE" CssClass="labeltext" runat="server"></asp:TextBox></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    </tr>
</table>

 </div>
  <div class="card">新卡信息</div>
  <div class="kuang5">
 <table width="95%" border="0" cellpadding="0" cellspacing="0" class="text20">
   <tr>
     <td width="9%"><div align="right">新卡卡号:</div></td>
     <td width="13%"><asp:TextBox ID="txtNCardno" CssClass="labeltext"  maxlength="16" runat="server"></asp:TextBox></td>
     <td width="9%"><div align="right">卡钱包1:</div></td>
     <td width="13%"><asp:TextBox ID="NewcMoney" CssClass="labeltext" runat="server"></asp:TextBox></td>
     <td width="9%"><div align="right">新卡状态:</div></td>
     <td width="13%"><asp:TextBox ID="LabRESSTATE" CssClass="labeltext" runat="server"></asp:TextBox></td>
     <td width="9%">&nbsp;</td>
     <td width="25%"><asp:Button ID="btnReadNCard" CssClass="button1" Enabled="false" runat="server" Text="读新卡" 
        OnClientClick="return readNewCashCard()" OnClick="btnReadNCard_Click" /></td>
   </tr>
   <tr>
     <td><div align="right">卡结束日期:</div></td>
     <td><asp:TextBox ID="NsDate" CssClass="labeltext" runat="server" Text=""></asp:TextBox></td>
     <td><div align="right">卡钱包2:</div></td>
     <td><asp:TextBox ID="NDeposit" CssClass="labeltext" runat="server" Text=""></asp:TextBox></td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
   </tr>
   
   <asp:HiddenField ID="txtCardNo" runat="server" />
   
   <asp:HiddenField ID="hiddenCardno" runat="server" />
   <asp:HiddenField ID="hiddenASn" runat="server" />
   <asp:HiddenField ID="hiddenLabCardtype" runat="server" />
   <asp:HiddenField ID="hiddensDate" runat="server" />
   <asp:HiddenField ID="hiddeneDate" runat="server" />
   <asp:HiddenField ID="hiddencMoney" runat="server" />
   <asp:HiddenField ID="hiddenWallet2" runat="server" />
   <asp:HiddenField ID="hiddentradeno" runat="server" />
   <asp:HiddenField ID="hiddenDepositFee" runat="server" />
   <asp:HiddenField ID="hiddenCardcostFee" runat="server" />
   <asp:HiddenField ID="hidProcedureFee" runat="server" />
   <asp:HiddenField ID="hidOtherFee" runat="server" />
   <asp:HiddenField ID="hidCardprice" runat="server" />
   <asp:HiddenField ID="hidAccRecv" runat="server" />
   <asp:HiddenField ID="CUSTRECTYPECODE" runat="server" />
   <asp:HiddenField ID="SERSTARTIME" runat="server" />
   <asp:HiddenField ID="OSERVICEMOENY" runat="server" />
   <asp:HiddenField ID="SERTAKETAG" runat="server" />
   <asp:HiddenField ID="hiddenCheck" runat="server" />
   <asp:HiddenField ID="hidWarning" runat="server" />
   <asp:HiddenField ID="hiddenverify" runat="server" />
   <asp:HiddenField ID="hidSupplyMoney" runat="server" />
   <asp:HiddenField ID="hidPapertype" runat="server" />
   <asp:HiddenField ID="hidCustname" runat="server" />
   <asp:HiddenField ID="hidPaperno" runat="server" />
   <asp:HiddenField ID="hidOldCardcost" runat="server" />
   <asp:HiddenField ID="hidLockFlag" runat="server" />
   <asp:HiddenField runat="server" ID="hidCardnoForCheck" />
   <asp:LinkButton runat="server" ID="btnConfirm" OnClick="btnConfirm_Click"/>
 </table>
 </div>
</div>
 <div class="basicinfo">
 <div class="money">费用信息</div>
 <div class="kuang5">
     <table width="180" border="0" cellpadding="0" cellspacing="0" class="tab1">
  <tr class="tabbt">
    <td width="66">费用项目</td>
    <td width="94">费用金额(元)</td>
    </tr>
  <tr>
    <td>押金</td>
    <td><asp:Label ID="DepositFee" runat="server" Text=""></asp:Label></td>
    </tr>
  <tr class="tabjg">
    <td>卡费</td>
    <td><asp:Label ID="CardcostFee" runat="server" Text=""></asp:Label></td>
    </tr>
  <tr>
    <td>手续费</td>
    <td><asp:Label ID="ProcedureFee" runat="server" Text=""></asp:Label></td>
  </tr>
  <tr class="tabjg">
    <td>其他费用</td>
    <td><asp:Label ID="OtherFee" runat="server" Text=""></asp:Label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tabjg">
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tabjg">
    <td>合计应收</td>
    <td><asp:Label ID="Total" runat="server" Text=""></asp:Label></td>
  </tr>
</table>
 </div>
 </div>
 <div class="pipinfo">
 <div class="info">换卡信息</div>
 <div class="kuang5">
 <div class="bigkuang">
 <div class="left">
 <img src="../../Images/show-change.JPG" /></div>
  <div class="big">
    <table width="200" border="0" cellpadding="0" cellspacing="0" class="text25">
      <tr>
      </tr>
      <tr>
        <td width="80"><label>本次实收</label></td>
        <td width="80"><asp:TextBox ID="txtRealRecv" CssClass="inputshort"  maxlength="7" runat="server"></asp:TextBox></td>
      </tr>
      <tr>
        <td>本次应找</td>
        <td><div id="test">0.00</div></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </table>
  </div>
  </div>
 </div>
</div>
 <div class="footall"></div>
  <div class="btns">
     <table width="300" border="0" align="right" cellpadding="0" cellspacing="0">
  <tr>
    <td><asp:Button ID="btnPrintPZ" runat="server" Text="打印凭证" CssClass="button1" Enabled="false"  
                OnClientClick="printdiv('ptnPingZheng1')" /></td>
    <td><asp:Button ID="btnPrintSJ" runat="server" Text="打印收据" 
        CssClass="button1" Enabled="false" OnClientClick="printdiv('ptnShouJu1')"/></td>
    <td><asp:Button ID="Change" CssClass="button1" runat="server" Text="换卡" OnClick="Change_Click" /></td>
  </tr>
</table>

<asp:CheckBox ID="chkPingzheng" runat="server" Checked="true" />自动打印凭证
<asp:CheckBox ID="chkShouju" runat="server" />自动打印收据
</div>
            </ContentTemplate>          
        </asp:UpdatePanel>
    </form>
</body>
</html>