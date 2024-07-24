<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instr_Details.aspx.cs" Inherits="ADVANCEDBCW.Webforms.Instr_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
                <div>
                 <h1> Instructor with 2 courses</h1>
                                <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,INSTRUCTOR_ID" DataSourceID="SqlDataSource1" EmptyDataText="Sorry, no instructors found for at least 2 courses." >
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                    <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                    <asp:BoundField DataField="INSTRUCTOR_DOB" HeaderText="INSTRUCTOR_DOB" SortExpression="INSTRUCTOR_DOB" />
                    <asp:BoundField DataField="INSTRUCTOR_CONTACTNO" HeaderText="INSTRUCTOR_CONTACTNO" SortExpression="INSTRUCTOR_CONTACTNO" />
                    <asp:BoundField DataField="INSTRUCTOR_EMAIL" HeaderText="INSTRUCTOR_EMAIL" SortExpression="INSTRUCTOR_EMAIL" />
                    <asp:BoundField DataField="INSTRUCTOR_COUNTRY" HeaderText="INSTRUCTOR_COUNTRY" SortExpression="INSTRUCTOR_COUNTRY" />
                </Columns>
                <EmptyDataTemplate>
                    <span><%# GridView1.EmptyDataText %></span>
                </EmptyDataTemplate>
            </asp:GridView>

            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID">
            </asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT
    c.COURSE_ID,
    c.COURSE_TITLE,
    i.INSTRUCTOR_ID,
    i.INSTRUCTOR_NAME,
    i.INSTRUCTOR_DOB,
    i.INSTRUCTOR_CONTACTNO,
    i.INSTRUCTOR_EMAIL,
    i.INSTRUCTOR_COUNTRY
FROM
    instructor i
JOIN
    course c ON i.COURSE_ID = c.COURSE_ID
WHERE
    i.INSTRUCTOR_ID IN (
        SELECT
            INSTRUCTOR_ID
        FROM
            instructor
        GROUP BY
            INSTRUCTOR_ID
        HAVING
            COUNT(DISTINCT COURSE_ID) &gt;= 2
    )
"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
