<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ins_Details.aspx.cs" Inherits="ADVANCEDBCW.Webforms.Ins_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
                <div>
                 <h1>Instructor Record in a Course</h1>
    <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT
    c.COURSE_ID,
    c.COURSE_TITLE,
    c.COURSE_DURATION,
    i.INSTRUCTOR_ID,
    i.INSTRUCTOR_NAME,
    i.INSTRUCTOR_DOB,
    i.INSTRUCTOR_CONTACTNO,
    i.INSTRUCTOR_EMAIL,
    i.INSTRUCTOR_COUNTRY
FROM
    COURSE c
JOIN
    INSTRUCTOR i ON c.COURSE_ID = i.COURSE_ID WHERE
    c.COURSE_ID = :COURSE

">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="COURSE" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" style="margin-bottom: 10px; height: 40px;">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,INSTRUCTOR_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="COURSE_DURATION" HeaderText="COURSE_DURATION" SortExpression="COURSE_DURATION" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                    <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                    <asp:BoundField DataField="INSTRUCTOR_DOB" HeaderText="INSTRUCTOR_DOB" SortExpression="INSTRUCTOR_DOB" />
                    <asp:BoundField DataField="INSTRUCTOR_CONTACTNO" HeaderText="INSTRUCTOR_CONTACTNO" SortExpression="INSTRUCTOR_CONTACTNO" />
                    <asp:BoundField DataField="INSTRUCTOR_EMAIL" HeaderText="INSTRUCTOR_EMAIL" SortExpression="INSTRUCTOR_EMAIL" />
                    <asp:BoundField DataField="INSTRUCTOR_COUNTRY" HeaderText="INSTRUCTOR_COUNTRY" SortExpression="INSTRUCTOR_COUNTRY" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
