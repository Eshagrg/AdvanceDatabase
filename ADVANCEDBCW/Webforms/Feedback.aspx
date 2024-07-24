<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="ADVANCEDBCW.Webforms.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
                                <div>
             <h1>Feedback Details</h1>
                    <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FEEDBACK_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION" />
                    <asp:BoundField DataField="FEEDBACK_ID" HeaderText="FEEDBACK_ID" ReadOnly="True" SortExpression="FEEDBACK_ID" />
                    <asp:BoundField DataField="FEEDBACK_TEXT" HeaderText="FEEDBACK_TEXT" SortExpression="FEEDBACK_TEXT" />
                    <asp:BoundField DataField="QUERY_ID" HeaderText="QUERY_ID" ReadOnly="True" SortExpression="QUERY_ID" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                    <asp:TemplateField HeaderText="QUERY_TEXT">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="query" DataTextField="QUERY_TEXT" DataValueField="QUERY_ID" SelectedValue='<%# Bind("QUERY_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="query" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;QUERY_ID&quot;, &quot;QUERY_TEXT&quot; FROM &quot;QUERY&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="INSTRUCTOR_NAME">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="Ins" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID" SelectedValue='<%# Bind("INSTRUCTOR_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Ins" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<HeaderStyle BackColor="Red" ForeColor="White"></HeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;FEEDBACK&quot; WHERE &quot;FEEDBACK_ID&quot; = :FEEDBACK_ID" InsertCommand="INSERT INTO &quot;FEEDBACK&quot; (&quot;FEEDBACK_ID&quot;, &quot;FEEDBACK_TEXT&quot;, &quot;QUERY_ID&quot;, &quot;INSTRUCTOR_ID&quot;) VALUES (:FEEDBACK_ID, :FEEDBACK_TEXT, :QUERY_ID, :INSTRUCTOR_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;FEEDBACK&quot;" UpdateCommand="UPDATE &quot;FEEDBACK&quot; SET &quot;FEEDBACK_TEXT&quot; = :FEEDBACK_TEXT, &quot;QUERY_ID&quot; = :QUERY_ID, &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID WHERE &quot;FEEDBACK_ID&quot; = :FEEDBACK_ID">
                <DeleteParameters>
                    <asp:Parameter Name="FEEDBACK_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FEEDBACK_ID" Type="String" />
                    <asp:Parameter Name="FEEDBACK_TEXT" Type="String" />
                    <asp:Parameter Name="QUERY_ID" Type="String" />
                    <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FEEDBACK_TEXT" Type="String" />
                    <asp:Parameter Name="QUERY_ID" Type="String" />
                    <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
                    <asp:Parameter Name="FEEDBACK_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="FEEDBACK_ID" DataSourceID="SqlDataSource1">
              
                <InsertItemTemplate>
                    <h1>Add New Feedba</h1>
                    FEEDBACK_ID:
                    <asp:TextBox ID="FEEDBACK_IDTextBox" runat="server" Text='<%# Bind("FEEDBACK_ID") %>' CssClass="form-control" />
                    <br />
                    FEEDBACK_TEXT:
                    <asp:TextBox ID="FEEDBACK_TEXTTextBox" runat="server" Text='<%# Bind("FEEDBACK_TEXT") %>' CssClass="form-control"/>
                    <br />
                    QUERY_TEXT:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="query_feedback" DataTextField="QUERY_TEXT" DataValueField="QUERY_ID" SelectedValue='<%# Bind("QUERY_ID") %>' CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="query_feedback" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;QUERY_ID&quot;, &quot;QUERY_TEXT&quot; FROM &quot;QUERY&quot;"></asp:SqlDataSource>
                    <br />
                    INSTRUCTOR_NAME:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ins_feedback" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID" SelectedValue='<%# Bind("INSTRUCTOR_ID") %>' CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ins_feedback" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" CssClass="btn btn-success" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                </InsertItemTemplate>
                <ItemTemplate>
                  <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Feedback" CssClass="btn btn-dark" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
