using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace Wb.SingalRHub
{
    public class CustomUserIdProvider : IUserIdProvider
    {
        public string GetUserId(IRequest request)
        {
            // your logic to fetch a user identifier goes here.

            // for example:

            //var userId = MyCustomUserClass.FindUserId(request.User.Identity.Name);
            //return userId.ToString();
            return request.User.Identity.Name;
        }
    }
}