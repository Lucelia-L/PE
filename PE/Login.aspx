<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PE.Login" Theme="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-main-all">
            <div class="login-main">
                <div class="login-main-left">
                </div>
                <div class="login-main-right">
                    <div class="form-centent">
                        <div>
                            <div class="form-tile">登录</div>
                            <div class="form-main">
                                <div class="form-main-item">
                                    <span>用户名</span>
                                    <asp:TextBox ID="tb_username" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tb_username" 
                                        runat="server" ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-main-item">
                                    <span>密码</span>
                                    <asp:TextBox ID="tb_password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tb_password" 
                                        runat="server" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="loginBtn-div">
                                <asp:Button CssClass="loginBtn" ID="Button1" runat="server" Text="登录" 
                                    UseSubmitBehavior="False" OnClick="LoginUser" />
                            </div>
                            <div class="gotoRegister-div">
                                <a href="Register.aspx">没有账号？去注册</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="myright">Lucelia</div>
        </div>
    </form>
</body>
</html>
