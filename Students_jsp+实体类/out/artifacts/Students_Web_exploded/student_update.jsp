<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,java.sql.Connection,charactor.*,java.sql.*"
    import="com.alibaba.fastjson.JSONArray"
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");
	Statement s = c.createStatement();
	Student student = null;
	String sql = "select * from student1 where id = " + id;
	ResultSet rs = s.executeQuery(sql);


	if (rs.next()) {
		student = new Student();
		String sname = rs.getString(2);
		int sage = rs.getInt(3);
		String ssex = rs.getString(4);
		String shobby = rs.getString(5);
		String sschool = rs.getString(6);
		String smajor = rs.getString(7);

		student.sname = sname;
		student.sage = sage;
		student.ssex = ssex;
		student.shobby = shobby;
		student.sschool = sschool;
		student.smajor = smajor;
		student.id = id;
	}

request.setAttribute("student",student);
//System.out.println(student.ssex+"!");
%>

<html>
<head>
<meta charset="utf-8">
	<script type="text/javascript" src="jquery-1.12.4.js" ></script>

	<script >
        function smajorShow(v){
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
                    zhye.options.length=0;
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
				</tr>
<script>
    var mysex=document.getElementById("mysex");
    var asex=mysex.value;
    //本函数传递两个参数，sex是要获取元素的名称，asex是后台所获取的数据
    sex('sex',asex);
    function sex(rName,rValue){
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
           <tr>
					<td style="width: 100">爱好：</td>
					<td><input style="font-size: 24" type="checkbox" value="健身"
						name="aih" />健身 <input style="font-size: 24" type="checkbox"
						value="写代码" name="aih" />写代码 <input style="font-size: 24"
						type="checkbox" value="看书" name="aih" />看书 <input
						style="font-size: 24" type="checkbox" value="书法" name="aih" />书法
					</td>
			</tr>
<script>
var hbdata = new Array();
<%
String hobby = student.getShobby() ;
if(hobby!=null){
String[] a = hobby.split("，"); 
List list = java.util.Arrays.asList(a);
if(list!=null){
for(int j=0;j<list.size();j++)
{%>
    hbdata[<%=j%>] = '<%=list.get(j)%>';
<%}
}}%>
for(var hbd=0;hbdata[hbd]!=null;hbd++){
	//document.write(hbdata[hbd]);
hobby('aih',hbdata[hbd]);
function hobby(rName,rValue){
	 // document.write(rName);
     /*通过传递的元素名获取元素对象*/
   var rObj = document.getElementsByName(rName);
   /*获取到的对象是数组对象，逐一进行遍历，寻找值等于所获取数据值的子对象*/
   for(var i = 0;i < rObj.length;i++){
        if(rObj[i].value == rValue){
            /*寻找到子对象后，对他进行如下操作就可以实现后台数据显示到复选钮中*/
            rObj[i].checked =  'checked';
    }
 }
}
}
</script>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection c3= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");
	Statement s3 = c3.createStatement();

	int total3 = 0;

	String sql3 = "select count(*) from student1";

	ResultSet rs3 = s3.executeQuery(sql3);
	while (rs3.next()) {
		total3 = rs3.getInt(1);
	}
	Connection c4= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");

		List<Sschool> sschools = new ArrayList<Sschool>();
		String sql4 = "select * from sschool1  limit ?,? ";
	    PreparedStatement ps4 = c4.prepareStatement(sql4);
			ps4.setInt(1, 0);
			ps4.setInt(2, total3);

			ResultSet rs4 = ps4.executeQuery();

			while (rs4.next()) {
				Sschool sschool = new Sschool();

				String scname = rs4.getString("scname");

				sschool.scname = scname;

				sschools.add(sschool);

	}
	request.setAttribute("schools", sschools);
%>
<%!String myschool;

//int total3 = new schDAO().getTotal();
//List<Sschool> schools = new schDAO().list(0,total3);
%>
<%
//request.setAttribute("schools", schools);
myschool=student.sschool;
System.out.println(myschool);
%>


	<%
	//	System.out.println(myschool + "222");
		List<Smajor> smajors = new ArrayList<Smajor>();
		//注意此处使用字符串的格式！需要单引号，双引号同时使用
		Class.forName("com.mysql.jdbc.Driver");
		Connection c5= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");
		String sql5 = "select * from smajor1 where scinfor ='" + myschool + "'";
		PreparedStatement ps5 = c5.prepareStatement(sql5);

			ResultSet rs5 = ps5.executeQuery(sql5);

			while (rs5.next()) {
				Smajor smajor = new Smajor();

				String mname = rs5.getString("mname");

				smajor.mname = mname;


				smajors.add(smajor);

		}

        request.setAttribute("mymajors", smajors);
	//	System.out.println(mymajors + "999999");
	%>

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
					</select>
					</td>
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
	</div>

</body>
</html>
