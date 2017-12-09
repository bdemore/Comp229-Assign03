<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CoursePage.aspx.cs" Inherits="Comp229_Assign03.CoursePage" %>
<asp:Content ID="CoursePageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row table-header">
                <div class="col-sm-3"><span>Course Id</span></div>
                <div class="col-sm-3"><span>Title</span></div>
                <div class="col-sm-3"><span>Credits</span></div>
                <div class="col-sm-3"><span>Department</span></div>
            </div>
            <asp:Repeater ID="CourseRepeater" runat="server">
                <ItemTemplate>
                    <div class="row table-row-light">
                        <a href="CoursePage.aspx?coursePage=<%# Eval("Id") %>">
                            <div class="col-sm-3"><span><%# Eval("Id") %></span></div>
                            <div class="col-sm-3"><span><%# Eval("Title") %></span></div>
                            <div class="col-sm-3"><span><%# Eval("Credits") %></span></div>
                            <div class="col-sm-3"><span><%# Eval("Department.Name") %></span></div>
                        </a>
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <div class="row table-row-light-alternate">
                        <a href="CoursePage.aspx?coursePage=<%# Eval("Id") %>">
                            <div class="col-sm-3"><span><%# Eval("Id") %></span></div>
                            <div class="col-sm-3"><span><%# Eval("Title") %></span></div>
                            <div class="col-sm-3"><span><%# Eval("Credits") %></span></div>
                            <div class="col-sm-3"><span><%# Eval("Department.Name") %></span></div>
                        </a>
                    </div>
                </AlternatingItemTemplate>
            </asp:Repeater>
</asp:Content>
