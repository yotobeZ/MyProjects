<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,java.sql.Connection,jdbc.*,charactor.*,java.sql.*"
import="com.alibaba.fastjson.JSONArray"

%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
System.out.println("woshiupdate");
int id = Integer.parseInt(request.getParameter("id"));
 
Student student=new stuDAO().get(id);
//System.out.println(student);
request.setAttribute("student",student);
System.out.println(student.ssex+"!");
%>

<html>
<head>

<meta charset="utf-8">
	<script type="text/javascript" src="jquery-1.12.4.js" ></script>


	<script >
        function smajorShow(v){
           // var v = document.getElementById("xuyan");
            //传值是对的
        //    alert("学院"+v);
            var v1=  encodeURI(v);

            $.ajax({
                url:"major.jsp",
                type:"get",
                dataType:"json",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {
                    "xuey":v1,

                },
                traditional: true,
                success:function(data){
                 //   alert("list"+data);
                    zhye.options.length=0;

       //   alert(data.num);
          for(var i=0;i<data.num;i++){
          //alert(data.majors[i].mname);
              zhye.options.add(new Option(data.majors[i].mname,data.majors[i].mname));
          }

                },

                error:function(){
                    alert("error");
                }
            })

        }
	</script>
</head>
<body>
	<div id="shr" align="center" style="margin-top: 50">

		<div style="font-size: 24">输入学生信息</div>
		<form id="myform" action="update.jsp" method="post">

			<table border="1">

				<tr>
					<td style="width: 100px">姓名：</td>
					<td><input type="text" name="xming" style="font-size: 24"
						value="<%=student.getSname() %>" /></td>
				</tr>
				<tr>
					<td style="width: 100px">年龄：</td>
					<td><input type="text" name="nling" style="font-size: 24"
						value="<%=student.getSage() %>" /></td>
				</tr>
				<tr>
					<td style="width: 100">性别：</td>
					<td><input style="font-size: 24" type="radio" value="男"
						name="sex" /><label>男</label> <input style="font-size: 24"
						type="radio" value="女" name="sex" /><label>女</label></td>
					<input type="hidden" name="mysex" id="mysex"
						value="<%=student.getSsex() %>">
					<!-- <c items="${student}" var="student" varStatus="status"></c>			-->
					<script>

    /*本函数传递两个参数，xinfang.sex是要获取元素的名称，${xinfang.sex}是后台所获取的数据*/

 // 
    
    var mysex=document.getElementById("mysex");
    var asex=mysex.value;
  //  document.write(asex);
    sex('sex',asex);
    function sex(rName,rValue){
  	 // document.write(rName);
      /*通过传递的元素名获取元素对象*/

      var rObj = document.getElementsByName(rName);

      /*获取到的对象是数组对象，逐一进行遍历，寻找值等于所获取数据值的子对象*/
      for(var i = 0;i < rObj.length;i++){
           if(rObj[i].value == rValue){

               /*寻找到子对象后，对他进行如下操作就可以实现后台数据显示到单选钮中*/

               rObj[i].checked =  'checked';
       }
    }
  }


      
</script>


				</tr>

				<tr>
					<td style="width: 100">爱好：</td>
					<td><input style="font-size: 24" type="checkbox" value="健身"
						name="aih" />健身 <input style="font-size: 24" type="checkbox"
						value="写代码" name="aih" />写代码 <input style="font-size: 24"
						type="checkbox" value="看书" name="aih" />看书 <input
						style="font-size: 24" type="checkbox" value="书法" name="aih" />书法</td>
				</tr>
				<script>
//alert("111");
var hbdata = new Array();
<%
String hobby = student.getShobby() ;
if(hobby!=null){
String[] a = hobby.split("，"); 
List list = java.util.Arrays.asList(a);

if(list!=null){
for(int j=0;j<list.size();j++)
{%>
 //   alert("111");
    hbdata[<%=j%>] = '<%=list.get(j)%>';
 
<%}
}}%>
for(var hbd=0;hbdata[hbd]!=null;hbd++){
	//document.write(hbdata[hbd]);
	//document.write("---------------");
hobby('aih',hbdata[hbd]);
function hobby(rName,rValue){
	 // document.write(rName);
   /*通过传递的元素名获取元素对象*/
   var rObj = document.getElementsByName(rName);
   /*获取到的对象是数组对象，逐一进行遍历，寻找值等于所获取数据值的子对象*/
   for(var i = 0;i < rObj.length;i++){
        if(rObj[i].value == rValue){
            /*寻找到子对象后，对他进行如下操作就可以实现后台数据显示到单选钮中*/
            rObj[i].checked =  'checked';
    }
 }
}
}
</script>

				<%!String myschool; 
