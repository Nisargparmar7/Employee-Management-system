<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staffdashboard.aspx.cs" Inherits="Employee_Management_system.Staffdashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Dashboard</title>
    <style>
        body {
            background-color: #C4DAD2;
            font-family: Arial, sans-serif;
        }

        .dashboard-container {
            width: 80%;
            margin: auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        .dashboard-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: large;
        }

        .logout-button-container {
            text-align: center;
            margin-top: 30px;
        }

        .logout-button {
           width: 100%;
background-color: #000;
color: white;
border: none;
padding: 10px 0;
cursor: pointer;
transition: background-color 0.3s;
font-size: large;
        }

        .logout-button:hover {
            background-color: #c0392b;
        }

        .welcome-message {
            margin: 20px 0;
            text-align: center;
            font-size: large;
        }

        .grid-view {
            margin: 20px auto;
            width: 100%;
            border-collapse: collapse;
        }

        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .grid-view th {
            background-color: #000;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1>Welcome to the Staff Dashboard</h1>
            <div class="welcome-message">
                <asp:Literal ID="litWelcomeMessage" runat="server"></asp:Literal>
            </div>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="TaskId" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="TaskId" HeaderText="Task ID" Visible="false" />
                    <asp:BoundField DataField="TaskMessage" HeaderText="Task Message" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblIsComplete" runat="server" Text='<%# Bind("IsComplete") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="chkIsComplete" runat="server" Checked='<%# Bind("IsComplete") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Default %>" 
                DeleteCommand="DELETE FROM [Task] WHERE [TaskId] = @TaskId" 
                SelectCommand="SELECT * FROM [Task] WHERE ([EmployeeId] = @EmployeeId)" 
                UpdateCommand="UPDATE [Task] SET [IsComplete] = @IsComplete WHERE [TaskId] = @TaskId">
                <DeleteParameters>
                    <asp:Parameter Name="TaskId" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="EmployeeId" SessionField="UserId" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IsComplete" Type="Boolean" />
                    <asp:Parameter Name="TaskId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="logout-button-container">
                <asp:Button ID="Button1" runat="server" OnClick="Logout" Text="Log Out" CssClass="logout-button" />
            </div>
        </div>
    </form>
</body>
</html>
