<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Facebook 是一个联系朋友的社交工具。大家可以通过它和朋友、同事、同学以及周围的人保持互动交流，分享无限上传的图片与转贴链接，更可以增进对朋友的了解。">

<title>SHELL</title>

<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/cuheXhkBDkh.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/p_e4y6WmY0P.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath() %>/css/common/eExuUYovHyE.css">

<!-- 
<script type="text/javascript" src="../../js/common/fNWwCkXLvOv.js"></script>
<script type="text/javascript" async="" src="../../js/common/ga.js"></script>

<script src="./Facebook_resources/Yd1AJTC7arz.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/fLiM0DKnx2t.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/Te7Lb1diu8z.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/-KRncDz6Y2j.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/XtE6Qg0z0vd.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/D8FCGc6HZSS.js" type="text/javascript" async=""></script>
<script src="./Facebook_resources/xrEeXUiCo9E.js" type="text/javascript" async=""></script>
-->

</head>

<!-- 文档body部分开始 -->

<body class="safari4 Locale_zh_CN" >
<!--
	<div id="FB_HiddenContainer" style="position:absolute; top:-10000px; width:0px; height:0px;"></div>
-->	

	<div class="devsitePage">
		<div class="menu">
				<a class="logo" href="<%=request.getContextPath() %>"> 
					<img class="img" src="<%=request.getContextPath() %>/images/facebook_developer_logo.png" alt="Facebook" width="166" height="17">
			    </a> 
			<div class="content">
					
				<a class="l" href="http://developers.facebook.com/docs/">主页</a>
				<a class="l" href="http://developers.facebook.com/module/">发现朋友</a>
				<a class="l" href="http://developers.facebook.com/blog/">账户</a> 
				<a class="l" href="https://developers.facebook.com/apps">应用</a>
				<a class="l" href="https://developers.facebook.com/apps">设置</a>

				<!-- 搜索div开始 -->
				<div class="search">
					<form method="get" action="/shell/login.action">
						<div class="uiTypeahead" id="u362713_2">
							<div class="wrap">
								<input type="hidden" autocomplete="off" class="hiddenInput" name="path" value="">
								<div class="innerWrap">
									<span class="uiSearchInput textInput"> <span>
										 <input	type="text" class="inputtext DOMControl_placeholder"
											name="selection" placeholder="Search for documentation"
											autocomplete="off" spellcheck="false" value="Search for documentation..."
											title="Search for documentation">

											<button type="submit" title="Search for documentation">
												<!--
												<span class="hidden_elem">Search for documentation</span>
												-->
											</button> 
											
										</span></span>
								</div>
							</div>
							<div class="uiTypeaheadView" id="u362713_1"></div>
						</div>
					</form>
				</div>
				<!-- 搜索div结束 -->
				<div class="clear"></div>
			</div>
		</div>

		<div class="body nav">
		
			<!-- 导航栏 -->
				<div id="bodyMenu" class="bodyMenu">
					<div class="toplevelnav">
						<ul>
							<li><a href="http://developers.facebook.com/blog/">
									<div class="navSectionTitle">颗米教育</div> </a></li>
							<li><a href="http://developers.facebook.com/live_status">
									<div class="navSectionTitle">扫地老僧</div> </a></li>
							<li><a href="http://developers.facebook.com/docs/changelog">
									<div class="navSectionTitle">分页查询测试</div> </a></li>
							<li><a href="http://developers.facebook.com/roadmap">
									<div class="navSectionTitle">change Log</div> </a>
							</li>
							<li class="active withsubsections">
								<a class="selected"	href="http://developers.facebook.com/devgarage">
									<div class="navSectionTitle">Developer Garage</div> 
								</a>
							</li>
						</ul>
					</div>
				</div>
		
			<!-- 内容主显示区域 -->
			<div class="content">
				<div id="bodyText" class="bodyText">
					<div class="header">
						<div class="content">
							<h1>Hosting a Facebook Developer Garage</h1>
						</div>
					</div>
					<h2>Introduction</h2>

					<div style="float: right; padding: 0 0 20px 20px;">
					</div>

					<p>
						<a href="http://www.facebook.com/FacebookDevGarage">Facebook
							Developer Garages</a> are just like they sound — places to explore,
						get gritty, tinker, collaborate, and test out ideas for building
						with Facebook Platform. Whether a few hours long or all-night <a
							href="http://www.facebook.com/video/video.php?v=23155051776">hackathons</a>,
						Developer Garages have always been a grassroots effort, involving
						the local developer community to teach and inspire one another.
					</p>

					<h3>Hosting a Garage</h3>

					<p>If you have the pulse of your local developer community and
						are energized by the idea of bringing people together, we hope
						you'll host a Facebook Developer Garage. Here's an overview of the
						process:</p>

					<ol>
						<li><a
							href="https://spreadsheets.google.com/spreadsheet/viewform?formkey=dGdNWFU4NjNtVXZyb0FpSWFXNC1wWkE6MQ">Apply
								to be a host</a> at least 60-90 days before your event.</li>
						<li>We'll let you know if we accept your request within 30
							business days. If accepted, we'll ask for more information
							including a signed event contract, agenda and other event
							details.</li>
						<li>Once we receive the event details, you'll get final
							approval from us within 10 business days.</li>
					</ol>

					<p>
						Be sure to review our <a
							href="http://developers.facebook.com/devgarage/#faq">FAQs</a> and
						check out our program video below. We look forward to you joining
						our host community!
					</p>



					<h3>Program Sponsor</h3>

					<div style="float: right; padding: 0 0 20px 20px;">
					</div>

					<p>
						We're excited to have Intel as the exclusive sponsor of the
						Facebook Developer Garage Program, helping to provide more
						resources to developers worldwide. <a
							href="http://appdeveloper.intel.com/en-us/">Learn more</a> about
						Intel's initiatives or how you can become a future Developer
						Garage Program <a
							href="http://developers.facebook.com/devgarage/#sponsor">sponsor</a>.
					</p>

					<hr />

<!--  
					<h2>FAQs</h2>
					<div class="mtm pvm uiBoxWhite topborder">
						<abbr title="2011年7月19日10:07" data-date="Tue, 19 Jul 2011 10:07:29 -0700" class="timestamp">约
							30 周前更新</abbr>
					</div>
-->
				</div>

				<div class="clear"></div>


			</div>
		</div>



		<!-- 页脚div 开始 -->
		<div class="footer">
			<div class="content">
				<div class="copyright">SHELL &copy; 2012</div>
				<div class="links">
					<a href="http://www.facebook.com/platform">关于</a> <a
						href="http://developers.facebook.com/policy/">平台政策</a> <a
						href="http://www.facebook.com/policy.php">隐私政策</a> <a
						href="http://www.facebook.com/policy.php">自定义页脚</a>
				</div>
			</div>
		</div>
		<!-- 页脚div 结束 -->
</body>
</html>