/*!
 * TableExport.js v3.2.0 (http://www.clarketravis.com)
 * Copyright 2015 Travis Clarke
 * Licensed under the MIT license
 */

;(function (window, undefined) {

    /*--- GLOBALS ---*/
    var $ = window.jQuery;

    $.fn.tableExport = function (options) {

        var settings = $.extend({}, $.fn.tableExport.defaults, options),
            rowD = $.fn.tableExport.rowDel,
            ignoreRows = settings.ignoreRows instanceof Array ? settings.ignoreRows : [settings.ignoreRows],
            ignoreCols = settings.ignoreCols instanceof Array ? settings.ignoreCols : [settings.ignoreCols],
            bootstrapClass, bootstrapTheme, bootstrapSpacing;

        if (settings.bootstrap) {
            bootstrapClass = $.fn.tableExport.bootstrap[0] + " ";
            bootstrapTheme = $.fn.tableExport.bootstrap[1] + " ";
            bootstrapSpacing = $.fn.tableExport.bootstrap[2] + " ";
        } else {
            bootstrapClass = $.fn.tableExport.defaultButton + " ";
            bootstrapTheme = bootstrapSpacing = "";
        }

        this.each(function () {        	
            var $el = $(this),
                $rows = $el.find('tbody').find('tr'),
                $rows = settings.headings ? $rows.add($el.find('thead>tr')) : $rows,
                $rows = settings.footers ? $rows.add($el.find('tfoor>tr')) : $rows,
                thAdj = settings.headings ? $el.find('thead>tr').length : 0,
                fileName = settings.fileName === "id" ? ($el.attr('id') ? $el.attr('id') : $.fn.tableExport.defaultFileName) : settings.fileName,
                exporters = {
                    xlsx: function (rDel, name) {
                    	var dataURL = $rows.map(function (i, val) {
                            if (!!~ignoreRows.indexOf(i-thAdj)) { return;}
                            var $cols = $(val).find('th, td');
                            return [$cols.map(function (i, val) {
                                if (!!~ignoreCols.indexOf(i)) { return;}
                                return $(val).text();
                            }).get()];
                        }).get(),
                        dataObject = escapeHtml(
                            JSON.stringify({
                                data: dataURL,
                                fileName: name,
                                mimeType: $.fn.tableExport.xlsx.mimeType,
                                fileExtension: $.fn.tableExport.xlsx.fileExtension
                            })),
                        myContent = $.fn.tableExport.xlsx.buttonContent,
                        myClass = $.fn.tableExport.xlsx.defaultClass;                      	
                        createObjButton(dataObject, myContent, myClass);
                       for (var i=0;i<$rows.length;i++) {
                    		$($rows[i]).find("a").click(function () {
                    			$(this).parents("tr").remove();                    		
                    			return $rows = $el.find('tbody').find('tr');                    			
                    		})
                    		
                    	}

                    },
                    xls: function (rdel, name) {
//                      var colD = $.fn.tableExport.xls.separator,
//                          dataURL = $rows.map(function (i, val) {
//                              if (!!~ignoreRows.indexOf(i-thAdj)) { return;}
//                              var $cols = $(val).find('th, td');
//                              return $cols.map(function (i, val) {
//                                  if (!!~ignoreCols.indexOf(i)) { return;}
//                                  return $(val).text();
//                              }).get().join(colD);
//                          }).get().join(rdel),
//                          dataObject = escapeHtml(
//                              JSON.stringify({
//                                  data: dataURL,
//                                  fileName: name,
//                                  mimeType: $.fn.tableExport.xls.mimeType,
//                                  fileExtension: $.fn.tableExport.xls.fileExtension
//                              })),
//                          myContent = $.fn.tableExport.xls.buttonContent,
//                          myClass = $.fn.tableExport.xls.defaultClass;
//                      createObjButton(dataObject, myContent, myClass);
                    },
                    csv: function (rdel, name) {
//                      var colD = $.fn.tableExport.csv.separator,
//                          dataURL = $rows.map(function (i, val) {
//                              if (!!~ignoreRows.indexOf(i-thAdj)) { return;}
//                              var $cols = $(val).find('th, td');
//                              return $cols.map(function (i, val) {
//                                  if (!!~ignoreCols.indexOf(i)) { return;}
//                                  return $(val).text();
//                              }).get().join(colD);
//                          }).get().join(rdel),
//                          dataObject = escapeHtml(
//                              JSON.stringify({
//                                  data: dataURL,
//                                  fileName: name,
//                                  mimeType: $.fn.tableExport.csv.mimeType,
//                                  fileExtension: $.fn.tableExport.csv.fileExtension
//                              })),
//                          myContent = $.fn.tableExport.csv.buttonContent,
//                          myClass = $.fn.tableExport.csv.defaultClass;
//                      createObjButton(dataObject, myContent, myClass);
                    },
                    txt: function (rdel, name) {
//                      var colD = $.fn.tableExport.txt.separator,
//                          dataURL = $rows.map(function (i, val) {
//                              if (!!~ignoreRows.indexOf(i-thAdj)) { return;}
//                              var $cols = $(val).find('th, td');
//                              return $cols.map(function (i, val) {
//                                  if (!!~ignoreCols.indexOf(i)) { return;}
//                                  return $(val).text();
//                              }).get().join(colD);
//                          }).get().join(rdel),
//                          dataObject = escapeHtml(
//                              JSON.stringify({
//                                  data: dataURL,
//                                  fileName: name,
//                                  mimeType: $.fn.tableExport.txt.mimeType,
//                                  fileExtension: $.fn.tableExport.txt.fileExtension
//                              })),
//                          myContent = $.fn.tableExport.txt.buttonContent,
//                          myClass = $.fn.tableExport.txt.defaultClass;
//                      createObjButton(dataObject, myContent, myClass);
                    }
                };

            settings.formats.forEach(
                function (key) {
                    exporters[key](rowD, fileName);
                }
            );

            function checkCaption(exportButton) {
                var $caption = $el.find('caption:not(.head)');              
                $caption.length ? $caption.append(exportButton) : $el.prepend('<caption contenteditable="false" class="' + bootstrapSpacing + settings.position + '" style="text-align:right;">' + exportButton + '</caption>');
            }

            function createObjButton(dataObject, myContent, myClass) {
                var exportButton = "<button data-fileblob='" + dataObject + "' class='" + bootstrapClass + bootstrapTheme + myClass + "'style='float:right;'>" + myContent + "</button>";
                checkCaption(exportButton);
                
            }
        });
		
		//底部导出按钮点击事件
        $("button[data-fileblob]").on("click", function () {               
                var userlist=new Array();	
				var rs = document.getElementById("test_table").rows;		
		   		for(var i = 0; i < rs.length; i++){     		
		   			userlist[i]=new Array();
		    	 	for(var j = 0;j<rs[i].cells.length-1; j++){
		    	 		if(j!=0 && j<14){    	 		
		    	 			userlist[i][j-1]=rs[i].cells[j].innerHTML;    	 			 	 			
		    	 		}    	 				
		    	 	}    	 	
				}    
          	var object = $(this).data("fileblob"),
	            data = userlist;
	            fileName = object.fileName,
             	mimeType = object.mimeType,
              	fileExtension = object.fileExtension;
          		export2file(data, mimeType, fileName, fileExtension);
        });
    };

    // Define the plugin default properties.
    $.fn.tableExport.defaults = {
        headings: true,                             // (Boolean), display table headings (th or td elements) in the <thead>, (default: true)
        footers: true,                              // (Boolean), display table footers (th or td elements) in the <tfoot>, (default: false)
        formats: ["xls", "csv", "txt"],             // (String[]), filetype(s) for the export, (default: ["xls", "csv", "txt"])
        fileName: "id",                             // (id, String), filename for the downloaded file, (default: "id")
        bootstrap: true,                            // (Boolean), style buttons using bootstrap, (default: true)
        position: "bottom",                         // (top, bottom), position of the caption element relative to table, (default: "bottom")
        ignoreRows: null,                           // (Number, Number[]), row indices to exclude from the exported file (default: null)
        ignoreCols: [12,0]                            // (Number, Number[]), column indices to exclude from the exported file (default: null)
    };

    $.fn.tableExport.charset = "charset=utf-8";

    $.fn.tableExport.xlsx = {
        defaultClass: "xlsx",
        buttonContent: "导出(.xlsx)",
        mimeType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        fileExtension: ".xlsx"
    };

    $.fn.tableExport.xls = {
        defaultClass: "xls",
        buttonContent: "导出(.xls)",
        separator: "\t",
        mimeType: "application/vnd.ms-excel",
        fileExtension: ".xls"
    };

    $.fn.tableExport.csv = {
        defaultClass: "csv",
        buttonContent: "导出(.csv)",
        separator: ",",
        mimeType: "application/csv",
        fileExtension: ".csv"
    };

    $.fn.tableExport.txt = {
        defaultClass: "txt",
        buttonContent: "导出(.txt)",
        separator: "  ",
        mimeType: "text/plain",
        fileExtension: ".txt"
    };

    $.fn.tableExport.defaultFileName = "product";

    $.fn.tableExport.defaultButton = "button-default";

    $.fn.tableExport.bootstrap = ["btn", "btn-default", "btn-toolbar"];

    $.fn.tableExport.rowDel = "\r\n";

    $.fn.tableExport.entityMap = {"&": "&#38;", "<": "&#60;", ">": "&#62;", "'": '&#39;', "/": '&#47'};

    function escapeHtml(string) {
        return String(string).replace(/[&<>'\/]/g, function (s) {
            return $.fn.tableExport.entityMap[s];
        });
    }

    function dateNum(v, date1904) {
        if (date1904) v += 1462;
        var epoch = Date.parse(v);
        return (epoch - new Date(Date.UTC(1899, 11, 30))) / (24 * 60 * 60 * 1000);
    }

    function createSheet(data, opts) {
        var ws = {};
        var range = {s: {c: 10000000, r: 10000000}, e: {c: 0, r: 0}};
        for (var R = 0; R != data.length; ++R) {
            for (var C = 0; C != data[R].length; ++C) {
                if (range.s.r > R) range.s.r = R;
                if (range.s.c > C) range.s.c = C;
                if (range.e.r < R) range.e.r = R;
                if (range.e.c < C) range.e.c = C;
                var cell = {v: data[R][C]};
                if (cell.v == null) continue;
                var cell_ref = XLSX.utils.encode_cell({c: C, r: R});

                if (typeof cell.v === 'number') cell.t = 'n';
                else if (typeof cell.v === 'boolean') cell.t = 'b';
                else if (cell.v instanceof Date) {
                    cell.t = 'n';
                    cell.z = XLSX.SSF._table[14];
                    cell.v = dateNum(cell.v);
                }
                else cell.t = 's';

                ws[cell_ref] = cell;
            }
        }
        if (range.s.c < 10000000) ws['!ref'] = XLSX.utils.encode_range(range);
        return ws;
    }

    function Workbook() {
        if (!(this instanceof Workbook)) return new Workbook();
        this.SheetNames = [];
        this.Sheets = {};
    }

    function string2ArrayBuffer(s) {
        var buf = new ArrayBuffer(s.length);
        var view = new Uint8Array(buf);
        for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
        return buf;
    }

    function export2file(data, mime, name, extension) {
        if (extension === ".xlsx") {
            var wb = new Workbook(),
                ws = createSheet(data);

            wb.SheetNames.push(name);
            wb.Sheets[name] = ws;

            var wopts = {bookType: 'xlsx', bookSST: false, type: 'binary'},
                wbout = XLSX.write(wb, wopts);

            data = string2ArrayBuffer(wbout);
        }
        saveAs(new Blob([data],
            {type: mime + ";" + $.fn.tableExport.charset}),
            name + extension);
    }

}(window));