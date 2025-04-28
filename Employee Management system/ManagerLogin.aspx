<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerLogin.aspx.cs" Inherits="Employee_Management_system.ManagerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Login</title>
    <style>
        body {
            background-color: #C4DAD2;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 30%;
            margin: 100px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin: 15px 0;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            border-color: #4CAF50;
        }

        .input-group input[type="submit"] {
            width: 100%;
            background-color: #000;
            color: white;
            border: none;
            padding: 10px 0;
            cursor: pointer;
            transition: background-color 0.3s;
           font-size:large;
        }

        .input-group input[type="submit"]:hover {
            background-color: #333;
        }
        .links-container {
    text-align: center;
    margin-top: 20px;
}

.links-container a {
    color: #4CAF50;
    text-decoration: none;
    font-weight: bold;
}

.links-container a:hover {
    text-decoration: underline;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
           <center> <h1>Manager Login</h1></center>
            <div class="input-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
            <div class="input-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
            </div>
            <div class="input-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-submit" OnClick="btnLogin_Click" />
            </div>
            <div class="links-container">
    <p>Not registered yet? <a href="ManagerRegistration.aspx">Register here</a></p>
    <p>If you are a Staff, please <a href="StaffLogin.aspx">login here</a></p>
</div>
        </div>
    </form>
</body>
</html>
