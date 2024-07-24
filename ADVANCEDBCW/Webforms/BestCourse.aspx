<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BestCourse.aspx.cs" Inherits="ADVANCEDBCW.BestCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Best E-Learning Course</h1>
                                <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ENROL_YEAR" DataValueField="ENROL_YEAR" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" style="margin-bottom: 10px; height: 40px;width: 150px;">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="month" DataTextField="ENROL_MONTH" DataValueField="ENROL_MONTH" style="margin-bottom: 10px; height: 40px;width: 150px;">
        </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM ( SELECT c.course_title, COUNT(*) AS enrollment_count
FROM course c
JOIN enrollment e ON c.course_id = e.course_id
WHERE (e.enrol_month = :enrol_month AND e.enrol_year = :enrol_year)
GROUP BY c.course_title
ORDER BY enrollment_count DESC )
WHERE ROWNUM &lt;= 3">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="enrol_month" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList2" Name="enrol_year" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="month" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT enrol_month FROM enrollment WHERE enrol_year = :enrol_year">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList2" Name="enrol_year" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT ENROL_YEAR FROM ENROLLMENT"></asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
