<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="PE.Game" Theme="Game" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="game-main-all">
        <div class="game-main">
            <div class="tabs">
                <ul>
                    <li class="active">热门</li>
                    <li>足球</li>
                    <li>篮球</li>
                </ul>
            </div>
            <div class="container">
                <div id="tabCon_0">
                    <div class="tab-main">
                       
                    </div>
                </div>
                <div id="tabCon_1">
                    <div class="tab-main">
                        
                       
                    </div>
                </div>
                <div id="tabCon_2">
                    <div class="tab-main">
                        
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script>
        $(".active").addClass("bg");
        document.getElementById("tabCon_0").style.display = "block";//显示第一个
        $(".tabs ul li").click(function () {
            var j = $(this).index();
            console.log(j);
            $(this).addClass("bg").siblings().removeClass("bg");
            for (i = 0; i <= 2; i++) {
                document.getElementById("tabCon_" + i).style.display = "none"; //将所有的层都隐藏 
            }
            document.getElementById("tabCon_" + j).style.display = "block";//显示当前层    
        });
    </script>
</asp:Content>
