﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TM;
using System.Collections.Generic;

// 吴江旅游年卡年卡开通返销处理
public partial class ASP_AddtionalService_AS_TravelCardNewRollback : Master.FrontMaster
{
    // 页面装载
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;

        if (!context.s_Debugging) txtCardNo.Attributes["readonly"] = "true";

    }

    // 读取客户信息
    private void readCustInfo()
    {
        DataTable data = ASHelper.callQuery(context, "QueryCustInfo", txtCardNo.Text);
        if (data.Rows.Count == 0)
        {
            context.AddError("A00501A002: 无法读取卡片客户资料");
            return;
        }

        //add by jiangbb 解密
        CommonHelper.AESDeEncrypt(data, new List<string>(new string[] { "CUSTNAME", "CUSTPHONE", "CUSTADDR", "PAPERNO" }));

        Object[] row = data.Rows[0].ItemArray;

        txtCustName.Text = ASHelper.getCellValue(row[0]);
        string paperType = (ASHelper.getCellValue(row[2])).Trim();
        selPaperType.Text = "";
        txtPaperNo.Text = ASHelper.getCellValue(row[3]);

        data = ASHelper.callQuery(context, "ReadPaperName", paperType);
        if (data.Rows.Count > 0)
        {
            selPaperType.Text = (string)data.Rows[0].ItemArray[0];
        }
    }

    // 读卡处理
    protected void btnReadCard_Click(object sender, EventArgs e)
    {
        btnPrintPZ.Enabled = false;

        hidSeqNo.Value = "";
        labTradeTime.Text = "";
        labFee.Text = "";
        labTradeType.Text = "";

        //卡账户有效性检验

        checkAccountInfo(txtCardNo.Text);
        if (context.hasError()) return;

        readCustInfo();

        //add by jiangbb 2012-10-15 客户信息隐藏显示 201015：客户信息查看权
        if (!CommonHelper.HasOperPower(context))
        {
            txtPaperNo.Text = CommonHelper.GetPaperNo(txtPaperNo.Text);
        }

        context.SPOpen();
        context.AddField("p_ID");
        context.AddField("p_cardNo").Value = txtCardNo.Text;
        context.AddField("p_cardTradeNo");
        context.AddField("p_asn");
        context.AddField("p_operCardNo");
        context.AddField("p_terminalNo");
        context.AddField("p_oldEndDateNum").Value = hidParkInfo.Value;
        context.AddField("p_endDateNum", "string", "output", "12");
        context.AddField("p_cancelTradeId", "string", "inputoutput", "16");
        context.AddField("p_option").Value = "2";
        bool ok = context.ExecuteSP("SP_AS_TravelCardNewRollback");
        if (!ok) return;

        hidSeqNo.Value = "" + context.GetField("p_cancelTradeId").Value;

        DataTable data = ASHelper.callQuery(context, "ReadNewTradeBySeqNo", hidSeqNo.Value);
        Object[] row = data.Rows[0].ItemArray;

        DataTable data2 = ASHelper.callQuery(context, "ReadTradeTypeName", (string)row[1]);
        if (data2.Rows.Count > 0)
        {
            labTradeType.Text = "" + data2.Rows[0].ItemArray[0];
        }
        else
        {
            labTradeType.Text = "" + row[1];
        }

        labTradeTime.Text = "" + row[2];

        // 应退费用
        DataTable data3 = ASHelper.callQuery(context, "ReadTradeFee", hidSeqNo.Value);
        decimal deposit = 0, cardCost = 0, otherFee = 0, funcFee = 0;

        if (data3.Rows.Count > 0)
        {
            deposit = (decimal)data3.Rows[0].ItemArray[0];
            cardCost = (decimal)data3.Rows[0].ItemArray[1];
            otherFee = (decimal)data3.Rows[0].ItemArray[2];
            funcFee = (decimal)data3.Rows[0].ItemArray[3];
        }
        labFee.Text = "押金(" + deposit + ") + 卡费(" + cardCost 
            + ") + 功能费( " + funcFee + ") + 其它费用(" + otherFee
            + ") = 总共(" + (deposit + cardCost + funcFee + otherFee) + ")元";

        hidAccRecv.Value = "-" + (deposit + cardCost + funcFee + otherFee).ToString("n");

        btnSubmit.Enabled = !context.hasError();
    }

    // 确认对话框确认处理


    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        if (hidWarning.Value == "writeSuccess") // 写卡成功
        {
            AddMessage("吴江旅游年卡开通返销成功");
        }
        else if (hidWarning.Value == "writeFail") // 写卡失败
        {
            context.AddError("A00514C001: 写卡失败");
        }
        if (chkPingzheng.Checked && btnPrintPZ.Enabled)
        {
            ScriptManager.RegisterStartupScript(
                this, this.GetType(), "writeCardScript",
                "printInvoice();", true);
        }

        hidWarning.Value = ""; // 清除警告信息
    }

    // 售卡/补卡返销
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        context.SPOpen();
        context.AddField("p_ID").Value = DealString.GetRecordID(hidTradeNo.Value, hidAsn.Value);
        context.AddField("p_cardNo").Value = txtCardNo.Text;
        context.AddField("p_cardTradeNo").Value = hidTradeNo.Value;
        context.AddField("p_asn").Value = hidAsn.Value.Substring(4, 16);
        context.AddField("p_operCardNo").Value = context.s_CardID;
        context.AddField("p_terminalNo").Value = "112233445566";
        context.AddField("p_oldEndDateNum").Value = hidParkInfo.Value;
        context.AddField("p_endDateNum", "string", "output", "12");
        context.AddField("p_cancelTradeId", "string", "inputoutput", "16").Value = hidSeqNo.Value;
        context.AddField("p_option").Value = "0";
        bool ok = context.ExecuteSP("SP_AS_TravelCardNewRollback");
        btnSubmit.Enabled = false;

        // 执行成功，显示成功消息

        if (ok)
        {
            hidParkInfo.Value = "" + context.GetField("p_endDateNum").Value;

            ScriptManager.RegisterStartupScript(
                this, this.GetType(), "writeCardScript",
                "startWjLvyou();", true);
            btnPrintPZ.Enabled = true;

            ASHelper.preparePingZheng(ptnPingZheng, txtCardNo.Text, txtCustName.Text, "吴江旅游年卡开通返销", "0.00"
                , "0.00", "", txtPaperNo.Text, "0.00", "0.00", hidAccRecv.Value, context.s_UserID,
                context.s_DepartName,
                txtPaperNo.Text, "0.00", hidAccRecv.Value);
        }

    }
}
