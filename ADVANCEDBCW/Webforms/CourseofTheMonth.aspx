<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseofTheMonth.aspx.cs" Inherits="ADVANCEDBCW.Webforms.CourseofTheMonth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container ma-12">
        <div>
            <h2>Course of The Month
            </h2>
        </div>
        <div style="display: flex; margin-bottom: 10px;">
            <asp:TextBox ID="yearTextbox" runat="server" CssClass="form-control" Width="287px" style="margin-right: 10px"></asp:TextBox>
            <asp:DropDownList ID="monthDropDown" runat="server" style="margin-right: 10px"></asp:DropDownList>
            <asp:Button ID="searchButton" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="SearchBtn_Click" class="mr-8"/>
        </div>
        <div>
            <asp:GridView ID="CourseofTheMonthGV" runat="server" Width="1020px" CssClass="table" EmptyDataText="No Record Has Been Added!" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="Vertical" DataKeyNames="COURSE_ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE" ReadOnly="True" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="VOTES_COUNT" HeaderText="No. of Votes" ReadOnly="True" SortExpression="VOTES_COUNT" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#f7f7f7" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>

        </div>
    </div>

    </form>
</body>
</html>
