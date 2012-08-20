/// <reference path="jquery.js"/>
/*
 * jmodal
 * version: 2.0 (05/13/2009)
 * @ jQuery v1.3.* +
 *
 * Licensed under the GPL:
 *   http://gplv3.fsf.org
 *
 * Copyright 2008, 2009 Jericho [ thisnamemeansnothing[at]gmail.com ] 
 *  
*/
$.extend($.fn, {
	//后置处理器
	postProcessor: function(){},
	//外部调用API，销毁弹出窗体
	destory: function(){
		$('#jmodal-overlay').animate({ opacity: 0 }, function() { $(this).css('display', 'none') });
    	$('#jquery-jmodal').animate({ opacity: 0 }, function() { $(this).css('display', 'none') });
    	//销毁弹出窗后调用后置处理器-处理业务逻辑（刷新原来页面等）
		$.fn.postProcessor();
	},
	
    jmodal: function(setting) {
        var ps = $.fn.extend({
            data: {},
            marginTop: 100,
            buttonText: { ok: 'Ok', cancel: 'Cancel' },
            okEvent: function(e) { },
            initWidth: 800,
            initHeight: 400,
            fixed: false,
            title: 'JModal Dialog',
            content: 'This is a jquery plugin!'
        }, setting);

        //窗口销毁时将业务逻辑传递给后置处理器进行处理
        $.fn.postProcessor = ps.reload;
        
        ps.docWidth = $(document).width();
        ps.docHeight = $(window).height();

        
        //弹出层的和遮罩层的绘制
        if ($('#jquery-jmodal').length == 0) {
            $('<div id="jmodal-overlay" class="jmodal-overlay"/>' +
                '<div class="jmodal-main" id="jquery-jmodal" style="border:0px solid;" >' +
                    '<table cellpadding="0" cellspacing="0">' +
                    
                        '<tr>' +
                            '<td class="jmodal-top-left jmodal-png-fiexed">&nbsp;</td>' +
                            '<td class="jmodal-border-top jmodal-png-fiexed">&nbsp;</td>' +
                            '<td class="jmodal-top-right jmodal-png-fiexed">&nbsp;</td>' +
                        '</tr>' +
                   
                        '<tr>' +
	                        '<td class="jmodal-border-left jmodal-png-fiexed">&nbsp;</td>' +
	                        '<td >' +
	                            '<div class="jmodal-title" />' +
	                            '<div class="jmodal-content" id="jmodal-container-content" />' +
                            
	                        '</td>' +
	                        '<td class="jmodal-border-right jmodal-png-fiexed">&nbsp;</td>' +
                        '</tr>' +
                        
                    '<tr>' +
                        '<td class="jmodal-bottom-left jmodal-png-fiexed">&nbsp;</td>' +
                        '<td class="jmodal-border-bottom jmodal-png-fiexed">&nbsp;</td>' +
                        '<td class="jmodal-bottom-right jmodal-png-fiexed">&nbsp;</td>' +
                    '</tr>' +
                    
                    '</table>' +
                '</div>').appendTo($(document.body));
            //$(document.body).find('form:first-child') || $(document.body)
        }
        else {
            $('#jmodal-overlay').css({ opacity: 0, 'display': 'block' });
            $('#jquery-jmodal').css({ opacity: 0, 'display': 'block' });
        }
        
        //遮罩层的css设置
        $('#jmodal-overlay').css({
            height: ps.docHeight,
            opacity: 0
        }).animate({ opacity: 0.5});

        //弹出层的css设置
        $('#jquery-jmodal').css({
            position: (ps.fixed ? 'fixed' : 'absolute'),
            width: ps.initWidth,
            height: ps.initHeight,
            left: (ps.docWidth - ps.initWidth) / 2,
            top: (ps.marginTop + document.documentElement.scrollTop)
        }).animate({ opacity: 1 });

        //弹出层的事件绑定
        $('#jquery-jmodal')
            .find('.jmodal-title')
                .html(ps.title)
                    .next()
                        .next()
                            .children('input:first-child')
                                .attr('value', ps.buttonText.ok)
                                    .unbind('click')
                                        .one('click', function(e) {
                                            var args = {
                                                //complete: $.fn.hideJmodal  //隐藏弹出框
                                                complete: hideJmodal  //隐藏弹出框
                                            };
                                            //绑定ok按钮回调事件，该事件在调用时传入(ps.data)
                                            ps.okEvent(ps.data, args);
                                        })
                                            .next()
                                                .attr('value', ps.buttonText.cancel)
                                                    //.one('click', $.fn.hideJmodal); //隐藏弹出框
                                                 	.one('click', hideJmodal); //隐藏弹出框
        
        //ps对象的content属性为string
        if (typeof ps.content == 'string') {
            $('#jmodal-container-content').html(ps.content);
        }
        //ps对象的content属性为函数function
        if (typeof ps.content == 'function') {
        	//获取对话框中间内容区域的div对象，赋给e
            var e = $('#jmodal-container-content'); 
            e.holder = $('#jquery-jmodal');
          //执行函数，加载内容到弹出div层中
            ps.content(e);  
        }
        
        //销毁弹出窗体，内部调用
       var  hideJmodal=function() {
        	$('#jmodal-overlay').animate({ opacity: 0 }, function() { $(this).css('display', 'none') });
        	$('#jquery-jmodal').animate({ opacity: 0 }, function() { $(this).css('display', 'none') });
        };
        
       
   }

})