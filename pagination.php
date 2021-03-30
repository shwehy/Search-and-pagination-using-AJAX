<?php
 $connect = mysqli_connect("localhost", "root", "Ali123", "db_lab4");
 $pagesPerpage = 4;  
 $page = '';  
 $output = '';  
 $flag =0 ;
 if(isset($_POST["page"]))  
 {  
      $page = $_POST["page"];  
 }  
 else  
 {  
      $page = 1;  
 }  
 $start = ($page - 1)*$pagesPerpage;  
if ($connect->connect_error) {
  die("Connection failed: " . $connect->connect_error);
}

  $query = " SELECT department.d_name , professor.p_name , course.course_id,course.course_name,course.course_descreption FROM course , department  , professor 
    WHERE (course.department_id=department.department_id && course.professor_id = professor.professor_id) LIMIT $start, $pagesPerpage";
if(isset($_POST["query"]))
{
 $search = mysqli_real_escape_string($connect, $_POST["query"]);
 $query = " SELECT  department.d_name , professor.p_name , course.course_id,course.course_name,course.course_descreption FROM course  , department  , professor 
    WHERE (course.department_id=department.department_id && course.professor_id = professor.professor_id) &&(
        department.d_name LIKE '%".$search."%' || REPLACE(professor.p_name,' ','')  LIKE '%".$search."%' || course.course_id LIKE '%".$search."%' ||
        course.course_name LIKE '%".$search."%' || course.course_descreption LIKE '%".$search."%'
        || professor.p_name LIKE '%".$search."%'|| REPLACE(department.d_name,' ','') LIKE '%".$search."%'
        || REPLACE(course.course_name,' ','') LIKE '%".$search."%' || REPLACE(course.course_descreption,' ','') LIKE '%".$search."%')
        ORDER BY course_id ASC LIMIT $start, $pagesPerpage ";
        $flag = 1;
}

else{$flag = 0;}

    $result = mysqli_query($connect, $query);



$output .= "  
      <table class='table table-bordered'>  
           <tr class='dark'>  
                <th width='5%'>Course ID</th> 
                <th width='20%'>Professor Name</th>  
                <th width='20%'>Department Name</th> 
                <th width='10%'>Course Name</th> 
                <th width='25%'>Course Descreption</th> 
           </tr>  
 ";  
while($row = mysqli_fetch_array($result))  
 {  
      $output .= '  
           <tr align="center">  
                <td>'.$row["course_id"].'</td>  
                <td>'.$row["p_name"].'</td> 
                <td>'.$row["d_name"].'</td>  
                <td>'.$row["course_name"].'</td>  
                <td>'.$row["course_descreption"].'</td>  
           </tr>  
      ';  
 }  
$output .= '</table><br /><div align="center">'; 


if($flag == 1){
    $page_query = " SELECT  department.d_name , professor.p_name , course.course_id,course.course_name,course.course_descreption FROM course , department  , professor 
    WHERE (course.department_id=department.department_id && course.professor_id = professor.professor_id) &&(
        
        
         department.d_name LIKE '%".$search."%' || REPLACE(professor.p_name,' ','')  LIKE '%".$search."%' || course.course_id LIKE '%".$search."%' ||
        course.course_name LIKE '%".$search."%' || course.course_descreption LIKE '%".$search."%'
        || professor.p_name LIKE '%".$search."%'|| REPLACE(department.d_name,' ','') LIKE '%".$search."%'
        || REPLACE(course.course_name,' ','') LIKE '%".$search."%' || REPLACE(course.course_descreption,' ','') LIKE '%".$search."%'
        
        )";
    
        
}
else if($flag == 0){
 $page_query = " SELECT department.d_name , professor.p_name , course.course_id,course.course_name,course.course_descreption FROM course  , department  , professor 
 WHERE (course.department_id=department.department_id AND course.professor_id = professor.professor_id)"; 
    
}
 $page_result = mysqli_query($connect, $page_query);  
 $total_records = mysqli_num_rows($page_result);  
 $total_pages = ceil($total_records/$pagesPerpage); 
 $prev = $page - 1;
 $next = $page + 1;


if($prev == 0){$output .="<button disabled class='pagination_link' style='background-color: #f1f1f1;
  color: black; padding:6px; border:1px solid #ccc;' id='".$prev."'>&laquo; Previous</button>";}
else{
    $output .="<button  class='pagination_link' style='background-color: #f1f1f1;
  color: black;padding:6px; border:1px solid #ccc;' id='".$prev."'>&laquo; Previous</button>";
}



 for($i=1; $i<=$total_pages; $i++)  
 {   
      $output .= "<span class='pagination_link' style=' background-color: white;cursor:pointer; padding:6px; border:1px solid #ccc;' id='".$i."'>".$i."</span>";  
 }  



if($next>$total_pages){$output .="<button disabled class='pagination_link' style='background-color: #89CFF0;
  color: white;padding:6px; border:1px solid #ccc;'id='".$next."'>Next &raquo;</button>";}
else{$output .="<button class='pagination_link' style='background-color: #89CFF0;
  color: white;padding:6px; border:1px solid #ccc;'id='".$next."'>Next &raquo;</button>";}
 $output .= '</div><br /><br />';  
 echo $output;  
?>