<%@ Page  Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Controls_ACMSTextBox_JavaScript_tiny_mce_plugins_FileManager_Default" %>

 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="ar" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ajax File Manager</title>
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
   
	
	<script  src="js/jquery.jstree.js" type="text/javascript"></script>
    
    <script src="js/tiny_mce_popup.js" type="text/javascript"></script>
    <link href="css/ui-lightness/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-ui-1.8.4.custom.min.js" type="text/javascript"></script>
    <script src="js/jquery.contextmenu.js" type="text/javascript"></script>
    <link href="css/jquery.contextmenu.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     body
     {
         font-size:small;
     }
    .ui-resizable-helper { border: 2px dotted #00F; }
    #selectable .ui-selecting { background: #FECA40; }
	#selectable .ui-selected { background: #F39814; color: white; }
	#selectable { list-style-type: none; margin: 0; padding: 0; width: 80%; }
	#selectable li { margin: 3px; padding: 0.4em; font-size: 1em; height: 25px; cursor:pointer;}
	#selectable a { text-decoration:none;position:fixed;padding-left:4px;}
	#PlayerDiv {  width: 800px; height:620px; padding: 0.5em; float: left; margin: 0 10px 10px 0; }
	#PlayerDiv span { cursor: move;width:740px;text-align:left;  }
	input.btn {
  color:#050;
  font: bold 84% 'trebuchet ms',helvetica,sans-serif;
  background-color:#F39814;
  border: 1px solid;
  font-size:larger;
  margin-right:10px;
  margin-top:6px;
  border-color: #696 #363 #363 #696;
  filter:progid:DXImageTransform.Microsoft.Gradient
  (GradientType=0,StartColorStr='#ffffffff',EndColorStr='#F39814');
}

    </style>
    <script type="text/javascript" language="javascript" >

        var txtPath;
        var CurentPath = '<% Response.Write( ConfigurationManager.AppSettings["FileManager"].ToString() ); %>';
        var BaseCurentPath = CurentPath;
        var Copy = "";
        var Cut = "";
        function LoadFiles(Path) {
           //  alert(tinyMCEPopup.getWindowArg("sessionid"));
            //document.getElementById("spanPath").innerHTML = " &nbsp;&nbsp;" + Path;
            //txtPath.value = Path+"/";
            CurentPath = Path + "/";
            document.getElementById("divProcess").style.display = "";
            UpdatePathBar(Path);
            $.ajax({
                url: "Funcations.aspx",
                type: "POST",
                contentType: "application/x-www-form-urlencoded;charset=UTF8",
                dataType: 'html',
                data: "funcation=FilesULLI&Path=" + Path + "&sessionid=" + tinyMCEPopup.getWindowArg("sessionid") + "&type=" + tinyMCEPopup.getWindowArg("type"),
                success: callback
            });
        }

        var menu1 = [


                      { 'Copy': {
                          onclick: function (menuItem, menu) { CopyFile(); },
                          icon: 'icons/CCopy.png',
                          disabled: false
                      }
                      },
                     { 'Cut': {
                         onclick: function (menuItem, menu) { CutFile(); },
                         icon: 'icons/ceditcut.png',
                         disabled: false
                     }
                     }
                      ,
                                           { 'Past': {
                                               onclick: function (menuItem, menu) { PastFileFolder(); },
                                               icon: 'icons/cPaste.png',
                                               disabled: false
                                           }
                                           },
                       { 'New Folder': {
                           onclick: function (menuItem, menu) { CreateFolder(); },
                           icon: 'icons/cfolderpng.png',
                           disabled: false
                       }
                       },
                         { 'Delete': {
                             onclick: function (menuItem, menu) {DeleteFileFolder();},
                             icon: 'icons/CDelete.png',
                             disabled: false
                         }
                         }

                    ];

                     var menu2 = [

                                           { 'Past': {
                                               onclick: function (menuItem, menu) { PastFileFolder(); },
                                               icon: 'icons/cPaste.png',
                                               disabled: false
                                           }
                                           },
                       { 'New Folder': {
                           onclick: function (menuItem, menu) { CreateFolder(); },
                           icon: 'icons/cfolderpng.png',
                           disabled: false
                       }
                       },
                         { 'Delete': {
                             onclick: function (menuItem, menu) { DeleteFileFolder(); },
                             icon: 'icons/CDelete.png',
                             disabled: false
                         }
                         }

                    ];
                     function callback(data, textStatus) {
                       
            document.getElementById("divProcess").style.display = "none";           
            $("#Table_content").html(data);
            $("#selectable").selectable({
                stop: function () { var result = $("#selected").empty(); $(".ui-selected", this).each(function () { $("#selected").html($("#selected").html() +","+$(this).attr("path")); }); }
            });

            $("button", ".demo").button();
            
            $('li').contextMenu(menu1, { theme: 'vista' });
            $("#Table_content").contextMenu(menu2, { theme: 'vista' });
            //alert($("#Table_content").html());
        }


        /* Open File */
        function OpenFile(filetype, filepath) {
            
            if (filetype == 3) {

                return;
            }
            if (filetype == 1) {
                OpenFileplayer(filepath)
                document.getElementById("SpanFileName").innerHTML = ( "/" + filepath ).replace( BaseCurentPath , "" );
                return;
            }
            if (filetype == 2) {
                
                LoadFiles(filepath);
                return;
            }
        }


        function OpenFileplayer(filepath) {            

            document.getElementById("divProcess").style.display = "";
            $.ajax({
                url: "player.aspx",
                type: "POST",
                contentType: "application/x-www-form-urlencoded;charset=UTF8",
                dataType: 'html',
                data: "Path=" + filepath + "&sessionid=" + tinyMCEPopup.getWindowArg("sessionid"),
                success: ShowFile
            });
        }

        function ShowFile(html) {
            document.getElementById("divProcess").style.display = "none";
            if (html == 1) {
                alert("unknown file type");
                return;
            }
            document.getElementById("HtmlDiv").innerHTML = html;            
            $("#PlayerDiv").show("slow");
        }
        /* End Open File */

        /* Colse Player */
        function hideFile() {
            $("#PlayerDiv").hide("slow");
            var t = setTimeout("document.getElementById('HtmlDiv').innerHTML = '' ", 60);
           
        }
        /* End Close Player */

        /* Update Path Bar */

        function UpdatePathBar(Path) {

            var PathArray = Path.split('/');
            var ParHTML = "";
            var CurentPath = "";
            for (index = 0; index < PathArray.length; index++) {
                CurentPath = CurentPath + PathArray[index] + "/";

                if (PathArray[index] != "" && BaseCurentPath.indexOf(CurentPath) < 0) {
                    ParHTML += "<a onclick=LoadFiles('" + CurentPath + "') href='javascript:;'>" + PathArray[index].replace("%20"," ") + "</a>" + "&nbsp;/";
                }
            }

            document.getElementById("spanPath").innerHTML = " &nbsp;&nbsp;" + ParHTML;
           
        }



        /* End Update Path Bar */

        /* Create Folder */
        function CreateFolder() {

            $("#dialog").dialog({
                buttons: {
                    Ok: function () {
                       
                        document.getElementById("divProcess").style.display = "";
                        $.ajax({
                            url: "Funcations.aspx",
                            type: "POST",
                            contentType: "application/x-www-form-urlencoded;charset=UTF8",
                            dataType: 'html',
                            data: "funcation=CreateFolder&Path=" + CurentPath + "&FolderName=" + $("#inputFolder").val() + "&sessionid=" + tinyMCEPopup.getWindowArg("SessionID"),
                            success: CreateFolderSuccess
                        });
                        $(this).dialog('close');
                    },
                    Cancel: function () {
                        $(this).dialog('close');
                    }
                }
            });

        }

        function CreateFolderSuccess() {
            document.getElementById("divProcess").style.display = "none";
            LoadFiles(CurentPath);
            LoadTree();
        }

        /* End Create Folder */


        /* Delete File Or Folders */



        function DeleteFileFolder() {
            if ($("#selected").html() == "") {
                alert("select one or more file or folder ");
                return;
            }
            $("#dialogDelete").dialog({
                buttons: {
                    Ok: function () {
                        document.getElementById("divProcess").style.display = "";
                        $.ajax({
                            url: "Funcations.aspx",
                            dataType: 'html',
                            type: "POST",
                            contentType: "application/x-www-form-urlencoded;charset=UTF8",
                            data: "funcation=DelteFileFolder&" + "FolderName=" + $("#selected").html() + "&sessionid=" + tinyMCEPopup.getWindowArg("SessionID"),
                            success: DeleteFileFolderSuccess
                        });
                        $(this).dialog('close');
                    },
                    Cancel: function () {
                        $(this).dialog('close');
                    }
                }
            });
        }


        function DeleteFileFolderSuccess(data) {
            document.getElementById("divProcess").style.display = "none";
            if (data == "success") {
                LoadFiles(CurentPath);
                LoadTree();
            }
            else {
                $("#errormessage").html(data);
                $("#dialogmessage").dialog({ modal: true});
            }
        }

        /* End Delete File Or Folders */


        /* Past Files */
        function PastFileFolder() {

            if (Copy.length > 0) {
                document.getElementById("divProcess").style.display = "";
                $.ajax({
                    url: "Funcations.aspx",
                    dataType: 'html',
                    type: "POST",
                    contentType: "application/x-www-form-urlencoded;charset=UTF8",
                    data: "funcation=CopyFiles&" + "SelectedFiles=" + Copy + "&FolderName=" + CurentPath + "&sessionid=" + tinyMCEPopup.getWindowArg("SessionID"),
                    success: PastFileFolderSuccess
                });
            }

            else if (Cut.length > 0) {
                document.getElementById("divProcess").style.display = "";
                $.ajax({
                    url: "Funcations.aspx",
                    dataType: 'html',
                    type: "POST",
                    contentType: "application/x-www-form-urlencoded;charset=UTF8",
                    data: "funcation=CutDirectory&" + "SelectedFiles=" + Cut + "&FolderName=" + CurentPath + "&sessionid=>" + tinyMCEPopup.getWindowArg("SessionID"),
                    success: PastFileFolderSuccess
                });
            }
            else {
                alert("no operation to do");
            }
        }

        function PastFileFolderSuccess() {
            document.getElementById("divProcess").style.display = "none";
            LoadFiles(CurentPath);
            $("#CopyImg").attr("src", "icons/Copy-32.png");
            Copy = "";
            Cut = "";
            $("#cutImage").attr("src", "icons/editcut-32.png");
        }

        /* End Past Files */


        /* Copy Files */

        function CopyFile() {           
            if ($("#selected").html() == "") {
                alert("Select one or more file or folder");
                return;
            }
            Cut = "";
            $("#cutImage").attr("src", "icons/editcut-32.png");
            if (Copy == "") {                
                Copy = $("#selected").html()
                $("#CopyImg").attr("src", "icons/File-copy-32.png")
            }
            else {
                Copy = "";
                $("#CopyImg").attr("src", "icons/Copy-32.png")
            }
           
        }

        /* End Copy Files */

        /* Cut Files */

        function CutFile() {
            if ($("#selected").html() == "") {
                alert("Select one or more file or folder");
                return;
            }
            $("#CopyImg").attr("src", "icons/Copy-32.png");
            Copy = "";
            if (Copy == "") {
                Cut = $("#selected").html()
                $("#cutImage").attr("src", "icons/Cut-32.png");
            }
            else {
                Cut = "";
                $("#cutImage").attr("src", "icons/editcut-32.png");
            }

        }
        /* End Cut Files */


    </script>
</head>
<body>
    <form  id="form1" runat="server">
    <div style="display:none;position:absolute;background-color:White;top:300px;z-index:101;left:400px;" id="divProcess">
        <img src="icons/21-0.gif" /> please wait ...
    </div>
    <div style="font-size:small;">
    
    
    <div id="dialog" style="font-size:small;display:none;" title="Create New Folder">
	 <p>  Folder Name : <input id="inputFolder" type="text" /></p>
    </div>

     <div id="dialogDelete" style="font-size:small;display:none;" title="Delete Confirm">
	    are you sure you want delete selected Files Folders ?
    </div>

     <div id="dialogmessage" style="font-size:small;display:none;" title="Message">
         <img src="icons/Gnome-Dialog-Error-32.png" /> <span id="errormessage"></span>
    </div>
    </div>
    
        <div id="PlayerDiv" class="ui-widget-content" style="  overflow:scroll; text-align:center; position:absolute;display:none;top:10px;left:70px;z-index:100;">
            <div class="ui-widget-header" style="width:750px;text-align:right; height:auto;  "> <span id="SpanFileName" style="float:left;"></span> <a style="text-decoration:none;" href="javascript:;" onclick="hideFile()">X</a></div>           
            <div style="height:5px;" ></div>
             <div   id="HtmlDiv">
       
            </div>
        </div>
         <div class="ui-widget-content"  style="height:20px;clear:both;vertical-align:top;width:930px;float:right" id="spanPath">  </div>
        <div style="clear:both;height:3px;width:100%;"></div>
        <div style="width:930px;float:right;height:30px;background-color:Lime;padding:2 2 0 0" class="ui-widget-content">
            <a style="float:right;" title="go to root folder" href="javascript:;" onclick="LoadFiles(BaseCurentPath)"><img alt="go to root folder" width="25" style="border:0;padding:2px 2px 0 0;" src="icons/home-32_1.png" /></a>          
            <a style="float:right; display:none" title="cut"  href="javascript:;" onclick="CutFile()"><img alt="cut" id="cutImage" width="25" style="border:0;padding:2px 2px 0 0;" src="icons/editcut-32.png" /></a>
            <a style="float:right; display:none" title="copy"  href="javascript:;" onclick="CopyFile()"><img id="CopyImg" alt="copy" width="25" style="border:0;padding:2px 2px 0 0;" src="icons/Copy-32.png" /></a>
            <a style="float:right; display:none" title="past"  href="javascript:;" onclick="PastFileFolder()"><img alt="past" width="25" style="border:0;padding:2px 2px 0 0;" src="icons/Gnome-Edit-Paste-32.png" /></a>
            <a style="float:right; display:none" title="delete"  href="javascript:;" onclick="DeleteFileFolder()"><img alt="delete" width="25" style="border:0;padding:2px 2px 0 0;" src="icons/Delete-32.png" /></a>
            <a style="float:right; display:none" title="create new folder"  href="javascript:;" onclick="CreateFolder()"><img alt="create new folder" width="25" style="border:0;padding:2px 2px 0 0;" src="icons/folder-32.png" /></a>
        </div>
        <div style="display:none;" id="selected">
        
        </div>
        <div style="width:1px;clear:both;"></div>
        <div id="cotener" style="height:495px;">
        <table>
            <tr>
            <td valign="top">
                    <div id="treeDiv" style="width:200px;height:480px;display:block;" class="ui-widget-content">
            <div id="tree" >
	
            </div>
<script type="text/javascript" class="source">

    function LoadTree () {
        $("#tree").jstree({
            "core": { "initially_open": ["root2"] },
            "html_data": {
                "ajax": {
                    "url": "Funcations.aspx?funcation=LoadFilesHTML" + "&sessionid=" + tinyMCEPopup.getWindowArg("sessionid") + "&type=" + tinyMCEPopup.getWindowArg("type"),
                    "data": function (n) {
                        return { Path: n.attr ? n.attr("path") : 0 };
                    }
                }
            },
            "plugins": ["themes", "html_data"]

        });
    }

    $(function () { LoadTree(); });
    
</script>
                       

                </td>
                <td>
                    
                    <div id="FolderAndFiles" style="width:725px;height:480px;display:block; " class="ui-widget-content">
            <div id="Table_content" style="height:480px;overflow:scroll;" >
            
            </div>
        </div>
                </td>
                
            </tr>
        </table>
        
        
        </div>
        
        <div class="ui-widget-content" style="width:100%;background-color:Green;height:73px;clear:both;display:none;">
                    <iframe  onload="IframOnload()" marginheight="0px" marginwidth="0px" align="left"  frameborder="0"   src="Uploader.aspx?sessionid=<%= Request["sessionid"].ToString() %>" id="IframUpload" 
           style="width: 330px;border:0px ;height:80px;">
        </iframe>
        <div   style="vertical-align:middle;"  id="Uploadingimage"> 
                <img src="icons/21-0.gif" /> uploading...         
            </div>
        </div>
    
    </form>
</body>
</html>

<script type="text/javascript" language="javascript">
    var upload_img_process;
    var ifram;
    var subButton;
    var uploder;


    function valid_File(File) {
        if (File == "") {
            alert("please select file");
            return false;
        }
        /** If you want valiat file name do this here **/
        return true
    }

    function IframOnload() {        
        ifram = document.getElementById('IframUpload')
        upload_img_process = document.getElementById("Uploadingimage");
        subButton = ifram.contentWindow.document.getElementById("bntUpload");
        uploder = ifram.contentWindow.document.getElementById("FileUpload1");
        Label_message = ifram.contentWindow.document.getElementById("spanerror");
        //txtPath = ifram.contentWindow.document.getElementById("txtPath");
        upload_img_process.style.display = 'none';
        if (subButton != null) {
            subButton.onclick = function () {
                var isvalid = valid_File(uploder.value);
                if (isvalid) {
                    upload_img_process.style.display = '';
                }
                return isvalid;
            }
                }
        LoadFiles(CurentPath);
    }

    $(function () {
        $("#treeDiv").resizable({
            containment: '#cotener',
            helper: 'ui-resizable-helper'
        });
    });

    $("#PlayerDiv").draggable({ handle: 'span' });


    function InsertFile(fileName) {

        var win = tinyMCEPopup.getWindowArg("window");
        win.document.getElementById(tinyMCEPopup.getWindowArg("input")).value = fileName;       
        
       // are we an image browser
       if (typeof (win.ImageDialog) != "undefined") {
           // we are, so update image dimensions...
           if (win.ImageDialog.getImageData)
               win.ImageDialog.getImageData();

           // ... and preview if necessary
           if (win.ImageDialog.showPreviewImage)
               win.ImageDialog.showPreviewImage(fileName);
       }

       // close popup window
       tinyMCEPopup.close();

    }
    </script>
    <script type="text/javascript" language="javascript">
        
</script>