<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Progress.aspx.cs" Inherits="ADVANCEDBCW.Progress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
     
</head>
<body>
    <form id="form1" runat="server">
                       <div>
            <h1>Progress Information</h1>
                                   <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            
                    
       
             <asp:GridView runat="server" DataSourceID="Progress1" ID="gv3" DataKeyNames="COURSE_ID,STUDENT_ID,LESSON_NO"  AutoGenerateColumns="False"  CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
                     <Columns>
                         <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION"></asp:CommandField>
                         <asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS" />
                         <asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="LAST_ACCESSED_DATE" SortExpression="LAST_ACCESSED_DATE" />
                         <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                         <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                         <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" ReadOnly="True" SortExpression="LESSON_NO" />
                         <asp:TemplateField HeaderText="COURSE_TITLE">
                             <ItemTemplate>
                                 <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="coursetitleprogress" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                                 </asp:DropDownList>
                                 <asp:SqlDataSource ID="coursetitleprogress" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="STUDENT_NAME">
                             <ItemTemplate>
                                 <asp:DropDownList Enabled="false" ID="DropDownList5" runat="server" DataSourceID="StudentNameProgress" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                                 </asp:DropDownList>
                                 <asp:SqlDataSource ID="StudentNameProgress" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="LESSON_TITLE">
                             <ItemTemplate>
                                 <asp:DropDownList Enabled="false" ID="DropDownList6" runat="server" DataSourceID="LessonTitleProgress" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_NO") %>'>
                                 </asp:DropDownList>
                                 <asp:SqlDataSource ID="LessonTitleProgress" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                             </ItemTemplate>
                         </asp:TemplateField>
    </Columns>
</asp:GridView>
         
                                                                 <asp:FormView ID="FormView1" runat="server" DataSourceID="Progress1" OnPageIndexChanging="FormView1_PageIndexChanging" DataKeyNames="COURSE_ID,STUDENT_ID,LESSON_NO">              
                                                                    
        <InsertItemTemplate>
             <h2>Add New Progress</h2>
           LESSON_STATUS:
    <asp:DropDownList ID="LESSON_STATUSTextBox" runat="server" SelectedValue='<%# Bind("LESSON_STATUS") %>' CssClass="form-control">
        <asp:ListItem Text="In progress" Value="In progress" />
        <asp:ListItem Text="Completed" Value="Completed" />
        <asp:ListItem Text="Not started" Value="Not started" />
    </asp:DropDownList>
    <br />
            LAST_ACCESSED_DATE:
            <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' CssClass="form-control"  />
            <br />
            COURSE_TITLE:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control" >
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
            <br />
            STUDENT_NAME:
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>' CssClass="form-control" >
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            <br />
            LESSON_TITLE:
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_NO") %>' CssClass="form-control" >
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-success" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
     </InsertItemTemplate>
      <ItemTemplate>
       <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Progress Details" CssClass="btn btn-dark" />
</ItemTemplate>
  </asp:FormView>


                                                                  </div>


            <asp:SqlDataSource runat="server" ID="Progress1" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" 
                DeleteCommand="DELETE FROM &quot;STUDENT_PROGRESS&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;LESSON_NO&quot; = :LESSON_NO"
                InsertCommand="INSERT INTO &quot;STUDENT_PROGRESS&quot; (&quot;LESSON_STATUS&quot;, &quot;LAST_ACCESSED_DATE&quot;, &quot;COURSE_ID&quot;, &quot;STUDENT_ID&quot;, &quot;LESSON_NO&quot;) VALUES (:LESSON_STATUS, :LAST_ACCESSED_DATE, :COURSE_ID, :STUDENT_ID, :LESSON_NO)"
                ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" 
                SelectCommand="SELECT * FROM &quot;STUDENT_PROGRESS&quot;"
                UpdateCommand="UPDATE &quot;STUDENT_PROGRESS&quot; SET &quot;LESSON_STATUS&quot; = :LESSON_STATUS, &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;LESSON_NO&quot; = :LESSON_NO">
                <DeleteParameters>
                    <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="LESSON_STATUS" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LESSON_STATUS" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="STUDENT_ID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
       
      
    </form>
</body>
</html>
