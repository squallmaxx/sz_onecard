﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FI_RCParksQuery.aspx.cs" Inherits="ASP_Financial_FI_RCParksQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>休闲景点刷卡统计</title>
    <link rel="stylesheet" type="text/css" href="../../css/frame.css" />
     <script type="text/javascript" src="../../js/print.js"></script>
     <script type="text/javascript" src="../../js/myext.js"></script>
    <link href="../../css/card.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="tb">
		    管理报表->休闲景点刷卡统计
	    </div>
         <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true" EnableScriptLocalization="true" ID="ToolkitScriptManager1" />
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

	           <div class="card">查询</div>
               <div class="kuang5">
               <table width="95%" border="0" cellpadding="0" cellspacing="0" class="text25">
                   <tr>
                        <td><div align="right">办卡期数:</div></td>
                        <td>
                        <asp:DropDownList ID="selDate" CssClass="inputmid" runat="server">
                        </asp:DropDownList>
                           
                        </td>
                        <td><div align="right">套餐:</div></td>
                        <td>
                           <asp:DropDownList ID="selType" CssClass="inputmid" runat="server">
                           
                        </asp:DropDownList>
                        </td>
                        
      
                        <td  align="right">
                            <asp:Button ID="Button1" CssClass="button1" runat="server" Text="查询" OnClick="btnQuery_Click"/>
                        </td>
                       
                   </tr>

               </table>
               
             </div>

            <table border="0" width="95%">
                <tr>
                    <td align="left"><div class="jieguo">查询结果</div></td>
                     <td align="right">
                     <asp:Button ID="btnExport" CssClass="button1" runat="server" Text="导出Excel" OnClick="btnExport_Click" />
                    </td>
                </tr>
            </table>
            
              <div id="printarea" class="kuang5">
                <div id="gdtbfix" style="height:380px;">
                    <table id="printReport" width ="95%">
                        <tr align="center">
                            <td style ="font-size:16px;font-weight:bold">休闲景点刷卡统计</td>
                        </tr>
                        <tr>
                            <td>
                                <table width="300px" align="right">
                                    <tr align="right">
                                        <td>办卡期数：<%=selDate.SelectedValue%></td>

                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="gvResult" runat="server"
                            Width = "100%"
                            CssClass="tab2"
                            HeaderStyle-CssClass="tabbt"
                            FooterStyle-CssClass="tabcon"
                            AlternatingRowStyle-CssClass="tabjg"
                            SelectedRowStyle-CssClass="tabsel"
                            PagerSettings-Mode="NumericFirstLast"
                            PagerStyle-HorizontalAlign="left"
                            PagerStyle-VerticalAlign="Top"
                            AutoGenerateColumns="true"
                             
                            ShowFooter="false" >
                    </asp:GridView>
                    
                </div>
              </div>
            </div>
   
            </ContentTemplate>
   <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
     
        </Triggers>
        </asp:UpdatePanel>
        

    </form>
</body>
</html>
