<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffRegistration.aspx.cs" Inherits="Employee_Management_system.staffRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Registration</title>
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

        .form-container h1 {
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
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #4CAF50;
        }

        .form-group input[type="submit"] {
            display: block;
            width: 100%; 
            background-color: #000; 
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 0; 
            margin-top: 10px;
            font-size: large; 
            border-radius: 5px;
        }

        .form-group input[type="submit"]:hover {
            background-color: #333;
        }

        .form-group input[disabled] {
            background-color: #e9ecef;
            color: #6c757d;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h1>Staff Registration</h1>
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtFullName">Full Name:</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPhoneNumber">Phone Number:</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" TextMode="Phone" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtRole">Role:</label>
                <asp:TextBox ID="txtRole" runat="server" CssClass="form-control" Text="Staff" ReadOnly="true" Enabled="false"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button runat="server" Text="Register" ID="submitbtn" OnClick="btnSubmit" CssClass="btn-submit" />
            </div>
        </div>
    </form>
</body>
</html>
