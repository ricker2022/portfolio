<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload1.aspx.cs" Inherits="upload1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <title></title>
        <style>
   body { padding:10px; font:14px/18px Calibri }
   .bold { font-weight:bold }
   td { padding:5px; border:1px solid #999 }
   p, output { margin:10px 0 0 0 }
   #drop_zone 
   { 
       margin:10px 0;
       width:40%; 
       min-height:150px; 
       text-align:center;
       text-transform:uppercase;
       font-weight:bold;
       border:8px dashed #898;
                height: 160px;
            }
  </style>
    <script>
        var files;
        function handleDragOver(event) {
            event.stopPropagation();
            event.preventDefault();
            var dropZone = document.getElementById('drop_zone');
            dropZone.innerHTML = "Drop now";
        }

        function handleDnDFileSelect(event) {
            event.stopPropagation();
            event.preventDefault();

            /* Read the list of all the selected files. */
            files = event.dataTransfer.files;
            alert('4555');
            /* Consolidate the output element. */
            var form = document.getElementById('form1');
            var data = new FormData(form);

            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                alert(xhr.readyState);
                if (xhr.readyState == 4 && xhr.status == 200 && xhr.responseText) {
                    var dropZone = document.getElementById('drop_zone');
                    drop_zone.innerHTML = "<img width='100px' height='100px' alt='' src='http://localhost:49984/Uploads/"+files[0].name+"' />";
                    alert("upload done! " + files[0].name);
                } else {
                    alert("upload failed!");
                }
               
            };
            xhr.open('POST', "http://localhost:49984/CalendarEvent.aspx");
            xhr.setRequestHeader("Content-type", "multipart/form-data");
            xhr.send(data);

        }

        function uploadFile() {
            var data = new FormData(),
                file = $("#fileToUpload")[0].files[0];

            data.append("name", file.name);
            data.append("size", file.size);
            data.append("type", file.type);
            data.append("file", file);

            $.ajax(
            {
                // url: "UploadWS.asmx/UploadedFile",
                url: "//localhost:49984/CalendarEvent.aspx",
               // dataType: "json",
                type: "POST",
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                success: function () { },
                error: function () { alert('error'); }
            });
        }
  </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <input id="fileToUpload" type="file" multiple>
        <br />
        <div id="drop_zone">Drop files here</div>
</form>
</body>
       <script>
           if (window.File && window.FileList && window.FileReader) {
               /************************************ 
                * All the File APIs are supported. * 
                * Entire code goes here.           *
                ************************************/


               /* Setup the Drag-n-Drop listeners. */
               var dropZone = document.getElementById('drop_zone');
               dropZone.addEventListener('dragover', handleDragOver, false);
               dropZone.addEventListener('drop', handleDnDFileSelect, false);

           }
           else {
               alert('Sorry! this browser does not support HTML5 File APIs.');
           }
  </script>
</html>
