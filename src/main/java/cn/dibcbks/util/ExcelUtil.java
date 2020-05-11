package cn.dibcbks.util;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;

/**  
 * @Title: ExcelUtil.java
 * @Package cn.dibcbks.util
 * @Description: TODO(描述)
 * @author WuPeiLong
 * @date 2020年5月11日
 * @Company 贵州指上通科技有限责任公司
 * @version: V1.0
 */

public class ExcelUtil {
	 private static final String HSSF_WORK_BOOK = "hssf_work_book";
	    private static final String HSSF_SHEET = "hssf_sheet";
	    private static final String HSSF_FONT = "hssf_font";
	    private static final String HSSF_CELL_STYLE_HEAD = "style_head";
	    private static final String HSSF_CELL_STYLE_BODY = "style_body";
	    private static final String PRODUCT_IMAGE_PREFIX = "http://file.xzncmsc.com/";
	    private static final Short SHEET_ROW_COLUMN_WIDTH = 15*256;
	    private static final Short SHEET_ROW_COLUMN_HIGHT = 2000;

	    /**
	     * @author: wupeilong
	     * @description: 判断合并是否了行
	     * @date: 2019-08-16 下午 16:32:45
	     * @param: [sheet, row, column]
	     * @return: boolean
	     */
	    public static boolean isMergedRow(Sheet sheet,int row ,int column) {
	        int sheetMergeCount = sheet.getNumMergedRegions();
	        for (int i = 0; i < sheetMergeCount; i++) {
	            CellRangeAddress range = sheet.getMergedRegion(i);
	            int firstColumn = range.getFirstColumn();
	            int lastColumn = range.getLastColumn();
	            int firstRow = range.getFirstRow();
	            int lastRow = range.getLastRow();
	            if(row == firstRow && row == lastRow){
	                if(column >= firstColumn && column <= lastColumn){
	                    return true;
	                }
	            }
	        }
	        return false;
	    }

	    /**
	     * @author: wupeilong
	     * @description: 判断指定的单元格是否是合并单元格
	     * @date: 2019-08-16 下午 16:32:02
	     * @param: [sheet, row, column]
	     * @return: boolean
	     */
	    public static boolean isMergedRegion(Sheet sheet, int row, int column) {
	        int sheetMergeCount = sheet.getNumMergedRegions();
	        for (int i = 0; i < sheetMergeCount; i++) {
	            CellRangeAddress range = sheet.getMergedRegion(i);
	            int firstColumn = range.getFirstColumn();
	            int lastColumn = range.getLastColumn();
	            int firstRow = range.getFirstRow();
	            int lastRow = range.getLastRow();
	            if(row >= firstRow && row <= lastRow){
	                if(column >= firstColumn && column <= lastColumn){
	                    return true;
	                }
	            }
	        }
	        return false;
	    }


	    /**
	     * @author: wupeilong
	     * @description: 判断sheet页中是否含有合并单元格
	     * @date: 2019-08-16 下午 16:31:44
	     * @param: [sheet]
	     * @return: boolean
	     */
	    public static boolean hasMerged(Sheet sheet) {

	        return sheet.getNumMergedRegions() > 0 ? true : false;
	    }


