﻿
namespace Wb.Pager
{
    internal class PagerItem
    {
        public PagerItem(string text, int pageIndex, bool disabled, PagerItemType type)
        {
            Text = text;
            PageIndex = pageIndex;
            Disabled = disabled;
            Type = type;
        }

        public PagerItem(string text, int pageIndex, bool disabled, PagerItemType type,string param)
        {
            Text = text;
            PageIndex = pageIndex;
            Disabled = disabled;
            Type = type;
            Param = param;
        }

        internal string Text { get; set; }
        internal int PageIndex { get; set; }
        internal bool Disabled { get; set; }
        internal PagerItemType Type { get; set; }
        internal string Param { get; set; }
    }

    internal enum PagerItemType:byte
    {
        FirstPage,
        NextPage,
        PrevPage,
        LastPage,
        MorePage,
        NumericPage
    }
}
