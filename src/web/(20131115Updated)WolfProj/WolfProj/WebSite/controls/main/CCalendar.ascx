<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CCalendar.ascx.cs" Inherits="controls_main_CCalendar" %>


<link href="../../_css/CCalendar.css" rel="stylesheet" />
<script src="../../_js/CCalendar-zh-TW.js"></script>
<div id="datepicker"></div>
<div id="events"></div>


<script type="text/javascript">
    var disabledTool = new Date();
    var returnResult = "";


    $(function () {
       
   
        $('#datepicker').tooltip({
            position: {
                my: "center bottom-20",
                at: "center top",
                using: function (position, feedback) {

                    $(this).css(position);
                    $("<div>")
                    .addClass("arrow")
                    .addClass(feedback.vertical)
                    .addClass(feedback.horizontal)
                    .appendTo(this);
                }
            },
            content: function () {
                var element = $(this);
                return element.attr("title");
            }
        });
    });



    $(function () {
       
        $.get('http://localhost:49984/CalendarEvent.aspx?date=1', function (data) {

            returnResult = data;

            var countLength = returnResult.split("|").length;
      
            $("#datepicker").datepicker({
                nextText: "",
                prevText: "",
                dateFormat: "yy-mm-dd",
                beforeShowDay:function (date) {
                
                    var cssStyle = '';
                    var tipString = '';
                    for (var i = 0; i < countLength; i++) {
                        
                        var ress = returnResult.split("|")[i].split("$");
                        var disabledTool2 = new Date(ress[0]);
                        var tooltipDate = ress[1];   // "I'm DISABLED!!";
                       

                        if (date.getTime() == disabledTool2.getTime()) {
                            cssStyle = 'highlight';
                            tipString = tooltipDate;
                            // return [true, 'highlight', tooltipDate];
                        } else {
                            // return [true, '', ''];
                        }
                    }
                    return [true, cssStyle, tipString]
                 }
            });
           
        });
       
     




    });


   

</script>
<style type="text/css">
    #highlight, .highlight {
        /*background-color: #000000;*/
    }

        /*有活動有內容的日期*/
        .highlight > a.ui-state-default {
            /*background: url("/images/main/ui-bg_highlight-soft_25_ffef8f_1x100.png") repeat-x scroll 50% top #FFEF8F !important;
            border: 1px solid #F9DD34;*/
            color: #0ff;
        }
        .highlight > a.ui-state-default:hover {
            /*background: url("/images/main/ui-bg_highlight-soft_25_ffef8f_1x100.png") repeat-x scroll 50% top #FFEF8F !important;
            border: 1px solid #F9DD34;*/
            color: #eb8f00;
        }


    .ui-tooltip, .arrow:after {
        background: rgba(0,0,0,0.7);
        border: 1px solid #f19149;
    }

    .ui-tooltip {
        padding: 10px 20px;
        color: white;
        border-radius: 5px;
        font: normal 12px "Helvetica Neue", Sans-Serif;
        text-transform: uppercase;
        box-shadow: 0 0 7px black;
    }

    .arrow {
        width: 70px;
        height: 16px;
        overflow: hidden;
        position: absolute;
        left: 50%;
        margin-left: -35px;
        bottom: -16px;
    }

        .arrow.top {
            top: -16px;
            bottom: auto;
        }

        .arrow.left {
            left: 20%;
        }

        .arrow:after {
            content: "";
            position: absolute;
            left: 20px;
            top: -20px;
            width: 25px;
            height: 25px;
            box-shadow: 6px 5px 9px -9px black;
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            tranform: rotate(45deg);
        }

        .arrow.top:after {
            bottom: -20px;
            top: auto;
        }
</style>


