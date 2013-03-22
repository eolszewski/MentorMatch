<%@include file="master.jsp" %>
                                    <title>MentorMatch - Registration</title>
                                    
											<script type="text/javascript">
											 
											 	function addMajor() {
													var major = document.getElementById('majors').value;
													alert(major);
														
												}
											 	 /* 
												var subjects = ['PHP'];
												$(function(){
													  $('.majors').typeahead({
														 items:4,
														 source: subjects
													  });
												 });
												 
												 $(document).ready(function(){
													alert("fuck");
												});
												*/
											</script>                                     

                                    <div class="container">
                                    
                                   
                                    
                                        <div class="span11">
                                        	<div class="well">
                                                   <form autocomplete="off">
    												<fieldset>
    												<legend><h3>Registration</h3></legend>
                                                    	<label>Email</label>
   													 	<input type="text" placeholder="Type something…">
                                                        <br/>
                                                        <label>Password</label>
   													 	<input type="password" placeholder="Password">
                                                        <br/>
    													<label>First Name</label>
   													 	<input type="text" placeholder="Type something…">
                                                        <br/>
                                                        <label>Last Name</label>
   													 	<input type="text" placeholder="Type something…">
                                                        <br/>
                                                        <label>Major(s)</label>
                                                        <div class="input-append">
                                                          <input id="majors" type="text" data-provide="typeahead">
                                                          <button class="btn" type="button" onClick="addMajor()">Add</button>
                                                        </div> 
                                                        <table class="table table-hover">
                                                         
                                                        </table>
                                                                                                            
    											<br/><button type="submit" class="btn">Submit</button>
    													</fieldset>
    												</form>
                                            </div>
                                             
                                           
                                         	
                                            
                                        </div>
                                        
                                        
                                        
<%@include file="footer.jsp" %>   