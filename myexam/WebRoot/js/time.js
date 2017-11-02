new_element = document.createElement("script");
new_element.setAttribute("type", "text/javascript");
new_element.setAttribute("src", "submitPaper.js");// 在这里引入了提交试卷js
document.body.appendChild(new_element);

var maxtime = 20;
var minutes, seconds;
var minute = 0, second = 0;

var timer;
var timer2;
var timer3;
$(function() {
	if (maxtime >= 0) {
		minutes = Math.floor(maxtime / 60);
		seconds = Math.floor(maxtime % 60);
	}
	$('#time').html(currentTime);
	timer = window.setInterval(function() {

		
	

		--seconds;
		second++;
		
		
		//显示已开始时间
		$("#startTime").html(
				"<span>已开始<span class='label'>" + minute
						+ "</span>分<span class='label'>" + second
						+ "</span>秒</span>");
		//显示剩余时间
		$("#surplusTime").html(
				"<span>还剩余<span class='label'>" + minutes
						+ "</span>分<span class='label'>" + seconds
						+ "</span>秒</span>");

		if (seconds < 0) {
			minutes--;
			seconds = 59;

			if (minutes <= 0) {
				minutes = 0;
			}
		}

		if (minutes == 0 && seconds == 0) {
			//checkPaper();
			cancel();
		}

		if (second >= 60) {
			second = 0;
			minute++;

		}

	}, 1000);

	timer2=window.setInterval(function() {
		$('#time').html(currentTime);//显示当前系统时间
	}, 1000);
	
	
	
	timer3=window.setInterval(function() {
		//submitPaper();//每隔5分钟进行实时更新
	}, 2000);
	
});
function cancel() {
	window.clearInterval(timer);
	window.clearInterval(timer2);
	window.clearInterval(timer3);
}
function currentTime() {
	var d = new Date(), str = '';
	str += d.getFullYear() + '年';
	str += d.getMonth() + 1 + '月';
	str += d.getDate() + '日';
	str += d.getHours() + '时';
	str += d.getMinutes() + '分';
	str += d.getSeconds() + '秒';
	return str;
}
