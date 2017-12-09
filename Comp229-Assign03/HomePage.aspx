<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Comp229_Assign03.HomePage" %>
<asp:Content ID="HomePageContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row table-header">
            <div class="col-sm-3"><span>Student Id</span></div>
            <div class="col-sm-3"><span>First Name</span></div>
            <div class="col-sm-3"><span>Last Name</span></div>
            <div class="col-sm-3"><span>Enrollment Date</span></div>
        </div>
        <asp:Repeater ID="StudentsRepeater" runat="server">
            <ItemTemplate>
                <div class="row table-row-light">
                    <a href="StudentPage.aspx?student=<%# Eval("Id") %>">
                        <div class="col-sm-3"><span><%# Eval("Id") %></span></div>
                        <div class="col-sm-3"><span><%# Eval("FirstName") %></span></div>
                        <div class="col-sm-3"><span><%# Eval("LastName") %></span></div>
                        <div class="col-sm-3"><span><%# Eval("EnrollmentDate") %></span></div>
                    </a>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div class="row table-row-light-alternate">
                    <a href="StudentPage.aspx?student=<%# Eval("Id") %>">
                        <div class="col-sm-3"><span><%# Eval("Id") %></span></div>
                        <div class="col-sm-3"><span><%# Eval("FirstName") %></span></div>
                        <div class="col-sm-3"><span><%# Eval("LastName") %></span></div>
                        <div class="col-sm-3"><span><%# Eval("EnrollmentDate") %></span></div>
                    </a>
                </div>
            </AlternatingItemTemplate>
        </asp:Repeater> 
</asp:Content>
