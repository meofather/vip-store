/**   
 * @Title: MathOperator.java 
 * @Package: com.myph.common.util
 * @company: 麦芽金服
 * @Description: TODO
 * @date 2016年10月26日 上午11:13:27 
 * @version V1.0   
 */
package com.lr.util;

import java.io.File;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;

/** 
 * @ClassName: MathOperator 
 * @Description: TODO
 * @author hf 
 * @date 2016年10月26日 上午11:13:27 
 *  
 */
public class MathOperator {
	    public static void main(String args[]) throws ParseException{
	    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
	    			"MM月dd日 HH:mm");
	    	SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(
	    			"yyyy-MM-dd");
	    	System.out.println(simpleDateFormat.format(simpleDateFormat2.parse("2015-5-5")));
//	    	String b="上海市嘉定区新郁路68弄";
//	    	String c="(人民币)叁万元整";
//	    	String a="23.46";
//	    	//System.out.println("dddd="+getDimeConvertPenny(new Double("18989.99").doubleValue()));
//	    	//System.out.println("dddd="+getPennyConvertDime(new Double("1019.00").doubleValue()));
//	    	double f=2.34;
//	    	//if(f==0){
//	    	//DecimalFormat format = new DecimalFormat("##0");
//	    	String w="23400.33";
//	    	String w1="2222.00";
//	    	String w2="5000.00";
//	    	String w3="60000.00";
//	    	
//	    	System.out.println("endRec=="+ getUpInt(w));
//	    	System.out.println("endRec=="+ getUpInt(w1));
//	    	System.out.println("endRec=="+ getUpInt(w2));
//	    	System.out.println("endRec=="+ getUpInt(w3));
	//
//	    	//System.out.println("endRec=="+GetFindCount("安徽省市庐阳区合瓦路251号1幢1号","合肥"));
//	    	String x="安徽省合肥市庐阳区合瓦路251号1幢1号";
//	    	String v="合肥";
//	    	 if(x.indexOf(v)!=-1){
//	    		 System.out.println("aaaa==");
//	    	 }
	    	//}
	    		/*int excelDiv=60000;
	    		int recordDiv=3;
	    		for(int i=0;i<recordDiv;i++){
					int startRec=excelDiv*i+1;
					int endRec=excelDiv*(i+1);
					System.out.println("startRec=="+startRec);
					System.out.println("endRec=="+endRec);
	    		}
	    	 */
	       
	    }
	    
	    /**
	     * 功能：获取整数：例如2222.00为3000
	     * @param str String
	     * @return 返回int类型
	     */
	    public static int getUpInt(String str) {
	        int rslt = 0;
	        if (str == null || str.trim().equals("")) {
	            return rslt;
	        }
	        str = str.trim();
	        int pos=str.indexOf(".");
	        String startStr=str.substring(0,pos);
	       // 5500
	      //  23300
	        if(startStr.length()<=3){
	        	rslt=1000;
	        }
	        else{
	        	String beginStr=startStr.substring(0,startStr.length()-3);
	        	String endStr=startStr.substring(startStr.length()-3);
	        	if(endStr.equals("000")){
	        		rslt=new Integer(startStr).intValue();
	        	}
	        	else{
	        		Integer upInteger=new Integer(beginStr)+1;
	        		String tempStr=upInteger.toString()+"000";
	        		rslt=new Integer(tempStr).intValue();
	        	}
	        	
	        }

	        return rslt;
	    }
	    
	    
	    /**
	     * 功能：获取整数：例如22.33结果为23,22.00为22
	     * @param str String
	     * @return 返回int类型
	     */
	    public static int getInt(String str) {
	        int rslt = 0;
	        if (str == null || str.trim().equals("")) {
	            return rslt;
	        }
	        str = str.trim();
	        int pos=str.indexOf(".");
	        String startStr=str.substring(0,pos);
	        String endStr=str.substring(pos+1);
	        if (new Long(endStr)>0) {
	            rslt=new Integer(startStr).intValue()+1;
	        }
	        else{
	        	 rslt=new Integer(startStr).intValue();
	        }
	        return rslt;
	    }

	    
	    //元转分
	    public static long getDimeConvertPenny(double dime){
	        double d = 0;
	        if(dime!=0){
		        String dimeStr=String.valueOf(dime);
		        String[] dimeAry=dimeStr.split("\\.");
		        int len=dimeAry.length;
		        if(len==1){
		        	d=new Double(dimeStr+"00").doubleValue();
		        }
		        else{
		        	int dimePenny=new Integer(dimeAry[1]).intValue();
		        	if(dimePenny==0){
		        		d=new Double(dimeAry[0]+"00").doubleValue();
		        	}
		        	else{
		        		int length=dimeAry[1].length();
		        		if(length==1){
		        			d=new Double(dimeAry[0]+dimeAry[1]+"0").doubleValue();
		        		}
		        		else{
		        			d=new Double(dimeAry[0]+dimeAry[1]).doubleValue();
		        		}
		        	}
		        }
	        }
	        return (long)d;    
	    }
	    
	    //分转元
	    public static double getPennyConvertDime(double dime){
	        double d = 0;
	        if(dime!=0){
		        String dimeStr=String.valueOf((long)dime);
		        String[] dimeAry=dimeStr.split("\\.");
		        int len=dimeAry.length;
		        String tempDimeStr1="";
		        String tempDimeStr2="";
		        if(len==1){
		        	if(dimeStr.length()==1){
			            tempDimeStr2="0"+dimeStr;
		        	}
		        	else{
			            tempDimeStr1=dimeStr.substring(0,dimeStr.length()-2);
			            tempDimeStr2=dimeStr.substring(dimeStr.length()-2);
		        	}
		        }
		        else{
		        	if(dimeAry[0].length()==1){
		        		tempDimeStr2="0"+dimeAry[0];
		        	}
		        	else{
		        		tempDimeStr1=dimeAry[0].substring(0,dimeAry[0].length()-2);
			            tempDimeStr2=dimeAry[0].substring(dimeAry[0].length()-2);
		        	}
		        }
		        d=new Double(tempDimeStr1+"."+tempDimeStr2).doubleValue();
	        }
	        return d;    
	    }
	    
	    public static int getStringNumber(String stringNum){
	        String str = null;
	        int num = 0;
	        if(stringNum != null){
	            for(int i = 0; i < stringNum.length(); i++) { 
	                char c = stringNum.charAt(i); 
	                if(c >= '0' && c <= '9' || c == '.'){
	                    if(str != null){
	                        str = str + Character.toString(c);
	                    }
	                    else{
	                         str = Character.toString(c);
	                    }                   
	                }
	            }
	            if(str != null){
	                num = Integer.parseInt(str);
	            }
	        }
	        return num;    
	    }
	    
	    /**  
	     * 删除单个文件  
	     * @param   sPath    被删除文件的文件名  
	     * @return 单个文件删除成功返回true，否则返回false  
	     */  
	    public static boolean deleteFile(String sPath) {   
	       boolean flag = false;   
	        File file = new File(sPath);   
	        // 路径为文件且不为空则进行删除   
	        if (file.isFile() && file.exists()) {   
	            file.delete();   
	            flag = true;   
	        }   
	        return flag;   
	    }  
	    
	    //删除目录下文件
	    public static void deletePath(String filepath) throws Exception { 
	    	File f = new File(filepath);//定义文件路径          
	        if(f.exists() && f.isDirectory()){//判断是文件还是目录   
		       //若有则把文件放进数组，并判断是否有下级目录   
		       File delFile[]=f.listFiles();   
		       int i =f.listFiles().length;   
		       for(int j=0;j<i;j++){   
		           if(delFile[j].isDirectory()){   
		        	   deletePath(delFile[j].getAbsolutePath());//递归调用del方法并取得子目录路径   
		            }   
		            delFile[j].delete();//删除文件   
		       }
	        }
	    }


	    
	    /**  
	     * 解压缩  
	     * @param destDir 生成的目标目录下   c:/a  
	     * @param sourceZip 源zip文件      c:/upload.zip  
	     * 结果则是 将upload.zip文件解压缩到c:/a目录下  
	     */  
	    public static void unZip(String destDir,String sourceZip){        
	        try{   
	            Project prj1 = new Project();   
	               
	            Expand expand = new Expand();   
	               
	            expand.setProject(prj1);   
	            expand.setEncoding("GBK");
	               
	            expand.setSrc(new File(sourceZip));   
	               
	            expand.setOverwrite(false);//是否覆盖   
	  
	            File f = new File(destDir);   
	               
	            expand.setDest(f);   
	               
	            expand.execute();   
	        } 
	        catch(Exception e) {   
	            e.printStackTrace();   
	        }   
	    }   
	  
	  
	    /**  
	     * 压缩  
	     *   
	     * @param sourceFile  
	     *            压缩的源文件 如: c:/upload  
	     * @param targetZip  
	     *            生成的目标文件 如：c:/upload.zip  
	     */  
	    public static void zip(String sourceFile,String targetZip){   
	           
	          Project prj = new Project();   
	             
	          Zip zip = new Zip();   
	             
	          zip.setProject(prj);   
	             
	          zip.setDestFile(new File(targetZip));//设置生成的目标zip文件File对象   
	             
	          FileSet fileSet = new FileSet();   
	             
	          fileSet.setProject(prj);   
	             
	          fileSet.setDir(new File(sourceFile));//设置将要进行压缩的源文件File对象  
	             
	          zip.addFileset(fileSet);   
	  
	          zip.execute();   
	  
	    }   
	    
	    public static String getSubString(String str,int pstart,int pend){
	    	  String resu="";
	    	  int beg=0;
	    	  int end=0;
	    	  int count1=0;
	    	  char[] temp=new char[str.length()];
	    	  str.getChars(0,str.length(),temp,0);
	    	  boolean[] bol=new boolean[str.length()];
	    	  for(int i=0;i<temp.length;i++){
	    	   bol[i]=false;
	    	   if((int)temp[i]>255){//说明是中文
	    	    count1++;
	    	    bol[i]=true;
	    	   }
	    	  }

	    	  if(pstart>str.length()+count1){
	    	   resu=null;
	    	  }
	    	  if(pstart>pend){
	    	   resu=null;
	    	  }
	    	  if(pstart<1){
	    	   beg=0;
	    	  }else{
	    	   beg=pstart-1;
	    	  }
	    	  if(pend>str.length()+count1){
	    	   end=str.length()+count1;
	    	  }else{
	    	   end=pend;//在substring的末尾一样
	    	  }
	    	  //下面开始求应该返回的字符串
	    	  if(resu!=null){
	    	   if(beg==end){
	    	    int count=0;
	    	    if(beg==0){
	    	     if(bol[0]==true)
	    	      resu=null;
	    	     else
	    	      resu=new String(temp,0,1);
	    	    }else{
	    	     int len=beg;//zheli
	    	     for(int y=0;y<len;y++){//表示他前面是否有中文,不管自己
	    	      if(bol[y]==true)
	    	       count++;
	    	       len--;//想明白为什么len--
	    	     }
	    	     //for循环运行完毕后，len的值就代表在正常字符串中，目标beg的上一字符的索引值
	    	     if(count==0){//说明前面没有中文
	    	      if((int)temp[beg]>255)//说明自己是中文
	    	       resu=null;//返回空
	    	      else
	    	       resu=new String(temp,beg,1);
	    	     }else{//前面有中文，那么一个中文应与2个字符相对
	    	      if((int)temp[len+1]>255)//说明自己是中文
	    	       resu=null;//返回空
	    	      else
	    	       resu=new String(temp,len+1,1);
	    	     }
	    	    }
	    	   }else{//下面是正常情况下的比较
	    	    int temSt=beg;
	    	    int temEd=end-1;//这里减掉一
	    	    for(int i=0;i<temSt;i++){
	    	     if(bol[i]==true)
	    	      temSt--;
	    	    }//循环完毕后temSt表示前字符的正常索引
	    	    for(int j=0;j<temEd;j++){
	    	     if(bol[j]==true)
	    	      temEd--;
	    	    }//循环完毕后temEd-1表示最后字符的正常索引
	    	    if(bol[temSt]==true)//说明是字符，说明索引本身是汉字的后半部分，那么应该是不能取的
	    	    {
	    	     int cont=0;
	    	     for(int i=0;i<=temSt;i++){
	    	      cont++;
	    	      if(bol[i]==true)
	    	       cont++;
	    	     }
	    	     if(pstart==cont)//是偶数不应包含,如果pstart<cont则要包含
	    	      temSt++;//从下一位开始
	    	    }
	    	    if(bol[temEd]==true){//因为temEd表示substring 的最面参数，此处是一个汉字，下面要确定是否应该含这个汉字
	    	     int cont=0;
	    	     for(int i=0;i<=temEd;i++){
	    	      cont++;
	    	      if(bol[i]==true)
	    	       cont++;
	    	     }
	    	     if(pend<cont)//是汉字的前半部分不应包含
	    	      temEd--;//所以只取到前一个
	    	    }
	    	    if(temSt==temEd){
	    	     resu=new String(temp,temSt,1);
	    	    }else if(temSt>temEd){
	    	     resu=null;
	    	    }else{
	    	     resu=str.substring(temSt,temEd+1);
	    	    }
	    	   }
	    	  }
	    	  return resu;//返回结果
	    	 }
	    
	    /**  
	     * @param str  
	     *            字符串  
	     *            需要截取的字节数  
	     * @return 中文字符串长度  
	     */  
	    public static int getSubStringLen(String str) {   
	        if (null == str) {   
	            return 0;   
	        }   
	        // 截取了的字节数   
	        int len = 0;   
	        for (char c : str.toCharArray()) {   
	            if (isChinese(c)) {   
	                // 如果是中文，字节数加2   
	                len += 2;   
	            } else {   
	                // 如果不是中文，字节数加1   
	                len++;   
	            }   
	        }   
	        return len;   
	    }   
	    
	    /**  
	     * @param str  
	     *            字符串  
	     * @param bytes  
	     *            需要截取的字节数  
	     * @return 结果  
	     */  
	    public static String getSubString(String str, int bytes) {   
	        if (null == str) {   
	            return null;   
	        }   
	  
	        StringBuffer sb = new StringBuffer();   
	        // 截取了的字节数   
	        int len = 0;   
	        for (char c : str.toCharArray()) {   
	            if (isChinese(c)) {   
	                // 如果是中文，字节数加2   
	                len += 2;   
	            } else {   
	                // 如果不是中文，字节数加1   
	                len++;   
	            }   
	            if (len > bytes) {   
	                // 如果字节数大于了需要截取的，则终止   
	                break;   
	            } else {   
	                sb.append(c);   
	            }   
	        }   
	        return sb.toString();   
	    }   
	  
	    /**  
	     * 判断一个字符是不是中文   
	     */  
	    public static boolean isChinese(char c) {   
	        Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);   
	        if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS   
	                || ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS   
	                || ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A   
	                || ub == Character.UnicodeBlock.GENERAL_PUNCTUATION   
	                || ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION   
	                || ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {   
	            return true;   
	        }   
	        return false;   
	    }   

	    
	    public static int getMaxValue(int[] dataAry){
	    	int max=dataAry[0];
	    	for(int i=0;i<dataAry.length;i++) {			
	    		if(max<dataAry[i])			
	    			max = dataAry[i];
	    	}
	        return max;
	    }
	    
	    public static String getNumberFormatStr(double d){
	    	NumberFormat  currentFormat=NumberFormat.getInstance(); 
	    	String  str=currentFormat.format(new Double(d));
	        return str;
	    }
	    
	    /**
	     * 查找某一字符串中TempString，特定子串TempSubString的出现次数
	     * @param TempString: 字符串
	     * @param TempSubString: 子串
	     * @return: 次数
	     */
	    public static int GetFindCount(String TempString,String TempSubString){
	        if(TempString==null) return 0;
	        StringTokenizer TempStringTokenizer=new StringTokenizer(TempString,TempSubString);
	        return TempStringTokenizer.countTokens();
	    }

	    /**
	     * 将字符串定义改为字符串数组
	     * @param TempString: 字符串
	     * @param Separator: 分隔符
	     * @return: 字符串数组
	     */
	    public static String[] ChangeStringToArray(String TempString,String Separator){
	        if(TempString==null || TempString.trim().equalsIgnoreCase("")){
	            return null;
	        }

	        int count=0;
	        String CountString = TempString;
	        int loc=0;
	        while (!CountString.equalsIgnoreCase("")) {
	            if (CountString.indexOf(Separator) != -1) {
	                loc = CountString.indexOf(Separator);
	                count++;
	                CountString = CountString.substring(loc + 1);
	                if(CountString.indexOf(Separator)==-1 && CountString.trim().equalsIgnoreCase(""))
	                {
	                    count++;
	                }
	            } else {
	                count++;
	                CountString="";
	            }
	        }

	        String[] TempStringArray=new String[count];
	        try
	        {
	            int j=0;
	            for(int i=0;i<count;i++)
	            {
	                if(TempString.indexOf(Separator)!=-1)
	                {
	                    j=TempString.indexOf(Separator);
	                    TempStringArray[i]=TempString.substring(0,j);
	                    TempString=TempString.substring(j+1);
	                }else{
	                    TempStringArray[i]=TempString;
	                }
	            }
	        }
	        catch(Exception e)
	        {
	            System.out.println("转换的过程中出现错误！"+e.getMessage());
	            e.printStackTrace();
	        }
	        return TempStringArray;
	    }

	    /**
	     * 替换字符串中的子串为另一字符串
	     * @param TempString: 替换字符串
	     * @param ToReplaceString: 要替换字符串
	     * @param ReplaceString: 另一字符串
	     * @return: 替换后的字符串
	     */
	    public static String StringReplace(String TempString,String ToReplaceString,String ReplaceString)
	    {
	        String ReturnString=TempString;
	        int StringLength=0;

	        if(TempString==null)    return null;

	        if(ToReplaceString!=null)
	        {
	            if(TempString.length()==ToReplaceString.length() && TempString.compareTo(ToReplaceString)==0)
	            {
	                return ReplaceString;
	            }

	            StringLength=ToReplaceString.length();
	        }
	        if(ReturnString != null && ReturnString.length()>StringLength)
	        {
	            int max=0;
	            String S4="";
	            for(int i=0;i<TempString.length();i++)
	            {
	                max=i+ToReplaceString.length()>TempString.length()?TempString.length():i+StringLength;
	                String S3=TempString.substring(i,max);
	                if(!S3.equals(ToReplaceString))
	                {
	                    S4+=S3.substring(0,1);
	                }else{
	                    S4+=ReplaceString;
	                    i+=StringLength-1;
	              }
	            }
	            ReturnString=S4;
	        }

	        return ReturnString;
	    }

	    /**
	     * 把NULL转换为""
	     * @param TempString: 要转换的字符串
	     * @return: 转换后的字符串
	     */
	    public static String ChangeNullToString(String TempString)
	    {
	        if(TempString==null)
	            return "";
	        return TempString.trim();
	    }


	    /**
	     * 字符处理
	     * @param TempString: 要处理的字符串
	     * @return: 处理后的字符串
	     */
	    public static String GetCnCode(String TempString)
	    {

	        String CnString=null;

	        try
	        {
	            if(TempString==null)    return null;
	            byte[] TempBytes = TempString.getBytes("ISO8859-1");
	            CnString=new String(TempBytes,"GB2312");
	        }
	        catch(Exception e)
	        {
	            System.out.print("字符转换出错！"+e.getMessage());
	            e.printStackTrace();
	        }

	        return CnString;
	    }

	    /**
	     * 将空字符串——>"0"
	     * @param W_ChangeString：要转换的字符串
	     * @return：转换后的字符串
	     */
	    public static String ChangeNullToZero(String W_ChangeString)
	    {
	        if(W_ChangeString==null || W_ChangeString.trim().equalsIgnoreCase(""))
	        {
	            W_ChangeString="0";
	        }

	        return W_ChangeString;
	    }

	    /**
	     * 将科学计数法的double转换为正常现实的String
	     * @param tempDoubleValue:要转换的double
	     * @return：转换后的String
	     */
	    public static String ChangeDoubleToString(double tempDoubleValue)
	    {
	        DecimalFormat format=new DecimalFormat("####.00");
	        String tempString="";
	        tempString=format.format(tempDoubleValue);

	        return tempString;
	    }

	    /**
	     * 按字节截取字符串
	     * @param tmpStr String
	     * @param beginIndex int
	     * @param endIndex int
	     * @return String
	     */
	    public static String substringByBytes(String tmpStr,int beginIndex, int endIndex)
	    {
	        byte[] tmpBytes=tmpStr.getBytes();
	        int len=endIndex-beginIndex;
	        byte[] returnBytes=new byte[len];
	        System.arraycopy(tmpBytes,beginIndex,returnBytes,0,len);

//	        int index=0;
//	        for(int i=beginIndex;i<endIndex;++i)
//	        {
//	            returnBytes[index]=tmpBytes[i];
//	            index++;
//	        }

	        return new String(returnBytes);
	    }

	    /**
	     * 向一维数组中加入一项
	     * @param tempArray：一维数组
	     * @param tempValue：要添加的项
	     * @return：新字符串数组
	     */
	    public String[] AddNewItemToStringArray(String[] tempArray,String tempValue)
	    {
	        return null;
	    }

	    public String[][] AddNewItemToStringArray(String[][] tempArray,String[] AddArrayOne,String[] AddArrayTwo)
	    {
	        return null;
	    }

	    /**
	     * 判断一个字符是Ascill字符还是其它字符（如汉，日，韩文字符）
	     *
	     * @param char
	     *            c, 需要判断的字符
	     * @return boolean, 返回true,Ascill字符
	     */
	    public static boolean isLetter(char c) {
	        int k = 0x80;
	        return c / k == 0 ? true : false;
	    }

	    /**
	     * 得到一个字符串的长度,显示的长度,一个汉字或日韩文长度为2,英文字符长度为1
	     *
	     * @param String
	     *            s ,需要得到长度的字符串
	     * @return int, 得到的字符串长度
	     */
	    public static int length(String s) {
	        if (s == null)
	            return 0;
	        char[] c = s.toCharArray();
	        int len = 0;
	        for (int i = 0; i < c.length; i++) {
	            len++;
	            if (!isLetter(c[i])) {
	                len++;
	            }
	        }
	        return len;
	    }

	    /**
	     * 截取一段字符的长度,不区分中英文,如果数字不正好，则少取一个字符位
	     *
	     * @author patriotlml
	     * @param String
	     *            origin, 原始字符串
	     * @param int
	     *            len, 截取长度(一个汉字长度按2算的)
	     * @return String, 返回的字符串
	     */
	    public static String substring(String origin, int len) {
	        if (origin == null || origin.equals("") || len<1)
	            return "";
	        byte[] strByte = new byte[len];
	        if (len > length(origin)){
	            return origin;}
	        System.arraycopy(origin.getBytes(), 0, strByte, 0, len);
	        int count = 0;
	        for (int i = 0; i < len; i++) {
	            int value = strByte[i];
	            if (value < 0) {
	                count++;
	            }
	        }
	        if (count % 2 != 0) {
	            len = (len == 1) ? ++len : --len;
	        }
	        return new String(strByte, 0, len);
	    }
	    
	    
	    /**
		 * 
		 * @author Administrator
		 * @version 创建时间:Mar 17, 2010 3:18:01 PM;
		 * @see 将字符串转换为整形,如果出现异常,则返回0
		 * @param sValue
		 * @return
		 */
		public static int parseStringToInt(String sValue) {
			int result = 0;
			try {
				result = Integer.parseInt(sValue);
			} catch (Exception ex) {
				result = Double.valueOf(parseStringToDouble(sValue)).intValue();
			}
			return result;
		}

		/**
		 * @see
		 * @author Administrator
		 * @version 创建时间:May 20, 2010 3:14:09 PM;
		 * @param sValue
		 * @return
		 */
		public static double parseStringToDouble(String sValue) {
			double result = 0;
			try {
				result = Double.parseDouble(sValue);
				if (Double.isNaN(result)) {
					result = 0;
				}
			} catch (Exception ex) {
				// ex.printStackTrace();
			}
			return result;
		}
		
		/**

		  * 提供精确的加法运算。

		  * @param v1 被加数

		  * @param v2 加数

		  * @return 两个参数的和

		  */

		  public static double add(double v1,double v2){

		      BigDecimal b1 = new BigDecimal(Double.toString(v1));
		      BigDecimal b2 = new BigDecimal(Double.toString(v2));

		      return b1.add(b2).doubleValue();
		  }
		  
		  public static double addRecursion(double v1,int offset){
			  
			  double d1=0;
			  d1=add(v1,v1);
			  for(int i=2;i<offset;i++){
				  d1=add(d1,v1);
			  }
		      return d1;
		  }
		  
		  public static double addMore(Map<Integer,Double> map){
			  double d1=0;
			  int size=map.size();
			  if(size==1){
				 d1=map.get(1); 
			  }
			  if(size==2){
				  d1=add(map.get(1),map.get(2));
			  }
			  if(size>2){
				  d1=add(map.get(1),map.get(2));
				  for(int i=3;i<map.size();i++){
					  d1=add(d1,map.get(i));
				  } 
			  }
		      return d1;
		  }



		  /**

		  * 提供精确的减法运算。

		  * @param v1 被减数

		  * @param v2 减数

		  * @return 两个参数的差

		  */

		  public static double sub(double v1,double v2){

		      BigDecimal b1 = new BigDecimal(Double.toString(v1));
		      BigDecimal b2 = new BigDecimal(Double.toString(v2));

		      return b1.subtract(b2).doubleValue();
		  }
		  /**

		  * 提供精确的乘法运算。

		  * @param v1 被乘数

		  * @param v2 乘数

		  * @return 两个参数的积

		  */

		  public static double mul(double v1,double v2){

		      BigDecimal b1 = new BigDecimal(Double.toString(v1));
		      BigDecimal b2 = new BigDecimal(Double.toString(v2));

		      return b1.multiply(b2).doubleValue();
		  }
		
		  /**

		  * 提供精确的小数位四舍五入处理。

		  * @param v 需要四舍五入的数字

		  * @param scale 小数点后保留几位

		  * @return 四舍五入后的结果

		  */

		  public static double round(double v,int scale){
		      if(scale<0){
		          throw new IllegalArgumentException("The scale must be a positive integer or zero");
		      }

		      BigDecimal b = new BigDecimal(Double.toString(v));
		      BigDecimal one = new BigDecimal("1");
		      
		      return b.divide(one,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
		  }
		  
		  public static double div(double v1,double v2,int scale){

		      if(scale<0){

		          throw new IllegalArgumentException("The scale must be a positive integer or zero");
		      }

		      BigDecimal b1 = new BigDecimal(Double.toString(v1));
		      BigDecimal b2 = new BigDecimal(Double.toString(v2));

		      return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
		  }

//		/**
//		 * @see
//		 * @author Administrator
//		 * @version 创建时间:May 20, 2010 3:14:09 PM;
//		 * @param sValue
//		 * @return
//		 */
//		public static String formatStringToDouble(String sValue) {
//			String result = "0";
//			try {
//				int len = sValue.length();
//				boolean decimalFlag = false;// 是否为科学计数法
//				boolean is_position = false;// 是否为负数
//				boolean decimal_positon = false;// 科学计数法的正负之分
//				boolean isPositionStart = false;// 计数部分小数是否开始
//				boolean isException = false;// 是否有异常
//
//				StringBuffer decimalStrb = new StringBuffer();// 小数部分
//				StringBuffer positionStrb = new StringBuffer();// 整数部分
//				StringBuffer z_Strb = new StringBuffer();// 科学计数法部分
//				for (int i = 0; i < len; i++) {
//					char c = sValue.charAt(i);
//					if (c == '-' && i == 0) {
//						is_position = true;
//						continue;
//					}
//					if (c == 'E')// 科学计数法
//					{
//						decimalFlag = true;
//						if ((i + 1) < len && sValue.charAt(i + 1) == '-')// 科学计数法为负数
//						{
//							decimal_positon = true;
//							i++;
//						}
//						continue;
//					}
//					if (c == '.') {
//						isPositionStart = true;
//						continue;
//					}
//					if (('c' < '0' || c > '9')) {
//						isException = true;
//						break;
//					}
//
//					if (decimalFlag) {
//						z_Strb.append(c);
//						continue;
//					}
//					if (isPositionStart) {
//						decimalStrb.append(c);
//					} else {
//						positionStrb.append(c);
//					}
//
//				}
//
//				if (!isException) {
//					StringBuffer resultstrb = new StringBuffer();
//
//					if (decimalFlag)// 为科学计数法
//					{
//						int dec_len = CommonMethod.parseStringToInt(z_Strb.toString());
//						if (decimal_positon) {
//							dec_len = -1 * dec_len;
//						}
//						int z_len = positionStrb.length();
//						int s_len = decimalStrb.length();
//
//						resultstrb.append(positionStrb).append(decimalStrb);
//						int add = z_len + dec_len;
//
//						if (add <= 0) {
//							for (; add < 0; add++) {
//								resultstrb.insert(0, "0");
//							}
//							resultstrb.insert(0, "0.");
//						} else {
//							if (add < (z_len + s_len)) {
//								resultstrb.insert(add, ".");
//							} else {
//								for (int k = (add - z_len - s_len); k > 0; k--) {
//									resultstrb.append("0");
//								}
//							}
//						}
//					} else {
//						if (decimalStrb.length() <= 0) {
//							resultstrb.append(positionStrb);
//						} else {
//							resultstrb.append(positionStrb).append(".").append(decimalStrb);
//						}
//					}
//					if (is_position) {
//						resultstrb.insert(0,"-");
//					}
//
//					result = resultstrb.toString();
//					
//				}
//
//			} catch (Exception ex) {
//				// ex.printStackTrace();
//			}
//			return result;
//		}
		
		public static String getSeq(int seq){
			String rslt="";
			try{
				String seqStr=String.valueOf(seq);
				if(seqStr.length()==1){
					rslt="00000"+seqStr;
				}
				if(seqStr.length()==2){
					rslt="0000"+seqStr;
				}
				if(seqStr.length()==3){
					rslt="000"+seqStr;
				}
				if(seqStr.length()==4){
					rslt="00"+seqStr;
				}
				if(seqStr.length()==5){
					rslt="0"+seqStr;
				}
				if(seqStr.length()==6){
					rslt=seqStr;
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return rslt;
		}
		
		
	    /**

	     * 输出数字的格式,如:1,234,567.89

	     * @param bd BigDecimal 要格式华的数字

	     * @param format String 格式 "###,###.00"

	     * @return String

	     */

	  public static String numberFormat(double d, String format) {
	      
		  BigDecimal bd = new BigDecimal(d);
	      if (bd == null || "0".equals(bd.toString())) {

	        return "";

	      }

	      DecimalFormat bf = new DecimalFormat(format);

	      return bf.format(bd);

	  }
	  
	  /**定义数组存放数字对应的大写 */ 
	  private final static String[] STR_NUMBER ={ "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" }; 

	  /** 定义数组存放位数的大写 */ 
	  private final static String[] STR_MODIFY ={ "", "拾", "佰", "仟", "万", "拾", "佰", "仟", "亿", "拾", "佰", "仟" }; 
	  
	  /** 定义数组存放分角的大写 */
	  private final static String[] STR_SMALL={"分","角"};
	 


	  /**
	    * 将一个数字转化为金额 
	    *  
	    * @param tempNumber 传入一个double的变量 
	    * @return 返一个转换好的字符串 
	  */ 
	  public static String numberToChinese(double tempNumber){ 
		    DecimalFormat df = new DecimalFormat("#.##");
		    String pTemp = String.valueOf(df.format(tempNumber)); 
		    StringBuffer sbResult =null;
		    String fraction=getFraction(pTemp);
		    if(fraction.equals("")){
		    	sbResult = new StringBuffer(getSign(pTemp) + getInteger(pTemp)+ "元整"); 
		    }
		    else{
		    	sbResult = new StringBuffer(getSign(pTemp) + getInteger(pTemp) + "元" + getFraction(pTemp)); 
		    }
		    
		    return sbResult.toString(); 
	  } 

	  public static String numberToChinese(BigDecimal tempNumber){ 
		  
	  	return numberToChinese(tempNumber.doubleValue()); 
	  } 
	  /** 
	    * 转化整数部分 
	    *  
	    * @param tempString 
	    * @return 返回整数部分 
	  */ 
	  private static String getInteger(String tempString){ 
		    /** 用来保存整数部分数字串 */ 
		    String strInteger = null;//  
		    /** 记录"."所在位置 */ 
		    int intDotPos = tempString.indexOf("."); 
		    int intSignPos = tempString.indexOf("-"); 
		    if(intDotPos == -1){ 
		        intDotPos = tempString.length();
		    }
		    /** 取出整数部分 */ 
		    strInteger = tempString.substring(intSignPos + 1, intDotPos); 
		    strInteger = new StringBuffer(strInteger).reverse().toString(); 
		
		    StringBuffer sbResult = new StringBuffer(); 
		    for(int i = 0; i < strInteger.length(); i++){ 
		        sbResult.append(STR_MODIFY[i]); 
		        sbResult.append(STR_NUMBER[strInteger.charAt(i) - 48]); 
		    } 
		
		    sbResult = sbResult.reverse(); 
		
		    replace(sbResult, "零拾", "零"); 
		    replace(sbResult, "零佰", "零"); 
		    replace(sbResult, "零仟", "零"); 
		    replace(sbResult, "零万", "万"); 
		    replace(sbResult, "零亿", "亿"); 
		
		    replace(sbResult, "零零", "零"); 
		    replace(sbResult, "零零零", "零"); 
		    /** 这两句不能颠倒顺序 */ 
		    replace(sbResult, "零零零零万", ""); 
		    replace(sbResult, "零零零零", ""); 
		    /** 这样读起来更习惯. */ 
		    replace(sbResult, "壹拾亿", "拾亿"); 
		    replace(sbResult, "壹拾万", "拾万"); 
		    /** 删除个位上的零 */ 
		    if(sbResult.charAt(sbResult.length() - 1) == '零' && sbResult.length() != 1){ 
		        sbResult.deleteCharAt(sbResult.length() - 1); 
		    }
		    if(strInteger.length() == 2){ 
		        replace(sbResult, "壹拾", "拾"); 
		    } 
		    /** *//** 将结果反转回来. */ 
		    return sbResult.toString(); 
	  } 

	  /** 
	    * 转化小数部分 例：输入22.34返回叁肆 
	    *  
	    * @param tempString 
	    * @return 
	  */ 
	  private static String getFraction(String tempString){ 
		    String strFraction = null; 
		    int intDotPos = tempString.indexOf("."); 
		    /** *//** 没有点说明没有小数，直接返回 */ 
		    if(intDotPos == -1){ 
		        return ""; 
		    }
		    String sbStr="";
		    strFraction = tempString.substring(intDotPos + 1); 
		    if(strFraction.length()==1){
		    	sbStr=STR_NUMBER[strFraction.charAt(0) - 48]+STR_SMALL[1];
		    }
		    else{
			    StringBuffer sbResult = new StringBuffer(strFraction.length()); 
			    strFraction = new StringBuffer(strFraction).reverse().toString(); 
			    for(int i = 0; i < strFraction.length(); i++){ 
			    	sbResult.append(STR_SMALL[i]); 
			        sbResult.append(STR_NUMBER[strFraction.charAt(i) - 48]); 
			    } 
			    sbResult = sbResult.reverse(); 
			    replace(sbResult, "零角零分", "");
			    replace(sbResult, "零角", "零");  
			    sbStr=sbResult.toString();
			    if(sbStr.equals("零")){
			    	sbStr="";
			    }
			    else{
			    	sbStr=sbResult.toString();
			    }
		    }
		    return sbStr.toString(); 
	  } 

	  /** 
	    * 判断传入的字符串中是否有-如果有则返回负 
	    *  
	    * @param tempString 
	    * @return 
	  */ 
	  private static String getSign(String tempString){ 
	    return tempString.indexOf("-") != -1 ? "负" : ""; 
	  } 
	  
	  /** 
	   * 替代字符 
	   *  
	   * @param pValue 
	   * @param pSource 
	   * @param pDest 
	  */ 
	   private static void replace(StringBuffer pValue, String pSource, String pDest){ 
		    if(pValue == null || pSource == null || pDest == null) {
		        return; 
		    }
		    /** 记录pSource在pValue中的位置 */ 
		    int intPos = 0; 
		    do{ 
		        intPos = pValue.toString().indexOf(pSource); 
		        /** 没有找到pSource */ 
		        if(intPos == -1){ 
		            break; 
		        }
		        pValue.delete(intPos, intPos + pSource.length()); 
		        pValue.insert(intPos, pDest); 
		    } while (true); 
	   } 
	   
	   public  static List<String> parseStringToList(String target,String flag){
			StringBuilder sb = new StringBuilder(target);
			int st = 0 ;
			int ed = sb.indexOf(flag);
			List<String> list = new LinkedList<String>();
			while ( st>=0 && ed>=0) {		
				list.add(sb.substring(st, ed));
				st = ed+1;
				ed = sb.indexOf(flag,st);
			}
			if(list.size() > 0){
				list.add(sb.substring(st, sb.length()));
			}
			return list;
		}
	   
	   public static String createFilePath(String path){
	       File file = new File(path);
		   	if (!file.exists()) {
		   		file.mkdirs();
		   	}
		   	return path;
	   }
	   //降序
	    public static void sortDownArray(String [] arrStr){
		   	String temp;
		   	for(int i=0;i<arrStr.length;i++){
		   	    for(int j=arrStr.length-1;j>i;j--){
		   	        if(arrStr[i].compareTo(arrStr[j])<0){
		   	            temp = arrStr[i];
		   	            arrStr[i] = arrStr[j];
		   	            arrStr[j] = temp;
		   	        }
		   	    }
		   	}
	    }
	    //升序
	    public static void sortUpArray(String [] arrStr){
		   	String temp;
		   	for(int i=0;i<arrStr.length;i++){
		   	    for(int j=arrStr.length-1;j>i;j--){
		   	        if(arrStr[i].compareTo(arrStr[j])>0){
		   	            temp = arrStr[i];
		   	            arrStr[i] = arrStr[j];
		   	            arrStr[j] = temp;
		   	        }
		   	    }
		   	}
	    }
	    public static String[] listSort(List<String> list){
		    String tmpStr1="";
		    String tmpStr2="";
		    double lowD=0;
		    double hightD=0;
		    int length=list.size();
		    for(int i=0;i<length;i++){
		        tmpStr1=(String)list.get(i);
		        Double tempStr1D=new Double(tmpStr1);
		        int hcount=0;
		        int lcount=0;
		        int ecount=0;
		        for(int j=0;j<length;j++){
		      	  tmpStr2=(String)list.get(j);
		      	  Double tempStr2D=new Double(tmpStr2);
		      	  if(tempStr1D>tempStr2D){
		      		  hcount++;
		      	  }
		      	  if(tempStr1D==tempStr2D){
		      		  ecount++;
		      	  }
		      	  if(tempStr1D<tempStr2D){
		      		  lcount++;
		      	  }
		        }
		        if(hcount==length-1){
		      	  hightD=tempStr1D;
		        }
		        else if(ecount==length-1){
		      	  lowD=tempStr1D;
		      	  hightD=tempStr1D;
		        }
		        else if(lcount==length-1){
		      	  lowD=tempStr1D;
		        }
		    }
		    String[] hlAry=new String[2];
		    hlAry[0]=new Double(lowD).toString();
		    hlAry[1]=new Double(hightD).toString();
		    return hlAry;
		    
	    }
	    
	    
	    public static String replaceBlank(String str) {
			String dest = "";
			if (str!=null) {
				Pattern p = Pattern.compile("\\s*|\t|\r|\n");
				Matcher m = p.matcher(str);
				dest = m.replaceAll("");
			}
			return dest;
		}

	   
}
