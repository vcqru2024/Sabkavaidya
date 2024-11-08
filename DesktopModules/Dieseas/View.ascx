<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Saatvik.ModulesDieseas.View" %>


<div class="TaskList"></div>
<script type="text/javascript">
    debugger;
    var moduleId = <%= ModuleId %>;
    var CurrentUserID = <%= UserId %>;
    var ShowCompletedTasks = '<%= Settings["showActivatedDisease"].ToString() %>';
    function loadTasks() {
        if (ShowCompletedTasks == "True") {
            GetTasksVariableURL = "/DesktopModules/Dieseas/API/ModuleTask/GetDisease?moduleId=" + moduleId;
        }
        else {
            GetTasksVariableURL = "/DesktopModules/Dieseas/API/ModuleTask/GetActivatedDisease?moduleId=" + moduleId;
        }
        $.getJSON(

            GetTasksVariableURL,
            function (result) {
                $('.TaskList').html("");
                var parsedTaskJSONObject = jQuery.parseJSON(result);
                $.each(parsedTaskJSONObject, function () {
                        $('.TaskList').append(
                            '<div class="ListItems ListItems' + this.DieseasId + '" id="ListItem' + this.DieseasId + '">' +
                            '<div class="checkbox checkbox' + this.DieseasId + '"id="checkbox"><input class="cbxListIsComplete" id ="cbox' + this.DieseasId + '"type="checkbox"/></div>' +
                            '<div class="ListTaskName" id="ListTaskName' + this.DieseasId + '">' + this.DieseasName + '</div>' +
                            '<div class="ListTaskDescription" id=ListTaskDescription' + this.DieseasId + '>' + this.DieseasDescription + '</div>' +
                            '</div>');
                });
            });
    }
    loadTasks();
</script>
