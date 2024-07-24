<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Query.aspx.cs" Inherits="ADVANCEDBCW.Webforms.Query" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
                <div>
             <h1>Query Information</h1>
                    <div class="d-flex justify-content-start mb-3">
    <!-- Back Icon with HyperLink -->
    <asp:HyperLink runat="server" NavigateUrl="~/Dashboard.aspx" CssClass="btn btn-dark">
        <i class="mdi mdi-arrow-left"></i> Back to Dashboard
    </asp:HyperLink>
</div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="QUERY_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="ACTION" />
                    <asp:BoundField DataField="QUERY_ID" HeaderText="QUERY_ID" ReadOnly="True" SortExpression="QUERY_ID" />
                    <asp:BoundField DataField="QUERY_TEXT" HeaderText="QUERY_TEXT" SortExpression="QUERY_TEXT" />
                    <asp:BoundField DataField="QANDA_SECTION_ID" HeaderText="QANDA_SECTION_ID" ReadOnly="True" SortExpression="QANDA_SECTION_ID" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID"  ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:TemplateField HeaderText="SECTION_TITLE">
                        <ItemTemplate>
                            <asp:DropDownList  Enabled="false"  ID="DropDownList3" runat="server" DataSourceID="qna" DataTextField="SECTION_TITLE" DataValueField="QANDA_SECTION_ID" SelectedValue='<%# Bind("QANDA_SECTION_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="qna" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;QANDA_SECTION_ID&quot;, &quot;SECTION_TITLE&quot; FROM &quot;QANDA_SECTION&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="STUDENT_NAME">
                        <ItemTemplate>
                            <asp:DropDownList  Enabled="false" ID="DropDownList4" runat="server" DataSourceID="std" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="std" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<HeaderStyle BackColor="Red" ForeColor="White"></HeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;QUERY&quot; WHERE &quot;QUERY_ID&quot; = :QUERY_ID" InsertCommand="INSERT INTO &quot;QUERY&quot; (&quot;QUERY_ID&quot;, &quot;QUERY_TEXT&quot;, &quot;QANDA_SECTION_ID&quot;, &quot;STUDENT_ID&quot;) VALUES (:QUERY_ID, :QUERY_TEXT, :QANDA_SECTION_ID, :STUDENT_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;QUERY&quot;" UpdateCommand="UPDATE &quot;QUERY&quot; SET &quot;QUERY_TEXT&quot; = :QUERY_TEXT, &quot;QANDA_SECTION_ID&quot; = :QANDA_SECTION_ID, &quot;STUDENT_ID&quot; = :STUDENT_ID WHERE &quot;QUERY_ID&quot; = :QUERY_ID">
                <DeleteParameters>
                    <asp:Parameter Name="QUERY_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="QUERY_ID" Type="String" />
                    <asp:Parameter Name="QUERY_TEXT" Type="String" />
                    <asp:Parameter Name="QANDA_SECTION_ID" Type="String" />
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="QUERY_TEXT" Type="String" />
                    <asp:Parameter Name="QANDA_SECTION_ID" Type="String" />
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="QUERY_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="QUERY_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <h1> Add New Query</h1>
                    QUERY_ID:
                    <asp:TextBox ID="QUERY_IDTextBox" runat="server" Text='<%# Bind("QUERY_ID") %>' CssClass="form-control" />
                    <br />
                    QUERY_TEXT:
                    <asp:TextBox ID="QUERY_TEXTTextBox" runat="server" Text='<%# Bind("QUERY_TEXT") %>' CssClass="form-control" />
                    <br />
                    QANDA_SECTION_TITLE:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="query_qna" DataTextField="SECTION_TITLE" DataValueField="QANDA_SECTION_ID" SelectedValue='<%# Bind("QANDA_SECTION_ID") %>' CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="query_qna" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;QANDA_SECTION_ID&quot;, &quot;SECTION_TITLE&quot; FROM &quot;QANDA_SECTION&quot;"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;QANDA_SECTION_ID&quot;, &quot;SECTION_TITLE&quot; FROM &quot;QANDA_SECTION&quot;"></asp:SqlDataSource>
                    <br />
                    STUDENT_NAME:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="query_student" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>' CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="query_student" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Query" CssClass="btn btn-dark"/>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
