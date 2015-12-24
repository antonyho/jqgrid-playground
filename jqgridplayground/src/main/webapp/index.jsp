<html>
<head>
<title>jqGrid Playground</title>
<!-- jQuery 2.1.4 (https://code.jquery.com/) -->
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- 
<link ref="stylesheet" type="text/css" media="screen"
	href="https://code.jquery.com/ui/1.11.4/themes/start/jquery-ui.css">
 -->

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/redmond/jquery-ui.css">

<!-- 
<link ref="stylesheet"
	href="https://code.jquery.com/ui/1.11.4/themes/excite-bike/jquery-ui.css">
 -->
<!-- 
<link ref="stylesheet"
	href="https://code.jquery.com/ui/1.11.4/themes/hot-sneaks/jquery-ui.css">
 -->
 
<!-- Font Awesome -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- free jqGrid 4.11.1 (https://cdnjs.com/libraries/free-jqgrid) -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.11.1/js/jquery.jqgrid.min.js"></script>

<!-- 
<script src="http://rawgit.com/free-jqgrid/jqGrid/master/js/jquery.jqgrid.src.js"></script>
 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.11.1/js/i18n/grid.locale-en.min.js"></script>

<!-- 
<script src="http://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.8.0/js/i18n/grid.locale-en.js"></script>
 -->
<!-- 
<link rel="stylesheet" type="text/css" media="screen"
	href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.11.1/css/ui.jqgrid.min.css">
 -->

<link rel="stylesheet" type="text/css" href="http://rawgit.com/free-jqgrid/jqGrid/master/css/ui.jqgrid.css"/>


</style>
</head>
<body>
	<h2>jqGrid Playground</h2>
	<article>This playground is showing how to achieve some of
		the features in jqGrid.</article>
	
	<table id="grid1"></table>
	<!-- 
	<div id="grid1-nav"></div>
	 -->



	<script type="text/javascript">
	$(document).ready(function() {
		var template = '<%@ include file="jqGrid1InputForm.jsp" %>';
		
		$('#grid1').jqGrid({
			url: 'agent.json',
			editurl: 'clientArray',
			datatype: 'json',
			colModel: [
			    {
					label: 'Agent ID',
					name: 'AgentID',
					width: 50,
					editable: true,
					editrules: {required: true}
			    },
			    {
			    	label: 'Agent Name',
			    	name: 'AgentName',
			    	width: 140,
			    	editable: true
			    },
			    {
			    	label: 'Agent Quota',
			    	name: 'AgentQuota',
			    	width: 100,
			    	editable: true
			    }
			],
			sortname: 'AgentID',
			sortorder: 'asc',
			loadonce: true,
			viewrecords: true,
			width: 780,
			height: 150,
			caption: "My Demo",
			rownum: 5,
			rowList: [5, 10, 20, "10000:All" ],
			pager: true,
			iconSet: 'fontAwesome',
			navOptions: {
				edit: true,
				add: true,
				del: true,
				search: true,
				refresh: true,
				view: true,
				position: 'left',
				cloneToTop: false
			},
            searching: {
            	closeAfterSearch: true,
            	closeAfterReset: true,
            	closeOnEscape: true,
            	searchOnEnter: true,
            	multipleSearch: true,
            	multipleGroup: true,
            	showQuery: true
            }
		});
		$('#grid1').jqGrid('navGrid');
		
		/*
		$('#grid1').navGrid('#grid1-nav',
				// the buttons to appear on the toolbar of the grid
				{ edit: true, add: true, del: true, search: true, refresh: true, view: true, position: 'left', cloneToTop: false },
				{	// options for the Edit Dialog
					editCaption: 'Edit Agent Information',
					template: template,
					errorTextFormat: function(data) {
						return 'Error: ' + data.responseText;
					}
				},
				{	// options for the Add Dialog
					template: template,
					errorTextFormat: function(data) {
						return 'Error: ' + data.responseText;
					}
				},
				{	// options for the Delete Dailog
					errorTextFormat: function(data) {
						return 'Error: ' + data.responseText;
					}
				}
		);
		*/
	});
	</script>
</body>
</html>
