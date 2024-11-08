<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="Saatvik.ModulesDieseas.Edit" %>
<%@ Register TagPrefix="dnncl" Assembly="DotNetNuke.Web.Client" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" %>
<dnncl:DnnCssInclude ID="customJS" runat="server" FilePath="DesktopModules/Dieseas/Edit.css" AddTag="false" />
<div class="AddTaskDiv">
    <h2>Add Disease</h2>
    <hr />
    <div class="lblTaskName">Disease Name</div>
    <input id="TaskName" type="text" />
     <div class="lblTaskDescription">Disease Description</div>
     <input id="TaskDescription" type="text" />
     <div class="isCompleteGroup">
         <input id="cbxIsComplete" type="checkbox" />
         <div class="lblTaskIsComplete">Is Activated</div>
     </div>
     <input class="dnnClear dnnRight dnnPrimaryAction" id="btnAddTask" type="button" value="Add Disease" />
</div>

<div class="TaskListDiv">
      <div class="Headings">
            <h2>IsActivated</h2>
            <h2>Disease Name</h2>
            <h2>Disease Description</h2>
            <hr/>
      </div> 
     <div class="TaskList"></div>
</div>
<script type="text/javascript">
    var moduleId = <%= ModuleId %>;
    var CurrentUserID = <%= UserId %>;
    function loadTasks() {
        $.getJSON(
        "/DesktopModules/Dieseas/API/ModuleTask/GetDisease?moduleId=" + moduleId,
         function (result) {
             $('.TaskList').html("");
             var parsedTaskJSONObject = jQuery.parseJSON(result);    
             $.each(parsedTaskJSONObject, function () {                
                 //Defines object's UserId & TaskId as variableS so they're accessble inside of function
                 var objectUID = this.UserId;
                 var objectTaskID = this.DieseasId;
                
              //Defines function that checks to see if the current user's ID matches the userID who created the task... if so add the Edit button
                 function AddEditCheck() {
                     debugger;
                     if (objectUID == CurrentUserID) {
                         $('.TaskList').append('<div class="EditIcon" id="' + objectTaskID +'">' + 'EDIT' + '</div>');
                     }                    
                     else {
                         $('.TaskList').append('<div class="EditIcon">' + '</div>');                   
                     }
                 }                                
                  if (this.isActivated == true) {
                     $('.TaskList').append(
                             '<div class="ListItems ListItems' + this.DieseasId +'" id="ListItem' + this.DieseasId +'">' +
                                '<div class="checkbox checkbox' + this.DieseasId + '"id="checkbox"><input class="cbxListIsComplete" id="cbox' + this.DieseasId + '"type="checkbox" checked/></div>' +
                                '<div class="ListTaskName" id="ListTaskName' + this.DieseasId +'">' + this.DieseasName + '</div>' +
                                '<div class="ListTaskDescription" id=ListTaskDescription' + this.DieseasId +'>' + this.DieseasDescription + '</div>' +
                             '</div>');
                      AddEditCheck();
                  }
                 else {
                      $('.TaskList').append(
                              '<div class="ListItems ListItems' + this.DieseasId +'" id="ListItem' + this.DieseasId +'">' +
                                '<div class="checkbox checkbox' + this.DieseasId + '"id="checkbox"><input class="cbxListIsComplete" id ="cbox' + this.DieseasId + '"type="checkbox"/></div>' +
                                '<div class="ListTaskName" id="ListTaskName' + this.DieseasId +'">' + this.DieseasName + '</div>' +
                                '<div class="ListTaskDescription" id=ListTaskDescription' + this.DieseasId +'>' + this.DieseasDescription + '</div>' +
                             '</div>');                     
                      AddEditCheck();
                  }                
             });            
            //When any EDIT link is clicked we grab the EDIT DIV's ID so that we know the taskID, TaskNameDIV, & TaskDescriptionDIV
             $('.EditIcon').click(function () {
                 debugger;
                 var EditClickedID = $(this).attr('id');
                 var EditListItemDiv = '.ListItems' + EditClickedID;
                 var EditTaskCheckBox = '#cbox' + EditClickedID;
                 var EditTaskNameDiv = '#ListTaskName' + EditClickedID;
                 var EditTaskDescriptionDiv = '#ListTaskDescription' + EditClickedID;
  //Find the current task's isComplete value and store it as a variable. If it's checked it will return "true" if not then it will return "false"
                 var CurrentTaskIsComplete = $('.TaskList').find('' + EditTaskCheckBox + '').prop('checked');   
                 //Find the current task's name and store it as a variable
                 var CurrentTaskName = $('.TaskList').find('' + EditTaskNameDiv + '').text();                
//Grabe the current task name HTML and replace it with an input box and populate the contents with the current task name variable
                 $('.TaskList').find('' + EditTaskNameDiv + '').html('<input class="UpdatedTaskName" id="UpdatedTaskName' + EditClickedID +'" type="text" value="' + CurrentTaskName +'"/>');
                 //Find the current task's description and store it as a variable
                 var CurrentTaskDescription = $('.TaskList').find('' + EditTaskDescriptionDiv + '').text();                
 //Grab the current task description text and replace it with an input box and populate the contents with the current task description variable
                 $('.TaskList').find('' + EditTaskDescriptionDiv + '').html('<input class="UpdatedTaskDescription" id="UpdatedTaskDescription' + EditClickedID +'" type="text" value="' + CurrentTaskDescription +'"/>');                
                 //Append cancel and save options
                 $('.TaskList').find('' + EditListItemDiv + '').append('<div class="Cancel Cancel' + EditClickedID +'">Cancel</div>');
                 $('.TaskList').find('' + EditListItemDiv + '').append('<div class="Save" id="' + EditClickedID + '">Save</div>');
                 $('.TaskList').find('' + EditListItemDiv + '').append('<div class="Delete" id="' + EditClickedID + '">Delete</div>');
                 //When the cancel button is clicked then set the fields back to the original values then remove the save & cancel buttons
                 $('.Cancel').click(function() {
                     $('.TaskList').find('' + EditTaskCheckBox + '').prop('checked', CurrentTaskIsComplete);
                     $('.TaskList').find('' + EditTaskNameDiv + '').html(CurrentTaskName);
                     $('.TaskList').find('' + EditTaskDescriptionDiv + '').html(CurrentTaskDescription);
                     $(this).remove();
                     $('.Save').remove();
                     $('.Delete').remove();
                 });                
//When the Save button is clicked then send the updated values to the database and set the text to the updated values then remove the save & cancel buttons
                 $('.Save').click(function() {
                     var SaveClickedID = $(this).attr('id');
                     var SaveTaskNameDiv = '#UpdatedTaskName' + SaveClickedID;
                     var SaveTaskDescriptionDiv = '#UpdatedTaskDescription' + SaveClickedID;
                     var SaveTaskCheckBox = '#cbox' + SaveClickedID;                    
                     var diseaseId = SaveClickedID;
                     var diseaseName = $('.TaskList').find('' + SaveTaskNameDiv + '').val();
                     var diseaseDescription = $('.TaskList').find('' + SaveTaskDescriptionDiv + '').val();
                     var IsActivated = $('.TaskList').find('' + SaveTaskCheckBox + '').prop('checked');
                     var diseaseToUpdate = {
                         DTU_DiseaseName: diseaseName,
                         DTU_DiseaseDescription: diseaseDescription,
                         DTU_IsActivated: IsActivated,
                         DTU_DiseaseId: diseaseId,
                     };
                     console.log(diseaseToUpdate);                    
                     var sf = $.ServicesFramework(<%:ModuleContext.ModuleId%>);
                     $.ajax({
                         url: '/DesktopModules/Dieseas/API/ModuleTask/UpdateDisease',
                         type: "POST",
                         contentType: "application/json",
                         beforeSend: sf.setModuleHeaders,
                         data: JSON.stringify(diseaseToUpdate),
                         success: function(data) {
                             loadTasks();
                         }
                     });
                     $(this).remove();
                     $('.Cancel').remove();
                     $('.Delete').remove();
                     
                 });
                 $('.Delete').click(function () {

                     var DeleteClickedID = $(this).attr('id');

                     $.dnnConfirm({
                         text: 'You sure you want to delete',
                         yesText: 'Yep,delete',
                         noText: 'Cancel',
                         title: 'Delete Confirmation',
                         callbackTrue: function () {
                             deleteTask(DeleteClickedID);
                         }
                     });

                     function deleteTask(DeleteClickedID) {
                         var diseaseID = DeleteClickedID;
                         var diseaseToDelete = {
                             DTD_DiseaseId: diseaseID,
                         };

                         var sf = $.ServicesFramework(<%:ModuleContext.ModuleId%>);

                         $.ajax({
                             url: '/DesktopModules/Dieseas/API/ModuleTask/DeleteDisease',
                             type: "POST",
                             contentType: "application/json",
                             beforeSend: sf.setModuleHeaders,
                             data: JSON.stringify(diseaseToDelete),
                             success: function (data) {
                                 loadTasks();
                             }
                         });
                     }
                 });
             });
         });
    }
    loadTasks();
    $('#btnAddTask').click(function() {       
        var diseaseName = $('#TaskName').val();
        var diseaseDescription = $('#TaskDescription').val();
        var isActivated = $('#cbxIsComplete').prop('checked');
        var diseaseToCreate = {
            DTC_DieseasName: diseaseName,
            DTC_DieseasDescription: diseaseDescription,
            DTC_isActivated: isActivated,
            DTC_ModuleID: moduleId,
            DTC_UserId: CurrentUserID
        };
        var sf = $.ServicesFramework(<%:ModuleContext.ModuleId%>);
        $.ajax({
            url: '/DesktopModules/Dieseas/API/ModuleTask/AddDieseas',
            type: "POST",
            contentType: "application/json",
            beforeSend: sf.setModuleHeaders,
            data: JSON.stringify(diseaseToCreate),
            success: function (data) {
                loadTasks();
            }
        });
    });
   

</script>
