using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Threading;
using System.Collections.Concurrent;
using System.Threading.Tasks;
using Wb.Models;
using Wb.Common;

namespace Wb.SingalRHub
{
    [HubName("chatHub")]
    public class IronHub : Hub
    {
        private M_Member m_member;
        static ConcurrentDictionary<string, string> dic = new ConcurrentDictionary<string, string>();

        public IronHub()
        {
            m_member = new M_Member();
        }

        public void SendToSpecific(string name, string message, string to)
        {
            message = WbUtil.stripHTML(message);
            Clients.Caller.broadcastMessage(name, message);
            if (dic.ContainsKey(to))
            {
                Clients.Client(dic[to]).broadcastMessage(name, message);
                LogMessage(name, message, to);
            }
            else
            {
                LogMessage(name, message, to, false);
            }
            
        }

        private void LogMessage(string name, string message, string to, bool is_read = true)
        {
            會員 poster = m_member.GetMember("",name);
            會員 receiver = m_member.GetMember("",to);
            即時訊息 data = new 即時訊息();
            data.訊息發送者 = poster.暱稱;
            data.Icon名稱1 = poster.Icon名稱;
            data.訊息接收者 = receiver.暱稱;
            data.Icon名稱2 = receiver.Icon名稱;
            data.訊息內容 = message;
            data.建立日期 = DateTime.Now;
            data.讀取YN = is_read;
            m_member.AddRealTimeMessage(data);
        }



        public void Notify(string name, string id)
        {
            if (dic.ContainsKey(name))
            {
                Clients.Caller.differentName();
            }
            else
            {
                dic.TryAdd(name, id);
                foreach (KeyValuePair<String, String> entry in dic)
                {
                    Clients.Caller.online(entry.Key);
                }
                Clients.Others.enters(name);
            }
        }


        public override Task OnDisconnected()
        {
            var name = dic.FirstOrDefault(x => x.Value == Context.ConnectionId.ToString());
            string s;
            dic.TryRemove(name.Key, out s);
            return Clients.All.disconnected(name.Key);
        }





        public void Hello()
        {
            Clients.All.hello();
        }

        public void SendUser(string userId, string message)
        {
            Clients.User(userId).send(message);
        }

        public void Group(String GroupId)
        {
            Groups.Add(Context.ConnectionId, GroupId);
            Clients.Group(GroupId).addMessage("Welcome");
          
        }
       

        public void Send(String GroupId, String Message)
        {
            Clients.Group(GroupId).addMessage(Message);
        }


        public void SendOne(String ClientId, String Message)
        {
            Clients.Client(ClientId).addMessage(Message);
            
        }





    }



}