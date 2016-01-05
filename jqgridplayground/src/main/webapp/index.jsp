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

</head>
<body>
	<h2>jqGrid Playground</h2>
	<article>This playground is showing how to achieve some of
		the features in jqGrid.</article>

	<div>
		<div id="grid1wrapper">
			<table id="grid1"></table>
			<!-- 
			<div id="grid1-nav"></div>
			 -->
		</div>
		
		<div id="grid2wrapper">
			<table id="grid2"></table>
		</div>
	</div>




	<script type="text/javascript">
	$(document).ready(function() {
		var template = '<%@ include file="jqGrid1InputForm.jsp" %>';
		
		// agent grid
		$('#grid1').jqGrid({
			url: 'agent.json',
			editurl: 'clientArray',
			datatype: 'json',
			colModel: [
			    {
					label: 'Agent ID',
					name: 'AgentID',
					width: 50,
					rowId: true,
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
			    	label: 'Traget Quota',
			    	name: 'AgentQuota',
			    	width: 100,
			    	editable: true
			    },
			    {
			    	label: 'Target Reached',
			    	name: 'TargetReached',
			    	width: 60,
			    	formatter: 'select',
			    	editable: true,
			    	edittype: 'select',
			    	editoptions: {
			    		value: ':Undefined;Y:Achieved;N:In Progress',
			    		defaultValue: ''
			    	},
			    	stype: 'select',
			    	searchoptions: {
			    		sopt: ['eq', 'ne'],
			    		value: ':Undefined;Y:Achieved;N:In Progress'
			    	}
			    },
			    {
			    	label: 'On Vacation',
			    	name: 'OnVacation',
			    	width: 40,
			    	template: "booleanCheckboxFa",
			    	editable: true
			    },
			    {
			    	label: 'Action Button',
			    	name: '',
			    	width: 40,
			    	search: false,
			    	sortable: false,
			    	formatter: actionButtonFunc
			    }
			],
			sortname: 'AgentID',
			sortorder: 'asc',
			loadonce: true,
			viewrecords: true,
			width: 780,
			height: 150,
			caption: "Agent List",
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
            },
            onSelectRow: function(id, status, e) {
            	if (status === true) {
            		$('#grid2').jqGrid('setGridParam', {
                		url: 'agent-sales-' + id + '.json',
                		page: 1
                	}).trigger('reloadGrid');
                	var agentName = $('#grid1').jqGrid().getRowData(id).AgentName;
                	$('#grid2').jqGrid('setCaption', 'Agent Sales Detail - ' + agentName);
                	
                	if ($('#grid2wrapper').is(':hidden')) {
                		$('#grid2wrapper').show();
                	}
            	}
            	else {
            		if ($('#grid2wrapper').is(':visible')) {
                		$('#grid2wrapper').hide();
                	}
            	}
            }
		});
		$('#grid1').jqGrid('navGrid');
		
		// agent sales grid
		$('#grid2').jqGrid({
			url: 'agent-sales-1.json',
			editurl: 'clientArray',
			datatype: 'json',
			colModel: [
			    {
			    	label: 'Deal Name',
			    	name: 'DealName',
			    	width: 140,
			    	editable: true
			    },
			    {
			    	label: 'Turnover',
			    	name: 'Turnover',
			    	width: 100,
			    	editable: true
			    }
			],
			sortname: 'Turnover',
			sortorder: 'desc',
			loadonce: false,
			viewrecords: true,
			width: 780,
			height: 150,
			caption: "Agent Sales Detail",
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
		$('#grid2').jqGrid('navGrid');
		
		function actionButtonFunc(cellValue, options, rowData, action) {
			return '<button onclick="alert(' + rowData.AgentID + ')">Show ID</button>'
		}
		
		// hide grid2 during initialisation
		$('#grid2wrapper').hide();
		
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
