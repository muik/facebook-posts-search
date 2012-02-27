lang = navigator.language;

switch (lang) {
// Korean
case 'ko':
  jQuery.timeago.settings.strings = {
    suffixAgo: "전",
    suffixFromNow: "후",
    seconds: "1분  이내",
    minute: "1분",
    minutes: "%d분",
    hour: "1시간",
    hours: "%d시간",
    day: "하루",
    days: "%d일",
    month: "한달",
    months: "%d달",
    year: "1년",
    years: "%d년"
  };
  break;

// Japanese
case 'ja':
  jQuery.timeago.settings.strings = {
    prefixAgo: "",
    prefixFromNow: "今から",
    suffixAgo: "前",
    suffixFromNow: "後",
    seconds: "ほんの数秒",
    minute: "約一分",
    minutes: "%d 分",
    hour: "大体一時間",
    hours: "大体 %d 時間位",
    day: "一日",
    days: "%d 日ほど",
    month: "大体一ヶ月",
    months: "%d ヶ月ほど",
    year: "丁度一年（虎舞流ｗ）",
    years: "%d 年"
  };
  break;

// Simplified Chinese
case 'zh-CN':
  jQuery.timeago.settings.strings = {
    prefixAgo: null,
    prefixFromNow: "从现在开始",
    suffixAgo: "之前",
    suffixFromNow: null,
    seconds: "不到 1 分钟",
    minute: "大约 1 分钟",
    minutes: "%d 分钟",
    hour: "大约 1 小时",
    hours: "大约 %d 小时",
    day: "1 天",
    days: "%d 天",
    month: "大约 1 个月",
    months: "%d 月",
    year: "大约 1 年",
    years: "%d 年",
    numbers: []
  }
  break;

// Traditional Chinese, zh-tw
case 'zh-TW':
  jQuery.timeago.settings.strings = {
    prefixAgo: null,
    prefixFromNow: "從現在開始",
    suffixAgo: "之前",
    suffixFromNow: null,
    seconds: "不到 1 分鐘",
    minute: "大約 1 分鐘",
    minutes: "%d 分鐘",
    hour: "大約 1 小時",
    hours: "大約 %d 小時",
    day: "1 天",
    days: "%d 天",
    month: "大約 1 個月",
    months: "%d 月",
    year: "大約 1 年",
    years: "%d 年",
    numbers: []
  }
  break;

case 'lang':
  break;
}
