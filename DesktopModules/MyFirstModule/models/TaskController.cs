using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;

namespace Christoc.Modules.MyFirstModule.models
{
    public class TaskController
    {
        public IList<Task> GetTasks(int ModuleID)
        {
            return CBO.FillCollection<Task>(DataProvider.Instance().ExecuteReader("VCQRU_GetTasks", ModuleID));
        }
        public void AddTask(Task task)
        {
            task.TaskId = DataProvider.Instance().ExecuteScalar<int>("VCQRU_AddTask",
                                                      task.TaskName,
                                                      task.TaskDescription,
                                                      task.isCompleted,
                                                      task.ModuleId,
                                                       task.UserId
                                                        );
        }
        public void UpdateTask(Task task)
        {
            task.TaskId = DataProvider.Instance().ExecuteScalar<int>("VCQRU_UpdateTask",
                task.TaskId,
                task.TaskName,
                task.TaskDescription,
                task.isCompleted
                );
        }
        public void DeleteTask(int taskId)
        {
            DataProvider.Instance().ExecuteNonQuery("VCQRU_DeleteTask", taskId);
        }
        public IList<Task> GetIncompleteTasks(int ModuleId)
        {
            return CBO.FillCollection<Task>(DataProvider.Instance().ExecuteReader("VCQRU_GetIncompleteTasks", ModuleId));
        }

    }
}