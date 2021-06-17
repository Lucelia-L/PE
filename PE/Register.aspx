<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PE.Register" Theme="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-main-all">
        <div class="register-main">
            <div class="register-main-left">
            </div>
            <div class="register-main-right">
                <div class="form-centent">
                    <div>
                        <div class="form-tile">注册</div>
                        <div class="form-main">
                            <div class="form-main-item">
                                <span>用户名</span>
                                <asp:TextBox ID="tb_username" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tb_username" runat="server" ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-main-item">
                                <span>密码</span>
                              

                                <asp:TextBox ID="tb_password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tb_password" runat="server" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-main-item">
                                <span>年龄</span>
                              
                                <asp:TextBox ID="tb_age" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-main-item">
                                <span>性别</span>
                                
                                <asp:DropDownList ID="ddl_sex" runat="server">
                                    <asp:ListItem>请选择性别</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                    <asp:ListItem>男</asp:ListItem>
                                </asp:DropDownList>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="ddl_sex" OnServerValidate="SexCustomValidator" ErrorMessage="请选择性别"></asp:CustomValidator>

                            </div>
                        </div>
                        <div class="registerBtn-div">
                            <asp:Button CssClass="registerBtn" ID="Button1" runat="server" Text="注册" OnClick="RegisterUser" UseSubmitBehavior="False"  />
                        </div>
                        <div class="gotoLogin-div">
                            <a href="Login.aspx">已注册？去登录</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
            </div>
    </form>
</body>
</html>
