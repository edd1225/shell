	
	jQuery.fcbkListSelection = function(d, h, j, k) {
		var l = function(b, c) {
			switch (c) {
			case "all":
				b.children("li").show();
				break;
			case "selected":
				b.children("li:not([addedid])").hide();
				b.children("li[addedid]").show();
				break;
			case "unselected":
				b.children("li[addedid]").hide();
				b.children("li:not([addedid])").show();
				break
			}
		}, n = function() {
			switch (m()) {
			case "all":
				d.children("li").show();
				break;
			case "selected":
				d.children("li:not([addedid])").hide();
				d.children("li[addedid]").show();
				break;
			case "unselected":
				d.children("li[addedid]").hide();
				d.children("li:not([addedid])").show();
				break
			}
		}, i = function(b) { //选择对象个数递减
			if (b.hasClass("itemselected")) {
				$("#view_selected_count").text(
						parseInt($("#view_selected_count").text(), 10) - 1);
				b.parents("li").removeAttr("addedid");
				o(b)
			} else {  //选择对象个数递增
				$("#view_selected_count").text(
						parseInt($("#view_selected_count").text(), 10) + 1);
				b.parents("li").attr("addedid", "tester");
				p(b)
			}
			n(b)
		}, p = function(b, c) {
			var a = d.attr("id") + "_values";
			if ($("#" + a).length == 0) {
				var e = document.createElement("input");
				$(e).attr({
					type : "hidden",
					name : a,
					id : a,
					value : ""
				});
				d.after(e)
			} else
				e = $("#" + a);
			a = "rand_" + q();
			if (!c) {
				c = b.find("[type=hidden]").val();
				b.find("[type=hidden]").attr("randid", a)
			}
			b = new r(a, c);
			b = s(b, $(e).val());
			$(e).val(b);
			return e
		}, s = function(b, c) {
			var a = "{";
			$.each(b, function(f, g) {
				if (f)
					a += '"' + f + '":"' + g + '",'
			});
			try {
				eval("json = " + c + ";");
				$.each(c, function(f, g) {
					if (f && g)
						a += '"' + f + '":"' + g + '",'
				})
			} catch (e) {
			}
			a = a.substr(0, a.length - 1);
			a += "}";
			return a
		}, r = function(b) {
			try {
				eval("this." + b + " = value;")
			} catch (c) {
			}
		}, o = function(b) {
			var c = b.find("[type=hidden]").attr("randid");
			b = d.attr("id") + "_values";
			if ($("#" + b).length != 0)
				try {
					eval("json = " + $("#" + b).val() + ";");
					var a = "{";
					$.each(json, function(f, g) {
						if (f && g && f != c)
							a += '"' + f + '":"' + g + '",'
					});
					if (a.length > 2) {
						a = a.substr(0, a.length - 1);
						a += "}"
					} else
						a = "";
					$("#" + b).val(a)
				} catch (e) {
				}
		}, q = function() {
			for ( var b = "", c = 0; c < 32; c++) {
				var a = Math.floor(Math.random() * 61);
				b += "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz"
						.substring(a, a + 1)
			}
			return b
		}, m = function() {
			return $(".view_on").attr("id").replace("view_", "")
		};
		if (typeof d != "object")
			d = $(d);
		d.css("width", h + "px");
		(function(b, c) {
			c = '<div id="filters" style="width:'
					+ (parseInt(c, 10) + 2)
					+ 'px;"><ul class="selections" id="selections"><li id="view_all" class="view_on"><a onclick="return false;" href="#">View All</a></li><li id="view_selected" class=""><a onclick="return false;" href="#">Selected (<strong id="view_selected_count">0</strong>)</a></li><li id="view_unselected" class=""><a onclick="return false;" href="#">Unselected</a></li></ul><div class="clearer"></div></div>';
			b.before(c)
		})(d, h);
		(function(b, c, a, e) {
			b.children("li").wrapInner('<div class="fcbklist_item"></div>');
			$(".fcbklist_item").css("height", a + "px");
			b = Math.ceil(parseInt(c, 10) / parseInt(e, 10)) - 11;
			$(".fcbklist_item").css("width", b + "px")
		})(d, h, j, k);
		(function(b) {
			$.each($("#selections li"), function(c, a) {
				a = $(a);
				a.click(function() {
					$(".view_on").removeClass("view_on");
					a.addClass("view_on");
					l(b, a.attr("id").replace("view_", ""))
				})
			})
		})(d);
		(function(b) {
			$.each(b.children("li").children(".fcbklist_item"), function(c, a) {
				a = $(a);
				if (a.children("input[checked]").length != 0) {
					i(a);
					a.toggleClass("itemselected");
					a.parents("li").toggleClass("liselected")
				}
				a.click(function() {
					i(a);
					a.toggleClass("itemselected");
					a.parents("li").toggleClass("liselected")
				});
				a.mouseover(function() {
					a.addClass("itemover")
				});
				a.mouseout(function() {
					$(".itemover").removeClass("itemover")
				})
			})
		})(d)
	};