String[][] majorsc=new String[10][10];//majorsc={"专业"};
int totalll = new schDAO().getTotal();
List<Sschool> schools = new schDAO().list(0,totalll);

%>
<%
for(int i=0;i<10;++i)
	   for(int j=0;j<10;++j)
		   majorsc[i][j] = "专业";
System.out.println("majorsc[0][0]:"+majorsc[0][0]);
System.out.print(totalll+"**********");


request.setAttribute("schools", schools);
myschool=student.sschool; 
System.out.println(myschool);
//得到每个学院的专业
/*if(schools!=null){
for(int scn=0;scn<schools.size();scn++){
	String scname = schools.get(scn).scname;
	List<Smajor> changemajors = new schDAO().getMajor(scname);
	System.out.println("kongzhiz"+changemajors);
	if(changemajors.size()!=0){
		for(int sma=0;sma<changemajors.size();sma++){
			if(changemajors.get(sma)!=null){
			majorsc[scn][sma]=changemajors.get(sma).mname;}}
		

	}
	else{
		
		System.out.println("无专业！");	
	}
//如果scn.name=所选学院，专业就是majors[scn]
	request.setAttribute("jlzhye", majorsc);
}
}
 */%>

				</div>

	<%
		//int total = new schDAO().getTotal();
		System.out.println(myschool + "222");
		List<Smajor> mymajors = new schDAO().getMajor(myschool);

		//String mymajor=student.smajor;

		request.setAttribute("mymajors", mymajors);
		System.out.println(mymajors + "999999");
		//System.out.println(mymajor);
	%>
				<form action="student_update.jsp">
					<input id="scho" type="hidden" name="scho">
				</form>


				<tr>
					<td style="width: 100">学院：</td>
					<td><select id="xyuan" name="xyuan" onchange="smajorShow(this.options[this.options.selectedIndex].value)" style="font-size: 24">

							<c:forEach items="${schools}" var="school" varStatus="status">

								<c:if test="${school.scname==student.sschool}">
									<option value="${school.scname}" selected>
										${school.scname}</option>
								</c:if>

							</c:forEach>
							<c:forEach items="${schools}" var="school" varStatus="status">

								<c:if test="${school.scname!=student.sschool}">
									<option value="${school.scname}">${school.scname}</option>
								</c:if>

							</c:forEach>
					</select></td>

				</tr>

				<tr>

					<td style="width: 100">专业：</td>
					<td><select id="zhye" name="zhye" style="font-size: 24">
							<c:forEach items="${mymajors}" var="ssmajor" varStatus="status">
								<c:if test="${ssmajor.mname==student.smajor}">
									<option value="${ssmajor.mname}" selected>${ssmajor.mname}</option>
								</c:if>
							</c:forEach>
							<c:forEach items="${mymajors}" var="ssmajor" varStatus="status">
								<c:if test="${ssmajor.mname!=student.smajor}">
									<option value="${ssmajor.mname}">${ssmajor.mname}</option>
								</c:if>
							</c:forEach>
							<!-- 当学院等于换了的学院，专业也要对应改变
		                 	<c:forEach items="${mymajors}" var="ssmajor" varStatus="status">
							<c:if test="${ssmajor.mname==student.smajor}">
							<option value="${ssmajor.mname}" >${ssmajor.mname}</option>
						</c:if>					
		                 </c:forEach>	 -->
					</select></td>
				</tr>

			</table>
			<p />
			<input type="hidden" name="id" value="<%=student.getId()%>">
			<table>
				<tr>
					<td><input type="submit" name="add" value="确认修改"></td>
					<td><input type="reset" name="cancel" value="取消"
						onclick="javascrtpt:window.location.href='student_allroot.jsp'"
						style="width: 100"></td>
				</tr>
			</table>
		</form>

	</div>
	<script type="text/javascript" LANGUAGE="JavaScript">
		function add() {
			var studentId = id;
			window.location.href = "student_delete.jsp?id=" + studentId;

		}
	</script>
	<%
		//update database first
		//response.sendRedirect("student_infor.jsp");
	%>
</body>
</html>
