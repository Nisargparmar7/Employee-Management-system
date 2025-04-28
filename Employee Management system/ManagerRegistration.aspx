<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerRegistration.aspx.cs" Inherits="Employee_Management_system.ManagerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Registration</title>
    <style>
        body {
            background-color: #C4DAD2;
            font-family: Arial, sans-serif;
        }

        .reg {
            width: 50%;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .reg h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: large;
        }

        .input {
            margin: 15px 0;
        }

        .input label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
            font-size: large;
        }

        .input input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
            font-size: large;
        }

        .input input:focus {
            border-color: #4CAF50;
        }

        .input input[type="submit"] {
            width: 100%;
            background-color: #000;
            color: white;
            border: none;
            padding: 10px 0;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: large;
        }

        .input input[type="submit"]:hover {
            background-color: #333;
        }

        .input input[disabled] {
            background-color: #e9ecef;
            color: #6c757d;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="reg">
           <center> <h1>Manager Registration</h1></center>
            <div class="input">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="input">
                <label for="txtFullName">Full Name:</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="input">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required="required"></asp:TextBox>
            </div>
            <div class="input">
                <label for="txtPhoneNumber">Phone Number:</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" TextMode="Phone" required="required"></asp:TextBox>
            </div>
            <div class="input">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
            </div>
            <div class="input">
                <label for="securityPassword">Security Password:</label>
                <asp:TextBox ID="securityPassword" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
            </div>
            <div class="input">
                <label for="txtRole">Role:</label>
                <asp:TextBox ID="txtRole" runat="server" CssClass="form-control" Text="Manager" ReadOnly="true" Enabled="false"></asp:TextBox>
            </div>
            <div class="input">
                <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" CssClass="btn-submit" />
            </div>
        </div>
    </form>
</body>
</html>
