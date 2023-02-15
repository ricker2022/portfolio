<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMaintain.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="js/jQuery-File-Upload-8.9.0/js/vendor/jquery.ui.widget.js"></script>
<script src="js/jQuery-File-Upload-8.9.0/js/jquery.iframe-transport.js"></script>
<script src="js/jQuery-File-Upload-8.9.0/js/jquery.fileupload.js"></script>
<script>
    $(function () {
        $('#fileupload').fileupload({
            dataType: 'json',
            done: function (e, data) {
                $.each(data.result.files, function (index, file) {
                    $('<p/>').text(file.name).appendTo(document.body);
                });
            },
            progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .bar').css(
                'width',
                progress + '%'
            );
        }
        });
    });
</script>
    <style>
        .bar {
    height: 18px;
    background: green;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <input id="fileupload" type="file" name="files[]" data-url="/temp" multiple>
    <div id="progress">
    <div class="bar" style="width: 0%;"></div>
</div>
    <br />
    <br />
    <table>
        <tr>
            <td><asp:Button ID="Button1" runat="server" Text="Button" /><asp:Button ID="Button2" runat="server" Text="Button" /></td> <td></td> <td></td>
        </tr>
            <tr>
            <td>TeamName:</td> <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                choose player:<asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
                </td> <td><asp:Button ID="Button3" runat="server" Text="Button" /></td>
                
        </tr>
        
            <tr>
            <td>New TeamName:</td> <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button4" runat="server" Text="Button" />
                </td> <td></td>
        </tr>
            <tr>
            <td><asp:Button ID="Button5" runat="server" Text="Button" /></td> <td><asp:Button ID="Button6" runat="server" Text="Button" /></td> <td></td>
        </tr>
            <tr>
            <td>Member photo</td> <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                </td> <td><asp:Button ID="Button7" runat="server" Text="Button" /></td>
        </tr>
            <tr>
            <td></td> <td></td> <td></td>
        </tr>
    </table>
</asp:Content>

