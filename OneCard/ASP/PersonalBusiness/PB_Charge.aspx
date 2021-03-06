﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PB_Charge.aspx.cs" Inherits="ASP_PersonalBusiness_PB_Charge" %>

<%@ Register Src="../../CardReader.ascx" TagName="CardReader" TagPrefix="cr" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>充值</title>
    <link rel="stylesheet" type="text/css" href="../../css/frame.css" />
    <script type="text/javascript" src="../../js/print.js"></script>
    <link href="../../css/card.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function submitConfirm(checkednum) {

            if (true) {
                MyExtMsg('确认',
		         checkednum + '优惠票卡，请与顾客核实是否确认充值电子钱包。');
            }
            return false;
        }
        function choosePintPingZheng() {
            var chkPingzheng = document.getElementById('chkPingzheng');
            var chkPingzhengRemin = document.getElementById('chkPingzhengRemin');
            if (chkPingzheng.checked == false && chkPingzhengRemin.checked == false) {
                MyExtAlert("警告", "请选择打印方式后再打印！");
            }
            if (chkPingzheng.checked == true) {
                printdiv('ptnPingZheng1');
            }
            if (chkPingzhengRemin.checked == true) {
                printdiv('ptnPingZheng2');
            }
        }
        function chkPingZheng() {
            var chkPingzheng = document.getElementById('chkPingzheng');
            var chkPingzhengRemin = document.getElementById('chkPingzhengRemin');
            if (chkPingzheng.checked == true) {
                chkPingzhengRemin.checked = false;
            }
        }
        function chkPingZhengRemin() {
            var chkPingzheng = document.getElementById('chkPingzheng');
            var chkPingzhengRemin = document.getElementById('chkPingzhengRemin');
            if (chkPingzhengRemin.checked == true) {
                chkPingzheng.checked = false;
            }
        }
    </script>