	    /**
	     * @author: wupeilong
	     * @description: 合并单元格
	     * @date: 2019-08-16 下午 16:31:11
	     * @param: [sheet, firstRow, lastRow, firstCol, lastCol]
	     * @return: void
	     */
	    public static void mergeRegion(Sheet sheet, int firstRow, int lastRow, int firstCol, int lastCol) {
	        sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, firstCol, lastCol));
	    }


	    /**
	     * @author: wupeilong
	     * @description: 获取单元格的值
	     * @date: 2019-08-16 下午 16:30:54
	     * @param: [cell]
	     * @return: java.lang.String
	     */
	    public static String getCellValue(Cell cell){
	        if(cell == null){
	            return "";
	        }
	        if(CellType.STRING.equals(cell.getCellType())){
	            return cell.getStringCellValue();
	        }else if(CellType.BOOLEAN.equals(cell.getCellType())){
	            return String.valueOf(cell.getBooleanCellValue());
	        }else if(CellType.FORMULA.equals(cell.getCellType())){
	            return cell.getCellFormula();
	        }else if(CellType.NUMERIC.equals(cell.getCellType())){
	            if (HSSFDateUtil.isCellDateFormatted(cell)) {
	                return new SimpleDateFormat("yyyy-MM-dd").format(cell.getDateCellValue());
	            }
	            return String.valueOf(cell.getNumericCellValue());
	        }
	        return "";
	    }

	    /**
	     * @author: wupeilong
	     * @description: 获取合并单元格的值
	     * @date: 2019-08-16 下午 16:33:30
	     * @param: [sheet, row, column]
	     * @return: java.lang.String
	     */
	    public static String getMergedRegionValue(Sheet sheet ,int row , int column){
	        //获得该sheet所有合并单元格数量
	        int sheetMergeCount = sheet.getNumMergedRegions();
	        for(int i = 0 ; i < sheetMergeCount ; i++){
	            // 获得合并区域
	            CellRangeAddress ca = sheet.getMergedRegion(i);
	            int firstColumn = ca.getFirstColumn();
	            int lastColumn = ca.getLastColumn();
	            int firstRow = ca.getFirstRow();
	            int lastRow = ca.getLastRow();
	            //判断传入的单元格的行号列号是否在合并单元格的范围内，如果在合并单元格的范围内，择返回合并区域的首单元格格值
	            if(row >= firstRow && row <= lastRow){
	                if(column >= firstColumn && column <= lastColumn){
	                    Row fRow = sheet.getRow(firstRow);
	                    Cell fCell = fRow.getCell(firstColumn);
	                    return getCellValue(fCell) ;
	                }
	            }
	        }
	        //如果该单元格行号列号不在任何一个合并区域，择返回null
	        return null ;
	    }

	    /**
	     * @author: wupeilong
	     * @description: 导出Excel
	     * @date: 2019-10-23 下午 16:56:06
	     * @param: [response, fileName, workbook]
	     * @return: void
	     */
	    public static void exportExcel(HttpServletResponse response, String fileName, HSSFWorkbook workbook) {
	        try {
	            try {
	                fileName = new String(fileName.getBytes(),"ISO8859-1");
	            } catch (UnsupportedEncodingException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	            response.setContentType("application/vnd.ms-excel");
	            response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
	            response.addHeader("Pragma", "No-cache");
	            response.addHeader("Cache-Control", "No-cache");
	            response.setDateHeader("Expires", 0);
	            OutputStream os = response.getOutputStream();
	            workbook.write(os);
	            os.flush();
	            os.close();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }

	    /**
	     * @author: wupeilong
	     * @description:
	     * @date: 2019-10-24 上午 10:24:59
	     * @param: [sheetName]
	     * @return: java.util.Map<java.lang.String,java.lang.Object>
	     */
	    public static Map<String,Object> getHSSFWorkbootTemplate(String sheetName){
	        Map<String,Object> HSSFWorkbootMap = new HashMap<>();

	        // 创建一个HSSFWorkbook，对应一个Excel文件
	        HSSFWorkbook wb = new HSSFWorkbook();

	        // 在workbook中添加一个sheet,对应Excel文件中的sheet
	        HSSFSheet sheet = wb.createSheet(sheetName);

	        // 设置字体
	        HSSFFont font = wb.createFont();
	        font.setFontHeightInPoints((short) 12); //字体高度
	        font.setColor(HSSFFont.COLOR_NORMAL); //字体颜色
	        font.setFontName("黑体"); //字体
	        font.setBold(true);//加粗

	        // 创建单元格，并设置值表头 设置表头居中
	        HSSFCellStyle styleHead = wb.createCellStyle();
	        styleHead.setAlignment(HorizontalAlignment.CENTER); // 创建一个居中格式
	        styleHead.setVerticalAlignment(styleHead.getVerticalAlignmentEnum().CENTER);
	        styleHead.setFont(font);
	        styleHead.setWrapText(true);
	        styleHead.setBorderBottom(BorderStyle.THIN);
	        styleHead.setBorderTop(BorderStyle.THIN);
	        styleHead.setBorderRight(BorderStyle.THIN);
	        styleHead.setBorderLeft(BorderStyle.THIN);
	        styleHead.setFillBackgroundColor(IndexedColors.GREY_25_PERCENT.index);// 设置背景色
	        styleHead.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);// 设置前景色
	        styleHead.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	        //小标题格式
	        HSSFCellStyle styleBody = wb.createCellStyle();
	        styleBody.setAlignment(HorizontalAlignment.CENTER);//居中对齐
	        styleBody.setVerticalAlignment(styleBody.getVerticalAlignmentEnum().CENTER);
	        styleBody.setWrapText(true);//文字换行
	        styleBody.setFont(font);//设置字体
	        styleBody.setBorderBottom(BorderStyle.THIN);
	        styleBody.setBorderTop(BorderStyle.THIN);
	        styleBody.setBorderRight(BorderStyle.THIN);
	        styleBody.setBorderLeft(BorderStyle.THIN);

	        HSSFWorkbootMap.put(HSSF_WORK_BOOK,wb);
	        HSSFWorkbootMap.put(HSSF_SHEET,sheet);
	        HSSFWorkbootMap.put(HSSF_FONT,font);
	        HSSFWorkbootMap.put(HSSF_CELL_STYLE_HEAD,styleHead);
	        HSSFWorkbootMap.put(HSSF_CELL_STYLE_BODY,styleBody);

	        return HSSFWorkbootMap;
	    }


	    /**
	     * @author: zhangy
	     * @description: 导出excel
	     * @date: 2019/06/19 下午 04:58
	     * @param: [sheetName, title, values, wb]
	     * @return: org.apache.poi.hssf.usermodel.HSSFWorkbook
	     */
	    public static HSSFWorkbook getHSSFWorkbook(String sheetName, String[] title, String[][] values) {

	        Map<String,Object> HSSFWorkbookMap = getHSSFWorkbootTemplate(sheetName);
	        // 创建一个HSSFWorkbook，对应一个Excel文件
	        HSSFWorkbook wb = (HSSFWorkbook)HSSFWorkbookMap.get(HSSF_WORK_BOOK);
	        // 在workbook中添加一个sheet,对应Excel文件中的sheet
	        HSSFSheet sheet = (HSSFSheet)HSSFWorkbookMap.get(HSSF_SHEET);
	        // 设置字体
	        HSSFFont font = (HSSFFont)HSSFWorkbookMap.get(HSSF_FONT);
	        // 创建单元格，并设置值表头 设置表头居中
	        HSSFCellStyle styleHead = (HSSFCellStyle)HSSFWorkbookMap.get(HSSF_CELL_STYLE_HEAD);
	        //小标题格式
	        HSSFCellStyle styleBody = (HSSFCellStyle)HSSFWorkbookMap.get(HSSF_CELL_STYLE_BODY);
	        //声明列对象
	        HSSFCell cell = null;
	        //声明行对象
	        HSSFRow row = sheet.createRow(0);

	        //创建标题
	        for (int i = 0; i < title.length; i++) {
	            sheet.setColumnWidth(i, title[i].getBytes().length*2*256);
	            cell = row.createCell(i);
	            cell.setCellValue(title[i]);
	            cell.setCellStyle(styleHead);
	        }

	        //创建内容
	        for (int i = 0; i < values.length; i++) {
	            row = sheet.createRow(i + 1);
	            for (int j = 0; j < values[i].length; j++) {
	                //将内容按顺序赋给对应的列对象
	                cell = row.createCell(j);
	                cell.setCellValue(values[i][j]);
	                cell.setCellStyle(styleBody);
	            }
	        }
	        return wb;
	    }
}
