package weixin.xigua.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import base.tool.fileupload.FileUpLoadUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;
import weixin.assistant.constants.WeixinConstant;

// Servlet 文件上传  
public class UploadServlet extends HttpServlet
{
    private String filePath;    // 文件存放目录  
    private String tempPath;    // 临时文件目录  

    // 初始化  
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
        // 从配置文件中获得初始化参数  
        filePath = config.getInitParameter("filepath");
        tempPath = config.getInitParameter("temppath");

        ServletContext context = getServletContext();

        filePath = context.getRealPath(filePath);
        tempPath = context.getRealPath(tempPath);
        System.out.println("文件存放目录、临时文件目录准备完毕 ...");
    }

    // doPost  
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException
    {
        JSONObject jsonRet = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        res.setContentType("text/plain;charset=gbk");
        PrintWriter pw = res.getWriter();
        try{
            DiskFileItemFactory diskFactory = new DiskFileItemFactory();
            // threshold 极限、临界值，即硬盘缓存 1M  
            diskFactory.setSizeThreshold(4 * 1024);
            // repository 贮藏室，即临时文件目录  
            diskFactory.setRepository(new File(tempPath));

            ServletFileUpload upload = new ServletFileUpload(diskFactory);
            // 设置允许上传的最大文件大小 4M  
            upload.setSizeMax(4 * 1024 * 1024);
            // 解析HTTP请求消息头  
            List fileItems = upload.parseRequest(req);
            Iterator iter = fileItems.iterator();
            while(iter.hasNext())
            {
                FileItem item = (FileItem)iter.next();
                if(item.isFormField())
                {
                    System.out.println("处理表单内容 ...");
                    processFormField(item, pw);
                }else{
                    System.out.println("处理上传的文件 ...");
                    JSONObject jsonOne = processUploadFile(item, pw);
//                    jsonOne.put("url", req.getRequestURI()+jsonOne.getString("url"));
                    jsonArray.add(jsonOne);
                }
            }// end while()  
            jsonRet.put("files", jsonArray);
            pw.print(jsonRet);
            pw.close();
        }catch(Exception e){
            System.out.println("使用 fileupload 包时发生异常 ...");
            e.printStackTrace();
        }// end try ... catch ...  
    }// end doPost()  


    // 处理表单内容  
    private void processFormField(FileItem item, PrintWriter pw)
            throws Exception
    {
        String name = item.getFieldName();
        String value = item.getString();
        pw.println(name + " : " + value + "\r\n");
    }

    // 处理上传的文件  
    private JSONObject processUploadFile(FileItem item, PrintWriter pw)
            throws Exception
    {
        JSONObject jsonRet = new JSONObject();
        // 此时的文件名包含了完整的路径，得注意加工一下  
        String filename = item.getName();
        System.out.println("完整的文件名：" + filename);
        int index = filename.lastIndexOf("\\");
        filename = filename.substring(index + 1, filename.length());

        long fileSize = item.getSize();

        if("".equals(filename) && fileSize == 0)
        {
            System.out.println("文件名为空 ...");
            return null;
        }
        Date date = new Date();
        filename = date.getTime()+ "-"+UUID.randomUUID()+FileUpLoadUtil.getExtention(filename);
        System.out.println("改名后的名字:"+filename);
        File uploadFile = new File(filePath + "/" + filename);
        item.write(uploadFile);
//        pw.println(filename + " 文件保存完毕 ...");
//        pw.println("文件大小为 ：" + fileSize + "\r\n");

        jsonRet.put("size", fileSize);
        jsonRet.put("url", "http://"+ WeixinConstant.domain+"/images/uploadFile/" + filename);

        return jsonRet;
    }

    // doGet  
    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException
    {
        doPost(req, res);
    }
} 