<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="ADVANCEDBCW.Lesson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Add Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
              <div>
  <h1>Lesson Information</h1>
             <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            <asp:GridView runat="server" DataSourceID="Lesson1" ID="gv2" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White" DataKeyNames="LESSON_NO,COURSE_ID" AutoGenerateColumns="False">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION"></asp:CommandField>
                    <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" ReadOnly="True" SortExpression="LESSON_NO" />
                    <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" />
                    <asp:BoundField DataField="LESSON_DESCRIPTION" HeaderText="LESSON_DESCRIPTION" SortExpression="LESSON_DESCRIPTION" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:TemplateField HeaderText="COURSE_TITLE">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="coursetitleforlesson" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="coursetitleforlesson" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                   </div>
            
         

         <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>"
     DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;COURSE_ID&quot; = :COURSE_ID"
     InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot;, &quot;LESSON_DESCRIPTION&quot;, &quot;COURSE_ID&quot;) VALUES (:LESSON_NO, :LESSON_TITLE, :LESSON_DESCRIPTION, :COURSE_ID)"
     ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>"
     SelectCommand="SELECT * FROM &quot;LESSON&quot;"
     UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;LESSON_TITLE&quot; = :LESSON_TITLE, &quot;LESSON_DESCRIPTION&quot; = :LESSON_DESCRIPTION WHERE &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;COURSE_ID&quot; = :COURSE_ID"
     ID="Lesson1" OnSelecting="Lesson1_Selecting">
     <DeleteParameters>
         <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
         <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
     </DeleteParameters>
     <InsertParameters>
         <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
         <asp:Parameter Name="LESSON_TITLE" Type="String"></asp:Parameter>
         <asp:Parameter Name="LESSON_DESCRIPTION" Type="String"></asp:Parameter>
         <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
     </InsertParameters>
     <UpdateParameters>
         <asp:Parameter Name="LESSON_TITLE" Type="String"></asp:Parameter>
         <asp:Parameter Name="LESSON_DESCRIPTION" Type="String"></asp:Parameter>
         <asp:Parameter Name="LESSON_NO" Type="Decimal"></asp:Parameter>
         <asp:Parameter Name="COURSE_ID" Type="String"></asp:Parameter>
     </UpdateParameters>
 </asp:SqlDataSource>
              <asp:FormView ID="FormView1" runat="server" DataSourceID="Lesson1" OnPageIndexChanging="FormView1_PageIndexChanging" CssClass="esha2" DataKeyNames="LESSON_NO,COURSE_ID">
                
                  <InsertItemTemplate>
                        <h2>Add New Lesson</h2>
                      LESSON_NO:
                      <asp:TextBox ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' CssClass="form-control"  />
                      <br />
                      LESSON_TITLE:
                      <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' CssClass="form-control"  />
                      <br />
                      LESSON_DESCRIPTION:
                      <asp:TextBox ID="LESSON_DESCRIPTIONTextBox" runat="server" Text='<%# Bind("LESSON_DESCRIPTION") %>' CssClass="form-control" />
                      <br />
                      COURSE_TITLE:
                      <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control" >
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                      <br />
                      <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-success"/>
                      &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                  </InsertItemTemplate>
                  <ItemTemplate>
                   <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Lesson" CssClass="btn btn-dark" />
                  </ItemTemplate>
              </asp:FormView>
    </form>
</body>
</html>
