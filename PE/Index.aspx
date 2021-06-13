<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PE.Index" Theme="Index"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script>
        function changeTab(tabCon_num) {
            for (i = 0; i <= 2; i++) {
                document.getElementById("tabCon_" + i).style.display = "none"; //将所有的层都隐藏 
            }
            document.getElementById("tabCon_" + tabCon_num).style.display = "block";//显示当前层 
        }
        </script>
    <div>
        <div class="ad">
            <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="AdRotator.xml" />
        </div>

        <div class="tabs">
            <div class="tanContainer">
                <div class="tab">
                    <div class="tab-item" onclick="changeTab('0')">篮球</div>
                    <div class="tab-item" onclick="changeTab('1')">足球</div>
                    <div class="tab-item" onclick="changeTab('2')">乒乓球</div>
                </div>
                <div class="tabCon">
                    <div id="tabCon_0">
                     <div class="con0-item">
                         <div >
                             <img src="" />
                             
                         </div>
                         <div>
                             <div class="title"></div>
                             <div class="source"></div>
                         </div>
                     </div>   
                     </div>
                    <div id="tabCon_1">内容二</div>
                    <div id="tabCon_2">内容三</div>

                </div>
            </div>

        </div>
    </div>
</asp:Content>
