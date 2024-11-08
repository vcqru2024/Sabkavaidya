<%@ page language="C#" autoeventwireup="true" inherits="Cross.Modules.CP_Product.View.Alipay_return_url, App_Web_alipay_return_url.aspx.87459c53" viewStateEncryptionMode="Always" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>支付宝页面跳转同步通知页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" class="Normal" align="center" runat="server" id="tblAfterPaid">
        <tr>
            <td>
                <asp:Label runat="server" ID="lblAlipayOrderStatus" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink runat="server" ID="hlContinueCheckout" ResourceKey="hlContinueCheckout"
                    Visible="false" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink runat="server" ID="hlViewProduct" ResourceKey="hlViewProduct" Visible="false" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink runat="server" ID="hlReturnAccount" ResourceKey="hlReturnAccount"
                    Visible="false" />
            </td>
        </tr>
    </table>
   </form>
</body>
</html>