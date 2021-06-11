<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PE.Index" 
    Theme="Index"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="nav-menu">
                    <a href="index.html" class="nav-link">Home</a>
                    <a href="#" class="nav-link">Tags</a>
                    <a href="archives.html" class="nav-link">Archives</a>
                    <a href="about.html" class="nav-link">About</a>
                </div>

    </div>

        <asp:AdRotator ID="AdRotator1" runat="server" />
    </form>

</body>
</html>