</head>
<body>
    <cr:CardReader ID="cardReader" runat="server" />
    <form id="form1" runat="server">
    <div class="tb">
        个人业务->充值
    </div>
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager2" />
    <script type="text/javascript" language="javascript">
        var swpmIntance = Sys.WebForms.PageRequestManager.getInstance();
        swpmIntance.add_initializeRequest(BeginRequestHandler);
        swpmIntance.add_pageLoading(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
            try { MyExtShow('请等待', '正在提交后台处理中...'); } catch (ex) { }
        }
        function EndRequestHandler(sender, args) {
            try { MyExtHide(); } catch (ex) { }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <aspControls:PrintPingZheng ID="ptnPingZheng" runat="server" PrintArea="ptnPingZheng1" />
            <aspControls:PrintRMPingZheng ID="PrintRMPingZheng" runat="server" PrintArea="ptnPingZheng2" />
            <asp:BulletedList ID="bulMsgShow" runat="server">
            </asp:BulletedList>
            <script runat="server">public override void ErrorMsgShow() { ErrorMsgHelper(bulMsgShow); }</script>
            <div class="con">
                <div class="card">
                    卡片信息</div>
                <div class="kuang5">
                    <table width="95%" border="0" cellpadding="0" cellspacing="0" class="text20">
                        <tr>
                            <td width="9%">
                                <div align="right">
                                    用户卡号:</div>
                            </td>
                            <td width="13%">
                                <asp:TextBox ID="txtCardno" CssClass="labeltext" MaxLength="16" runat="server"></asp:TextBox>
                            </td>
                            <td width="9%">
                                <div align="right">
                                    卡序列号:</div>
                            </td>
                            <td width="13%">
                                <asp:TextBox ID="LabAsn" CssClass="labeltext" runat="server"></asp:TextBox>
                            </td>
                            <asp:HiddenField ID="hiddenAsn" runat="server" />
                            <td width="9%">
                                <div align="right">
                                    卡片类型:</div>
                            </td>
                            <td width="13%">
                                <asp:TextBox ID="LabCardtype" CssClass="labeltext" Width="100" runat="server"></asp:TextBox>
                            </td>
                            <asp:HiddenField ID="hiddenLabCardtype" runat="server" />
                            <td width="9%">
                                <div align="right">
                                    卡片状态:</div>
                            </td>
                            <td width="10%">
                                <asp:TextBox ID="RESSTATE" CssClass="labeltext" runat="server"></asp:TextBox>
                            </td>
                            <asp:HiddenField ID="hiddentxtCardno" runat="server" />
                            <asp:HiddenField ID="hiddentradeno" runat="server" />
                            <asp:HiddenField ID="hidWarning" runat="server" />
                            <asp:HiddenField runat="server" ID="hidSupplyMoney" />
                            <asp:HiddenField runat="server" ID="hiddenSupply" />
                            <asp:HiddenField ID="hidLockBlackCardFlag" runat="server" />
                            <asp:HiddenField runat="server" ID="hidCardnoForCheck" />
                            <td width="12%">
                                <asp:Button ID="btnReadCard" CssClass="button1" runat="server" Text="读卡" OnClientClick="return ReadCardInfo()"
                                    OnClick="btnReadCard_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    启用日期:</div>
                            </td>
                            <td>
                                <asp:TextBox ID="sDate" CssClass="labeltext" Width="100" runat="server" Text=""></asp:TextBox>
                            </td>
                            <asp:HiddenField ID="hiddensDate" runat="server" />
                            <td>
                                <div align="right" style="display: none">
                                    结束日期:</div>
                            </td>
                            <td>
                                <asp:TextBox ID="eDate" CssClass="labeltext" Visible="False" Width="100" runat="server" Text=""></asp:TextBox>
                            </td>
                            <asp:HiddenField ID="hiddeneDate" runat="server" />
                            <td>
                                <div align="right">
                                    卡内余额:</div>
                            </td>
                            <td>
                                <asp:TextBox ID="cMoney" CssClass="labeltext" Width="100" runat="server" Text=""></asp:TextBox>
                            </td>
                            <asp:HiddenField ID="hiddencMoney" runat="server" />
                            <asp:HiddenField ID="hidSupplyFee" runat="server" />
                            <asp:HiddenField ID="hidIsJiMing" runat="server" />
                            <asp:LinkButton runat="server" ID="btnConfirm" OnClick="btnConfirm_Click" />
                            <asp:HiddenField runat="server" ID="hidoutTradeid" />
                            <td>
                                <div align="right">
                                    售卡时间:</div>
                            </td>
                            <td>
                                <asp:TextBox ID="sellTime" CssClass="labeltext" Width="100" runat="server" Text=""></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    开通功能:</div>
                            </td>
                            <td colspan="7">
                                <aspControls:OpenFunc ID="openFunc" runat="server" />
                            </td>
                            <td width="12%">
                                <asp:Button ID="btnCheckRead" CssClass="button1" runat="server" Text="充值校验" OnClientClick="return readCardForCheck()" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="pip" style="display: none">
                    用户信息</div>
                <div class="kuang5" style="display: none">
                    <table width="95%" border="0" cellpadding="0" cellspacing="0" class="text20">
                        <tr>
                            <td width="9%">
                                <div align="right">
                                    用户姓名:</div>
                            </td>
                            <td width="13%">
                                <asp:Label ID="CustName" runat="server" Text=""></asp:Label>
                            </td>
                            <td width="9%">
                                <div align="right">
                                    出生日期:</div>
                            </td>
                            <td width="13%">
                                <asp:Label ID="CustBirthday" runat="server" Text=""></asp:Label>
                            </td>
                            <td width="9%">
                                <div align="right">
                                    证件类型:</div>
                            </td>
                            <td width="13%">
                                <asp:Label ID="Papertype" runat="server" Text=""></asp:Label>
                            </td>
                            <td width="9%">
                                <div align="right">
                                    证件号码:</div>
                            </td>
                            <td width="25%" colspan="3">
                                <asp:Label ID="Paperno" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    用户性别:</div>
                            </td>
                            <td>
                                <asp:Label ID="Custsex" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <div align="right">
                                    联系电话:</div>
                            </td>
                            <td>
                                <asp:Label ID="Custphone" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <div align="right">
                                    邮政编码:</div>
                            </td>
                            <td>
                                <asp:Label ID="Custpost" runat="server" Text=""></asp:Label>
                            </td>
                            <td>
                                <div align="right">
                                    联系地址:</div>
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Custaddr" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                电子邮件:
                            </td>
                            <td>
                                <asp:Label ID="txtEmail" runat="server" Text=""></asp:Label>
                            </td>
                            <td valign="top">
                                <div align="right">
                                    备注 :</div>
                            </td>
                            <td colspan="5">
                                <asp:Label ID="Remark" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="basicinfo">
                <div class="money">
                    费用信息</div>
                <div class="kuang5">
                    <table width="180" border="0" cellpadding="0" cellspacing="0" class="tab1">
                        <tr class="tabbt">
                            <td width="66">
                                费用项目
                            </td>
                            <td width="94">
                                费用金额(元)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                充值
                            </td>
                            <td>
                                <asp:Label ID="SupplyFee" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr class="tabjg">
                            <td>
                                其他费用
                            </td>
                            <td>
                                <asp:Label ID="OtherFee" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="tabjg">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="tabjg">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="tabjg">
                            <td>
                                合计应收
                            </td>
                            <td>
                                <asp:Label ID="Total" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="pipinfo">
                <div class="info">
                    充值信息</div>
                <div class="kuang5">
                    <div class="bigkuang">
                        <div class="left">
                            <img src="../../Images/show.JPG" alt="充值" /></div>
                        <div class="big">
                            <table width="300" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="150">
                                        请选择充值类型：
                                    </td>
                                    <td width="60">
                                        <asp:RadioButton ID="Cash" Visible="true" Checked="true" Text="现金" GroupName="SupplyMoney"
                                            TextAlign="Right" AutoPostBack="true" runat="server" OnCheckedChanged="Cash_CheckedChanged" />
                                    </td>
                                    <td width="80">
                                        <asp:RadioButton ID="XFCard" Visible="true" Checked="false" Text="充值卡" GroupName="SupplyMoney"
                                            TextAlign="Right" AutoPostBack="true" runat="server" OnCheckedChanged="Cash_CheckedChanged" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="150">
                                        请选择充值营销模式：
                                    </td>
                                    <td colspan="2" align="left">
                                        <asp:DropDownList ID="selChargeType" CssClass="inputmid" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="red" align="center">
                                        <asp:Label runat="server" ID="labPrompt" Text="请输入充值金额："></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <div align="center">
                                            <asp:TextBox ID="Money" CssClass="input" MaxLength="7" runat="server"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <script type="text/javascript">
                                    function setChargeValue(chargeVal) {
                                        $get('Money').value = chargeVal;
                                        changemoney($get('Money'));
                                        return false;
                                    }
                                </script>
                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:LinkButton runat="server" ID="charge50" Text="充50元" OnClientClick="return setChargeValue(50);"></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="charge60" Text="充60元" OnClientClick="return setChargeValue(60);"></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="charge100" Text="充100元" OnClientClick="return setChargeValue(100);"></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="charge82" Text="充82元" OnClientClick="return setChargeValue(82);"></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="charge64" Text="充64元" OnClientClick="return setChargeValue(64);"></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footall">
            </div>
            <div class="btns">
                <table width="200" border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Button ID="btnPrintPZ" runat="server" Text="打印凭证" CssClass="button1" Enabled="false"
                                OnClientClick="return choosePintPingZheng();" />
                        </td>
                        <td>
                            <asp:Button ID="btnSupply" CssClass="button1" runat="server" Text="充值" Enabled="false"
                                OnClientClick="return SupplyCheck()" />
                        </td>
                    </tr>
                </table>
                <asp:CheckBox ID="chkPingzheng" runat="server"  Text="针式打印凭证"  OnClick="return chkPingZheng();"/>
                <asp:CheckBox ID="chkPingzhengRemin" runat="server"  Text="热敏打印凭证"  OnClick="return chkPingZhengRemin();"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    <%--        <iframe name="idFrame" width="0" height="0" src="..\..\Tools\print\printArea.html"> 
    </iframe> --%>
</body>
</html>
