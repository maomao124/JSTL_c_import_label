<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.io.FileWriter" %><%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_c_import_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/1
  Time(创建时间)： 21:43
  Description(描述)：
  JSTL <c:import> 标签类似于 <jsp:include>，用来导入静态或动态文件。区别是，<jsp:include> 只能导入同一 Web 应用下的文件，
  而 <c:import> 可以导入其它网站的文件。
JSP <c:import> 标签语法如下：
<c:import url="url" [context="context"] [var="varname"] [scope="page|request|session|application"]
[charEncoding="charencoding"] [varReader="readerName"]  />
其中：
[ ] ：[ ]中的内容为可选项；
url：需要导入文件的 URL，可以是相对路径和绝对路径；
context：使用相对路径访问外部 context 资源时，context 用来指定这个资源的名称；
var：用来存储所引入的文本的变量；
scope：var 属性的作用域；
charEncoding：所引入数据的字符编码；
varReader：用于提供 java.io.Reader 对象的变量。
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="http://www.baidu.com" var="varname" scope="session" charEncoding="charencoding"/>
<c:out value="${varname}"/>
<%
    String str = (String) session.getAttribute("varname");
    System.out.println(str);
    FileWriter fileWriter = null;
    try                                  //文件流打开，文件读写
    {
        fileWriter = new FileWriter("C:\\Users\\mao\\Desktop\\test.txt");
        fileWriter.write(str);
    }
    catch (FileNotFoundException e)      //文件未找到
    {
        Toolkit.getDefaultToolkit().beep();
        System.err.println("文件未找到！！！  " + "\n错误内容：" + e.toString());
    }
    catch (Exception e)                  //其它异常
    {
        Toolkit.getDefaultToolkit().beep();
        e.printStackTrace();
    }
    finally
    {
        try                              //关闭流
        {
            if (fileWriter != null)
            {
                fileWriter.close();
            }
        }
        catch (NullPointerException e)    //空指针异常
        {
            Toolkit.getDefaultToolkit().beep();
            System.err.println("文件已经被关闭，无法再次关闭！！！");
        }
        catch (Exception e)              //其它异常
        {
            Toolkit.getDefaultToolkit().beep();
            e.printStackTrace();
        }
    }
%>
</body>
</html>
