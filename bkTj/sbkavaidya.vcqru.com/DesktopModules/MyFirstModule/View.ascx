﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.MyFirstModule.View" %>
<div class="AddTaskDiv">
    <h2>Add Task</h2>
    <hr />
    <div class="lblTaskName">Task Name</div>
    <input id="TaskName" type="text" />
     <div class="lblTaskDescription">Task Description</div>
     <input id="TaskDescription" type="text" />
     <div class="isCompleteGroup">
         <input id="cbxIsComplete" type="checkbox" />
         <div class="lblTaskIsComplete">Is Complete</div>
     </div>
     <input class="dnnClear dnnRight dnnPrimaryAction" id="btnAddTask" type="button" value="Add Task" />
</div>

<div class="TaskListDiv">
      <div class="Headings">
            <h2>Complete</h2>
            <h2>Task Name</h2>
            <h2>Task Description</h2>
            <hr/>
      </div> 
     <div class="TaskList"></div>
</div>



<script type ="text/javascript" >
    var moduleId = <%= ModuleId %>;
    var CurrentUserID = <%= UserId %>;
    var ShowCompletedTasks = '<%= Settings["ShowCompletedTasks"].ToString() %>';
    function loadTasks() {
        debugger;
        if (ShowCompletedTasks == "True") {
            GetTasksVariableURL = "/DesktopModules/MyFirstModule/API/ModuleTask/GetTasks?moduleId=" + moduleId;
        }
        else {
            GetTasksVariableURL = "/DesktopModules/MyFirstModule/API/ModuleTask/GetIncompleteTasks?moduleId=" + moduleId;
        }
        $.getJSON(
            GetTasksVariableURL,
         function (result) {
             $('.TaskList').html("");
             var parsedTaskJSONObject = jQuery.parseJSON(result);    
             $.each(parsedTaskJSONObject, function () {                
                 //Defines object's UserId & TaskId as variableS so they're accessble inside of function
                 var objectUID = this.UserId;
                 var objectTaskID = this.TaskId;
                
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
                 if (this.isCompleted == true) {
                     debugger;
                     $('.TaskList').append(
                             '<div class="ListItems ListItems' + this.TaskId +'" id="ListItem' + this.TaskId +'">' +
                                '<div class="checkbox checkbox' + this.TaskId + '"id="checkbox"><input class="cbxListIsComplete" id="cbox' + this.TaskId + '"type="checkbox" checked/></div>' +
                                '<div class="ListTaskName" id="ListTaskName' + this.TaskId +'">' + this.TaskName + '</div>' +
                                '<div class="ListTaskDescription" id=ListTaskDescription' + this.TaskId +'>' + this.TaskDescription + '</div>' +
                             '</div>');
                      AddEditCheck();
                  }
                 else {
                      $('.TaskList').append(
                              '<div class="ListItems ListItems' + this.TaskId +'" id="ListItem' + this.TaskId +'">' +
                                '<div class="checkbox checkbox' + this.TaskId + '"id="checkbox"><input class="cbxListIsComplete" id ="cbox' + this.TaskId + '"type="checkbox"/></div>' +
                                '<div class="ListTaskName" id="ListTaskName' + this.TaskId +'">' + this.TaskName + '</div>' +
                                '<div class="ListTaskDescription" id=ListTaskDescription' + this.TaskId +'>' + this.TaskDescription + '</div>' +
                             '</div>');                     
                      AddEditCheck();
                  }                
             });            
             //When any EDIT link is clicked we grab the EDIT DIV's ID so that we know the taskID, TaskNameDIV, & TaskDescriptionDIV
             debugger;
             $('.EditIcon').click(function() {
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
                     var taskId = SaveClickedID;
                     var taskName = $('.TaskList').find('' + SaveTaskNameDiv + '').val();
                     var taskDescription = $('.TaskList').find('' + SaveTaskDescriptionDiv + '').val();
                     var isComplete = $('.TaskList').find('' + SaveTaskCheckBox + '').prop('checked');
                     var taskToUpdate = {
                         TTU_TaskName: taskName,
                         TTU_TaskDescription: taskDescription,
                         TTU_isCompleted: isComplete,
                         TTU_TaskID: taskId,
                     };
                     console.log(taskToUpdate);                    
                     var sf = $.ServicesFramework(<%:ModuleContext.ModuleId%>);
                     $.ajax({
                         url: '/DesktopModules/MyFirstModule/API/ModuleTask/UpdateTask',
                         type: "POST",
                         contentType: "application/json",
                         beforeSend: sf.setModuleHeaders,
                         data: JSON.stringify(taskToUpdate),
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

                     // Create a Bootstrap modal for confirmation
                     var confirmationModal = $('<div class="modal fade" tabindex="-1" role="dialog">' +
                         '<div class="modal-dialog" role="document">' +
                         '<div class="modal-content">' +
                         '<div class="modal-header">' +
                         '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>' +
                         '<h4 class="modal-title">Delete Confirmation</h4>' +
                         '</div>' +
                         '<div class="modal-body">' +
                         '<p>You sure you want to delete?</p>' +
                         '</div>' +
                         '<div class="modal-footer">' +
                         '<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>' +
                         '<button type="button" class="btn btn-danger" id="confirmDeleteBtn">Yep, delete</button>' +
                         '</div>' +
                         '</div>' +
                         '</div>' +
                         '</div>');

                     // Append the modal to the body and show it
                     $('body').append(confirmationModal);
                     confirmationModal.modal('show');

                     // Handle confirmation when the "Yep, delete" button is clicked
                     $('#confirmDeleteBtn').click(function () {
                         confirmationModal.modal('hide'); // Hide the modal
                         deleteTask(DeleteClickedID); // Call your deleteTask function
                     });

                     // Remove the modal from the DOM after it's hidden
                     confirmationModal.on('hidden.bs.modal', function () {
                         confirmationModal.remove();
                     });
                 });

                 // Your deleteTask function remains the same
                 function deleteTask(DeleteClickedID) {
                     var taskId = DeleteClickedID;
                     var taskToDelete = {
                         TTD_TaskID: taskId,
                     };

                     var sf = $.ServicesFramework(<%:ModuleContext.ModuleId%>);

                     $.ajax({
                         url: '/DesktopModules/MyFirstModule/API/ModuleTask/DeleteTask',
                         type: "POST",
                         contentType: "application/json",
                         beforeSend: sf.setModuleHeaders,
                         data: JSON.stringify(taskToDelete),
                         success: function (data) {
                             loadTasks();
                         }
                     });
                 }

             });   
         });
    }
    loadTasks();
    $('#btnAddTask').click(function() {       
        var taskName = $('#TaskName').val();
        var taskDescription = $('#TaskDescription').val();
        var isComplete = $('#cbxIsComplete').prop('checked');
        var taskToCreate = {
            TTC_TaskName: taskName,
            TTC_TaskDescription: taskDescription,
            TTC_isCompleted: isComplete,
            TTC_ModuleID: moduleId,
            TTC_UserID: CurrentUserID
        };
        var sf = $.ServicesFramework(<%:ModuleContext.ModuleId%>);
        $.ajax({
            url: '/DesktopModules/MyFirstModule/API/ModuleTask/AddTask',
            type: "POST",
            contentType: "application/json",
            beforeSend: sf.setModuleHeaders,
            data: JSON.stringify(taskToCreate),
            success: function (data) {
                loadTasks();
            }
        });
    });
</script>

