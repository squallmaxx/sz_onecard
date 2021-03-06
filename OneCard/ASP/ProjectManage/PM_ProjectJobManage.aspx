﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PM_ProjectJobManage.aspx.cs" Inherits="ASP_ProjectManage_PM_ProjectJobManage"
 EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>项目计划管理</title>
    <link rel="stylesheet" type="text/css" href="../../css/frame.css" />
    <script type="text/javascript" src="../../js/myext.js"></script>
    <link href="../../css/card.css" rel="stylesheet" type="text/css" />
</head>
<body>
     <form id="form1" runat="server">
    <div class="tb">
        项目管理->项目计划管理
    </div>
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ToolkitScriptManager1" />
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
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <!-- #include file="../../ErrorMsg.inc" -->
            <div class="con">
                <div class="card">
                    查询</div>
                <div class="kuang5">
                    <table width="95%" border="0" cellpadding="0" cellspacing="0" class="text25">
                        <tr>
                            <td width="15%">
                                <div align="right">
                                    项目名称:</div>
                            </td>
                            <td width="15%">
                                <asp:DropDownList ID="ddlPROJECTNAME" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td width="15%">
                                <div align="right">
                                    起始日期:</div>
                            </td>
                            <td width="15%">
                                <ajaxToolkit:CalendarExtender ID="BeginCalendar" runat="server" TargetControlID="selStartDate"
                                    Format="yyyyMMdd" PopupPosition="BottomLeft" />
                                <asp:TextBox ID="selStartDate" runat="server" CssClass="input" MaxLength="8"></asp:TextBox>
                            </td>
                            <td width="15%">
                                <div align="right">
                                    结束日期:</div>
                            </td>
                            <td width="15%">
                                <asp:TextBox ID="selEndDate" runat="server" CssClass="input" MaxLength="8"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="selEndDate"
                                    Format="yyyyMMdd" PopupPosition="BottomLeft" />
                            </td>
                            <td width="15%">
                            </td>
                            <td width="15%" align="right">
                                <asp:Button ID="btnQuery" CssClass="button1" runat="server" Text="查询" OnClick="btnQuery_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <table border="0" width="95%">
                    <tr>
                        <td align="left">
                            <div class="jieguo">
                                项目信息</div>
                        </td>
                    </tr>
                </table>
                <div class="kuang5">
                    <asp:GridView ID="gvResult" runat="server" Width="95%" CssClass="tab1" HeaderStyle-CssClass="tabbt"
                        FooterStyle-CssClass="tabcon" AlternatingRowStyle-CssClass="tabjg" SelectedRowStyle-CssClass="tabsel"
                        PagerSettings-Mode="NumericFirstLast" PagerStyle-HorizontalAlign="left" PagerStyle-VerticalAlign="Top"
                        AutoGenerateColumns="true" OnRowDataBound="gvResult_RowDataBound" OnSelectedIndexChanged="gvResult_SelectedIndexChanged"
                        OnRowCreated="gvResult_RowCreated">
                        <EmptyDataTemplate>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tab1">
                                <tr class="tabbt">
                                    <td>
                                        项目编号
                                    </td>
                                    <td>
                                        项目名称
                                    </td>
                                    <td>
                                        项目开始日期
                                    </td>
                                    <td>
                                        项目概况
                                    </td>
                                    <td>
                                        更新员工
                                    </td>
                                    <td>
                                        更新时间
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                <table border="0" width="95%">
                    <tr>
                        <td align="left">
                            <div class="jieguo">
                                项目计划</div>
                        </td>
                    </tr>
                </table>
                <div class="kuang5">
                    <asp:GridView ID="gvResultJob" runat="server" Width="95%" CssClass="tab1" HeaderStyle-CssClass="tabbt"
                        FooterStyle-CssClass="tabcon" AlternatingRowStyle-CssClass="tabjg" SelectedRowStyle-CssClass="tabsel"
                        PagerSettings-Mode="NumericFirstLast" PagerStyle-HorizontalAlign="left" PagerStyle-VerticalAlign="Top"
                        AutoGenerateColumns="true" OnRowDataBound="gvResultJob_RowDataBound" OnSelectedIndexChanged="gvResultJob_SelectedIndexChanged"
                        OnRowCreated="gvResultJob_RowCreated">
                        <EmptyDataTemplate>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tab1">
                                <tr class="tabbt">
                                    <td>
                                        计划编号
                                    </td>
                                    <td>
                                        计划说明
                                    </td>
                                    <td>
                                        预计完成日期
                                    </td>
                                    <td>
                                        计划执行人
                                    </td>
                                    <td>
                                        实际情况描述
                                    </td>
                                    <td>
                                        实际完成日期
                                    </td>
                                    <td>
                                        更新员工
                                    </td>
                                    <td>
                                        更新时间
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                <div class="card">
                    项目计划明细</div>
                <div class="kuang5">
                    <table width="95%" border="0" cellpadding="0" cellspacing="0" class="text25">
                        <tr>
                            <td width="12%">
                                <div align="right">
                                    项目名称:</div>
                            </td>
                            <td width="36%">
                                <asp:Label ID="txtPROJECTNAME" runat="server" Text=""></asp:Label>
                            </td>
                            <td width="12%">
                                <div align="right">
                                    预期完成日期：</div>
                            </td>
                            <td width="36%">
                                <asp:TextBox ID="txtEXPECTEDDATE" CssClass="input" runat="server" MaxLength="8"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEXPECTEDDATE"
                                    Format="yyyyMMdd" PopupPosition="BottomLeft" />
                                <span class="red">*</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    计划说明:</div>
                            </td>
                            <td width="36%">
                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtJOBDESC" CssClass="inputlong"
                                    Width="313px" Height="60px" MaxLength="500" />
                                <asp:HiddenField ID="hidePROJECTCODE" runat="server" />
                                <asp:HiddenField ID="hideJOBCODE" runat="server" />
                            </td>
                            <td width="12%">
                             <div align="right">
                                    计划执行人:</div>
                            </td>
                            <td width="36%">
                                <asp:DropDownList ID="selDept" CssClass="inputmid" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="selDept_Changed">
                               </asp:DropDownList>
                                <asp:DropDownList ID="selStaff" CssClass="inputmid" runat="server">
                               </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="btns">
                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="12%">
                        </td>
                        <td width="12%">
                        </td>
                        <td width="12%">
                        </td>
                        <td width="12%">
                        </td>
                        <td width="36%" align="right">
                            <asp:Button ID="btnAdd" Enabled="true" CssClass="button1" runat="server" Text="添加"
                                OnClick="btnAdd_Click" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnModify" Enabled="true" CssClass="button1" runat="server" Text="修改"
                                OnClick="btnModify_Click" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCancel" Enabled="true" CssClass="button1" runat="server" Text="删除"
                                OnClick="btnCancel_Click" />
                        </td>
                        <td width="12%">
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
