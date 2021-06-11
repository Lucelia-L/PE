<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PE.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <asp:Label ID="Label3" runat="server" Text="注册"></asp:Label>
    <form id="form1" runat="server">



        <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>
        <input id="Text1" type="text" /></br>
  
         <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
        <input id="Password1" type="password" /><br />
        <input id="Submit1" type="submit" value="注册" />
    </form>

</body>
</html>
