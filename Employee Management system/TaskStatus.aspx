<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskStatus.aspx.cs" Inherits="Employee_Management_system.TaskStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Status</title>
    <style>
        body {
            background-color: #C4DAD2;
            font-family: Arial, sans-serif;
        }

        .task-container {
            width: 80%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            margin-top: 50px;
        }

        .task-container h2 {
            text-align: center;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .gridview th {
            background-color: black;
            color: white;
            font-weight: bold;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #d1e7dd;
        }

        .delete-button {
            background-color: red;
            color: white;
            border: none;
            cursor: pointer;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .delete-button:hover {
            background-color: darkred;
        }

        .btn {
            display: block;
            margin: 20px auto;
            background-color: #000;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            font-size: large;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="task-container">
            <h2>Task List</h2>
            <asp:GridView ID="gvTasks" runat="server" AutoGenerateColumns="False" 
                OnRowDeleting="gvTasks_RowDeleting" 
                DataKeyNames="TaskId" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="TaskId" HeaderText="Task ID" Visible="false" />
                    <asp:BoundField DataField="TaskMessage" HeaderText="Task Message" />
                    <asp:BoundField DataField="IsComplete" HeaderText="Status" 
                        DataFormatString="{0:Yes;No}" />
                    <asp:ButtonField CommandName="Delete" Text="Delete" ButtonType="Button" 
                       ControlStyle-CssClass="delete-button" />
                </Columns>
            </asp:GridView>
            <div style="text-align: center; margin-top: 20px;">
                <asp:Button ID="btnBack" runat="server" Text="Back to Manager Dashboard" OnClick="btnBack_Click" CssClass="btn" />
            </div>
        </div>
    </form>
</body>
</html>
