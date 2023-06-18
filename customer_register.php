<?php 

    $active='Account';
    include("includes/header.php");

?>
   
   
   <div id="content"><!-- #content Begin -->
       <div class="container"><!-- container Begin -->
           <div class="col-md-12"><!-- col-md-12 Begin -->
               
               <ul class="breadcrumb"><!-- breadcrumb Begin -->
                   <li>
                       <a href="index.php">Home</a>
                   </li>
                   <li>
                       Register
                   </li>
               </ul><!-- breadcrumb Finish -->
               
           </div><!-- col-md-12 Finish -->
           
           <div class="col-md-12"><!-- col-md-12 Begin -->
               
               <div class="box"><!-- box Begin -->
                   
                   <div class="box-header"><!-- box-header Begin -->
                       
                       <center><!-- center Begin -->
                           
                           <h2> Register a new account </h2>
                           
                       </center><!-- center Finish -->
                         
                       <div class="login-box">
    
                       <form action="customer_register.php" method="post" enctype="multipart/form-data"><!-- form Begin -->
                           
                           <div class="form-group"><!-- form-group Begin -->
                               
                               <label>Your Name / Reg Num</label>
                               
                               <input type="text" class="form-control" name="c_name" placeholder="Enter Reg Number or Name" required>
                               
                           </div><!-- form-group Finish -->
                           
                           <div class="form-group"><!-- form-group Begin -->
                               
                               <label>Your Email</label>
                               
                               <input type="email" runat="server" class="form-control" placeholder="Enter Valid Email" name="c_email" required>
                               
                           </div><!-- form-group Finish -->
                           
                           <div class="required"><!-- form-group Begin -->
                               
                               <label>Your Password</label>
                               
                               <input type="password" class="form-control" name="c_pass" data-min-length="6" placeholder="New password" required>
                               
                           </div><!-- form-group Finish -->
                           
                           <div class="form-group"><!-- form-group Begin -->
                               
                               <label>Your Campus</label>
                               
                               <select name="c_campus" class="form-control" required oninput="setCustomValidity('')" oninvalid="setCustomValidity('Must select campus')"><!-- form-control Begin -->
                                          
                                           <option value="" disabled selected>Select Campus</option>
                                           <option>Mashava Campus</option>
                                           <option>Main Campus</option>
                                           <option>Mucheke Campus</option>
                                           <option>Herbert Chitepo Law School</option>
                                           <option>Julius Nyerere</option>
                                           <option>Medical Campus</option>
                                           
                                       </select><!-- form-control Finish -->
                               
                               
                           </div><!-- form-group Finish -->
                           
                           <div class="form-group"><!-- form-group Begin -->
                               
                               <label>Resident Status</label>
                               
                               <select name="c_res" class="form-control" required oninput="setCustomValidity('')" oninvalid="setCustomValidity('Must select one')"><!-- form-control Begin -->
                                          
                                          <option value="" disabled selected> Select Resident Status</option>
                                          <option>In-res</option>
                                          <option>Off-res</option>
                                          
                                          
                                      </select><!-- form-control Finish -->
                               
                               
                           </div><!-- form-group Finish -->
                           
                           <div class="form-group"><!-- form-group Begin -->
                               
                               <label>Your Contact</label>
                               
                               <input type="number" class="form-control" name="c_contact" placeholder="Enter your Contact Number" min="1" minlength="10" maxlength="12" required>
                               
                           </div><!-- form-group Finish -->
                           
                           <div class="form-group"><!-- form-group Begin -->
                               
                               <label>Your Address / Room number</label>
                               
                               <input type="text" class="form-control" placeholder="Enter you address where the goods can be delivered to" name="c_address" required>
                               
                           </div><!-- form-group Finish -->
                           
                           <div class="form-group"><!-- form-group Begin -->
                               
                               <label>Your Profile Picture</label>
                               
                               <input type="file" class="form-control form-height-custom" name="c_image" required>
                               
                           </div><!-- form-group Finish -->
                           
                           <div class="text-center"><!-- text-center Begin -->
                               
                               <button type="submit" name="register" class="btn btn-primary">
                               
                               <i class="fa fa-user-md"></i> Register
                               
                               </button>
                               
                           </div><!-- text-center Finish -->
                           
                       </form><!-- form Finish -->
                       
                   </div><!-- box-header Finish -->
                   
               </div><!-- box Finish -->
               
           </div><!-- col-md-12 Finish -->
           
       </div><!-- container Finish -->
   </div><!-- #content Finish -->
   


  
    

   <?php 
    
    include("includes/footer.php");
    
    ?>
    
    <script src="js/jquery-331.min.js"></script>
    <script src="js/bootstrap-337.min.js"></script>
    
    
</body>
</html>


<?php 

if(isset($_POST['register'])){
    
    $c_name = $_POST['c_name'];
    
    $c_email = $_POST['c_email'];
    
    $c_pass = $_POST['c_pass'];
    
    $c_campus = $_POST['c_campus'];
    
    $c_res = $_POST['c_res'];
    
    $c_contact = $_POST['c_contact'];
    
    $c_address = $_POST['c_address'];
    
    $c_image = $_FILES['c_image']['name'];
    
    $c_image_tmp = $_FILES['c_image']['tmp_name'];
    
    $c_ip = getRealIpUser();
    
    move_uploaded_file($c_image_tmp,"customer/customer_images/$c_image");


    $query = @mysqli_query($con,"select * from customers where customer_email = '$c_email'  ");
    $count = mysqli_num_rows($query);
    
    if ($count > 0){ ?>
    <script>
    alert('This member Already Exists');
    </script>
    <?php
    }else{
    
    $insert_customer = "insert into customers (customer_name,customer_email,customer_pass,customer_campus,customer_res,customer_contact,customer_address,customer_image,customer_ip) values ('$c_name','$c_email','$c_pass','$c_campus','$c_res','$c_contact','$c_address','$c_image','$c_ip')";
    
    $run_customer = mysqli_query($con,$insert_customer);
    
    $sel_cart = "select * from cart where ip_add='$c_ip'";
    
    $run_cart = mysqli_query($con,$sel_cart);
    
    $check_cart = mysqli_num_rows($run_cart);
    
    if($check_cart>0){
        
        /// If register have items in cart ///
        
        $_SESSION['customer_email']=$c_email;
        
        echo "<script>alert('You have been Registered Sucessfully')</script>";
        
        echo "<script>window.open('checkout.php','_self')</script>";
        
    }else{
        
        /// If register without items in cart ///
        
        $_SESSION['customer_email']=$c_email;
        
        echo "<script>alert('You have been Registered Sucessfully')</script>";
        
        echo "<script>window.open('index.php','_self')</script>";
        
    }
    
}
  
}

?>