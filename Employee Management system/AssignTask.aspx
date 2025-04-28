<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignTask.aspx.cs" Inherits="Employee_Management_system.AddTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assign Task</title>
    <style>
        body {
            background-color: #C4DAD2;
            font-family: Arial, sans-serif;
        }

        .form-container {
            width: 50%;
            margin: auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: large;
        }

        .form-group {
            margin: 15px 0;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
            font-size: large;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
            font-size: large;
        }

        .form-group input:focus, .form-group textarea:focus {
            border-color: #4CAF50;
        }

        .form-group input[type="submit"] {
            width: auto;
            background-color: #000;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            font-size: large;
            transition: background-color 0.3s;
        }

        .form-group input[type="submit"]:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <center><h1>Assign Task</h1></center>
            <div class="form-group">
                <label for="txtTaskMessage">Task Message:</label>
                <asp:TextBox ID="txtTaskMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmitTask" runat="server" Text="Assign Task" OnClick="btnSubmitTask_Click" CssClass="btn-submit" />
            </div>
        </div>
    </form>
</body>
</html>
