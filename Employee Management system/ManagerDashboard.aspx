<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerDashboard.aspx.cs" Inherits="Employee_Management_system.ManagerDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Dashboard</title>
    <style>
        body {
            background-color: #C4DAD2;
            font-family: Arial, sans-serif;
        }

        .dashboard-container {
            width: 80%;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .dashboard-container h2 {
            text-align: center;
            color: #333;
        }

        .welcome-message {
            margin: 20px 0;
            text-align: center;
            font-size: 1.5em;
            color: #555;
        }

        .actions {
            margin: 20px 0;
            text-align: center;
        }

        .logout-button {
            width: 100%;
             background-color: #000;
             color: white;
             border: none;
             padding: 10px 0;
             cursor: pointer;
             transition: background-color 0.3s;
            font-size:large;
        }

        .logout-button:hover {
            background-color: #333;
        }

        .staff-table {
            margin: 20px auto;
            width: 90%;
            border-collapse: collapse;
        }

        .staff-table th, .staff-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        .staff-table th {
            background-color: black;
            color: white;
        }

        .staff-table td {
            background-color: #f9f9f9; /* Light background for table data */
        }

        .task-button {
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: large;
            transition: background-color 0.3s;
        }

        .task-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <center><h1>Welcome to the Manager Dashboard</h1></center>
            <div class="welcome-message">
                <asp:Literal ID="litWelcomeMessage" runat="server"></asp:Literal>
            </div>
            <asp:GridView ID="gvStaffList" runat="server" AutoGenerateColumns="False" CssClass="staff-table" OnRowCommand="gvStaffList_RowCommand">
                <Columns>
                    <asp:BoundField DataField="StafId" HeaderText="Staff ID" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnAssignTask" runat="server" CommandName="AssignTask" CommandArgument='<%# Eval("StafId") %>' Text="Assign Task" CssClass="task-button" />
                            <asp:Button ID="btnTaskStatus" runat="server" CommandName="TaskStatus" CommandArgument='<%# Eval("StafId") %>' Text="Task Status" CssClass="task-button" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="actions">
                <asp:Button ID="btnLogout" runat="server" OnClick="Logout" Text="Log out" CssClass="logout-button" />
            </div>
        </div>
    </form>
</body>
</html>
