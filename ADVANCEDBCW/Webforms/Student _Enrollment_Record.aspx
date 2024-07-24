<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student _Enrollment_Record.aspx.cs" Inherits="ADVANCEDBCW.Webforms.Student__Enrollment_Record" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
                 <h1>Student Enrollment Record</h1>
    <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT S.STUDENT_ID, STUDENT_NAME, STUDENT_CONTACTNO, STUDENT_COUNTRY, STUDENT_EMAIL, COURSE_TITLE, C.COURSE_ID, COURSE_DURATION, ENROL_DATE FROM STUDENT S JOIN ENROLLMENT E ON S.STUDENT_ID = E.STUDENT_ID JOIN COURSE C ON C.COURSE_ID = E.COURSE_ID WHERE S.STUDENT_ID = :STUDENT">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="STUDENT" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" style="margin-bottom: 10px; height: 40px;">
</asp:DropDownList>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
    <Columns>
        <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
        <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
        <asp:BoundField DataField="STUDENT_CONTACTNO" HeaderText="STUDENT_CONTACTNO" SortExpression="STUDENT_CONTACTNO" />
        <asp:BoundField DataField="STUDENT_COUNTRY" HeaderText="STUDENT_COUNTRY" SortExpression="STUDENT_COUNTRY" />
        <asp:BoundField DataField="STUDENT_EMAIL" HeaderText="STUDENT_EMAIL" SortExpression="STUDENT_EMAIL" />
        <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
        <asp:BoundField DataField="COURSE_DURATION" HeaderText="COURSE_DURATION" SortExpression="COURSE_DURATION" />
        <asp:BoundField DataField="ENROL_DATE" HeaderText="ENROL_DATE" SortExpression="ENROL_DATE" />
    </Columns>
</asp:GridView>

        </div>
    </form>
</body>
</html>


