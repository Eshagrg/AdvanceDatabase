<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnrollStudent.aspx.cs" Inherits="ADVANCEDBCW.Webforms.EnrollStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
                <div>
             <h1>Enrollment Information</h1>
                    <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1"
    CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White" EmptyDataText="Sorry, no student is enrolled in this date.">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION" />
        <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
        <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
        <asp:BoundField DataField="ENROL_MONTH" HeaderText="ENROL_MONTH" SortExpression="ENROL_MONTH" />
        <asp:BoundField DataField="ENROL_YEAR" HeaderText="ENROL_YEAR" SortExpression="ENROL_YEAR" />
         <asp:TemplateField HeaderText="STUDENT_NAME">
     <ItemTemplate>
         <asp:DropDownList Enabled="False" ID="DropDownList3" runat="server" DataSourceID="stdname" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
         </asp:DropDownList>
         <asp:SqlDataSource ID="stdname" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
     </ItemTemplate>
           
 </asp:TemplateField>
 <asp:TemplateField HeaderText="COURSE_TITLE">
     <ItemTemplate>
         <asp:DropDownList Enabled="False" ID="DropDownList4" runat="server" DataSourceID="cname" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
         </asp:DropDownList>
         <asp:SqlDataSource ID="cname" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
     </ItemTemplate>
 </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
    <span><%# GridView1.EmptyDataText %></span>
</EmptyDataTemplate>
</asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;ENROL_MONTH&quot;, &quot;ENROL_YEAR&quot; FROM &quot;ENROLLMENT&quot;" DeleteCommand="DELETE FROM &quot;ENROLLMENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;ENROLLMENT&quot; (&quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;ENROL_MONTH&quot;, &quot;ENROL_YEAR&quot;) VALUES (:STUDENT_ID, :COURSE_ID, :ENROL_MONTH, :ENROL_YEAR)" UpdateCommand="UPDATE &quot;ENROLLMENT&quot; SET &quot;ENROL_MONTH&quot; = :ENROL_MONTH, &quot;ENROL_YEAR&quot; = :ENROL_YEAR WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                    <asp:Parameter Name="ENROL_MONTH" Type="String" />
                    <asp:Parameter Name="ENROL_YEAR" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ENROL_MONTH" Type="String" />
                    <asp:Parameter Name="ENROL_YEAR" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1">
               
                <InsertItemTemplate>
                    <h1><h1>Add New  Enrollment</h1> </h1>
                                                STUDENT_NAME:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>' CssClass="form-control" />
                    </asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
<br />
                    COURSE_TITLE:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    <br />
                    ENROL_MONTH:
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="month" DataTextField="ENROL_MONTH" DataValueField="ENROL_MONTH" SelectedValue='<%# Bind("ENROL_MONTH") %>' CssClass="form-control" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="month" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;ENROL_MONTH&quot; FROM &quot;ENROLLMENT&quot;"></asp:SqlDataSource>
                    <br />
                    ENROL_YEAR:
                     <asp:TextBox ID="ENROL_YEARTextBox" runat="server" Text='<%# Bind("ENROL_YEAR") %>' CssClass="form-control" />
 <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                </InsertItemTemplate>
                <ItemTemplate>
                   <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Enrollment Details" CssClass="btn btn-dark" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
