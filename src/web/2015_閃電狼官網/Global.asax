<%@ Application Language="C#" %>
<%@Import Namespace="System.Web.Configuration" %>

<script runat="server">

    void Application_BeginRequest(object sender,EventArgs e)
    {
        HttpRuntimeSection section = (HttpRuntimeSection)ConfigurationManager.GetSection("system.web/httpRuntime");
        int maxFileSize = section.MaxRequestLength * 1024;
        if (Request.ContentLength > maxFileSize)
        {
            HttpContext.Current.ClearError();
            HttpContext.Current.Response.Redirect("zm_album_photo_order_over.aspx");
        }
        
    }
    void Application_Start(object sender, EventArgs e) 
    {
        // 在應用程式啟動時執行的程式碼

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  在應用程式關閉時執行的程式碼

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        //if (Server.GetLastError().GetType().ToString() == "System.Web.HttpRequestValidationException") {
        //     Response.Redirect("default.aspx");
        // }       
        // Server.ClearError();
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // 在新的工作階段啟動時執行的程式碼

    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在工作階段結束時執行的程式碼
        // 注意: 只有在  Web.config 檔案中將 sessionstate 模式設定為 InProc 時，
        // 才會引起 Session_End 事件。如果將 session 模式設定為 StateServer 
        // 或 SQLServer，則不會引起該事件。

    }
       
</script>
