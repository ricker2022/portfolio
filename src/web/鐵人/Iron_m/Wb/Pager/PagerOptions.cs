﻿namespace Wb.Pager
{
    public class PagerOptions
    {
        public PagerOptions()
        {
            AutoHide = true;
            PageIndexParameterName = "pageIndex";
            NumericPagerItemCount = 10;
            AlwaysShowFirstLastPageNumber = false;
            ShowPrevNext = true;
            PrevPageText = "Prev";
            NextPageText = "Next";
            PrevPageParam = "";
            NextPageParam = "";
            ShowNumericPagerItems = true;
            ShowFirstLast = true;
            FirstPageText = "First";
            LastPageText = "Last";
            FirstPageParam = "";
            LastPageParam = "";
            ShowMorePagerItems = true;
            MorePageText = "...";
            ShowDisabledPagerItems = true;
            SeparatorHtml = "&nbsp;&nbsp;";
            DefaultSeparatorHtml = "<span></span>";
            UseJqueryAjax = false;
            ShowPageIndexBox = false;
            ShowGoButton = true;
            PageIndexBoxType = PageIndexBoxType.TextBox;
            MaximumPageIndexItems = 80;
            GoButtonText = "Go";
            //ContainerTagName = "div id=\"pages\"";
            ContainerTagName = "div ";
            InvalidPageIndexErrorMessage = "Invalid page index";
            PageIndexOutOfRangeErrorMessage = "Page index out of range";
            MaxPageIndex = 0;
        }
        /// <summary>
        /// whether or not hide control(render nothing) automatically when there's only one page
        /// </summary>
        public bool AutoHide { get; set; }

        /// <summary>
        /// PageIndexOutOfRangeErrorMessage
        /// </summary>
        public string PageIndexOutOfRangeErrorMessage { get; set; }

        /// <summary>
        /// InvalidPageIndexErrorMessage
        /// </summary>
        public string InvalidPageIndexErrorMessage { get; set; }
        /// <summary>
        /// page index parameter name in url
        /// </summary>
        public string PageIndexParameterName { get; set; }

        /// <summary>
        /// Whether or not show page index box
        /// </summary>
        public bool ShowPageIndexBox { get; set; }

        /// <summary>
        /// Page index box type
        /// </summary>
        public PageIndexBoxType PageIndexBoxType { get; set; }

        /// <summary>
        /// Maximum page index items listed in dropdownlist
        /// </summary>
        public int MaximumPageIndexItems { get; set; }

        /// <summary>
        /// whether or not show go button
        /// </summary>
        public bool ShowGoButton { get; set; }

        /// <summary>
        /// text displayed on go button
        /// </summary>
        public string GoButtonText { get; set; }

        /// <summary>
        /// numeric pager item format string
        /// </summary>
        public string PageNumberFormatString { get; set; }

        private string _containerTagName;
        /// <summary>
        /// html tag name when control rendered
        /// </summary>
        public string ContainerTagName
        {
            get
            {
                return _containerTagName;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                    throw new System.ArgumentException("ContainerTagName can not be null or empty", "ContainerTagName");
                _containerTagName = value;
            }
        }

        /// <summary>
        /// all pageritem wrapper format string
        /// </summary>
        public string PagerItemWrapperFormatString { get; set; }

        /// <summary>
        /// current pager item format string
        /// </summary>
        public string CurrentPageNumberFormatString { get; set; }

        /// <summary>
        /// NumericPager Item Wrapper Format String
        /// </summary>
        public string NumericPagerItemWrapperFormatString { get; set; }

        /// <summary>
        /// Current Pager Item Wrapper Format String
        /// </summary>
        public string CurrentPagerItemWrapperFormatString { get; set; }

        /// <summary>
        /// NavigationPager Item Wrapper Format String
        /// </summary>
        public string NavigationPagerItemWrapperFormatString { get; set; }

        /// <summary>
        /// MorePagerItem Wrapper Format String
        /// </summary>
        public string MorePagerItemWrapperFormatString { get; set; }

        /// <summary>
        /// PageIndexBox Wrapper Format String
        /// </summary>
        public string PageIndexBoxWrapperFormatString { get; set; }

        /// <summary>
        /// GoToPage Section Wrapper Format String
        /// </summary>
        public string GoToPageSectionWrapperFormatString { get; set; }

        /// <summary>
        /// whether or not show first and last numeric page number
        /// </summary>
        public bool AlwaysShowFirstLastPageNumber { get; set; }
        /// <summary>
        /// numeric pager items count
        /// </summary>
        public int NumericPagerItemCount { get; set; }
        /// <summary>
        /// whether or not show previous and next pager items
        /// </summary>
        public bool ShowPrevNext { get; set; }
        /// <summary>
        /// previous page text
        /// </summary>
        public string PrevPageText { get; set; }
        public string PrevPageParam { get; set; }
        /// <summary>
        /// next page text
        /// </summary>
        public string NextPageText { get; set; }
        public string NextPageParam { get; set; }
        /// <summary>
        /// whether or not show numeric pager items
        /// </summary>
        public bool ShowNumericPagerItems { get; set; }
        /// <summary>
        /// whether or not show first and last pager items
        /// </summary>
        public bool ShowFirstLast { get; set; }
        /// <summary>
        /// first page text
        /// </summary>
        public string FirstPageText { get; set; }
        public string FirstPageParam { get; set; }
        /// <summary>
        /// last page text
        /// </summary>
        public string LastPageText { get; set; }
        public string LastPageParam { get; set; }
        /// <summary>
        /// whethor or not show more pager items
        /// </summary>
        public bool ShowMorePagerItems { get; set; }
        /// <summary>
        /// more page text
        /// </summary>
        public string MorePageText { get; set; }
        /// <summary>
        /// client id of paging control container
        /// </summary>
        public string Id { get; set; }
        /// <summary>
        /// HOrizontal alignment
        /// </summary>
        public string HorizontalAlign { get; set; }
        /// <summary>
        /// CSS class to apply
        /// </summary>
        public string CssClass { get; set; }
        /// <summary>
        /// whether or not show disabled pager items
        /// </summary>
        public bool ShowDisabledPagerItems { get; set; }
        /// <summary>
        /// seperating item html
        /// </summary>
        public string SeparatorHtml { get; set; }

        public string DefaultSeparatorHtml { get; set; }
        /// <summary>
        /// maximum page index limitation,default is 0
        /// </summary>
        public int MaxPageIndex { get; set; }

        /// <summary>
        /// whether or not use jQuery ajax, as opposed to MicrosoftAjax
        /// </summary>
        internal bool UseJqueryAjax { get; set; }
    }
    public enum PageIndexBoxType {
        TextBox,//input box
        DropDownList //dropdownlist
    }
}