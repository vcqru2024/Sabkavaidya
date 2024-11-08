/*
' Copyright (c) 2024 dipak tiwari
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using DotNetNuke.Data;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Users;
using DotNetNuke.Framework;
using DotNetNuke.Security.Roles;
using Saatvik.Modules.AddAppointment.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Saatvik.Modules.AddAppointment.Components
{
    internal interface IAppointmentManager
    {
        void CreateAppointment(AppointmentBooking appointment);
        void DeleteAppointment(int appointmentId, int moduleId);
        void DeleteAppointment(AppointmentBooking appointment);
        IEnumerable<AppointmentBooking> GetAppointments(int moduleId, UserInfo user, ModuleInfo moduleInfo);
        AppointmentBooking GetAppointment(int appointmentId, int moduleId);
        void UpdateAppointment(AppointmentBooking appointment);
        IEnumerable<SaatvikDoctorModule_Doctors> GetDoctorList();
        
    }

    internal class AppointmentManager : ServiceLocator<IAppointmentManager, AppointmentManager>, IAppointmentManager
    {
        public IEnumerable<SaatvikDoctorModule_Doctors> GetDoctorList()
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<SaatvikDoctorModule_Doctors>();
                return rep.Get();
            }
        }



        public void CreateAppointment(AppointmentBooking appointment)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<AppointmentBooking>();
                rep.Insert(appointment);
            }
        }

        public void DeleteAppointment(int appointmentId, int moduleId)
        {
            var appointment = GetAppointment(appointmentId, moduleId);
            DeleteAppointment(appointment);
        }

        public void DeleteAppointment(AppointmentBooking appointment)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<AppointmentBooking>();
                rep.Delete(appointment);
            }
        }
        public IEnumerable<AppointmentBooking> GetAppointments(int moduleId, UserInfo user, ModuleInfo moduleInfo)
        {
            IEnumerable<AppointmentBooking> appointments;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<AppointmentBooking>();

                // Filter appointments based on IsApproved setting for all users
                var isApprovedSetting = moduleInfo.ModuleSettings["AddAppointment_IsApproved"];
                var isApproved = isApprovedSetting != null && Convert.ToBoolean(isApprovedSetting);

                if (user.IsInRole("Administrators"))
                {
                    // Admin can see all appointments, apply additional setting-based filter if needed
                    var settingFilter = moduleInfo.ModuleSettings["AddAppointment_SettingFilter"]?.ToString() ?? string.Empty;
                    appointments = rep.Find($"WHERE ModuleId = @0 AND IsApproved = @1 {settingFilter}", moduleId, isApproved);
                }
                else
                {
                    // Non-admin user can only see their own appointments
                    appointments = rep.Find($"WHERE ModuleId = @0 AND IsApproved = @1 AND CreatedByUserId = @2", moduleId, isApproved, user.UserID);
                }
            }

            return appointments;
        }

        public AppointmentBooking GetAppointment(int appointmentId, int moduleId)
        {
            AppointmentBooking appointment;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<AppointmentBooking>();
                appointment = rep.GetById(appointmentId, moduleId);
            }
            return appointment;
        }

        public void UpdateAppointment(AppointmentBooking appointment)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<AppointmentBooking>();
                rep.Update(appointment);
            }
        }

        protected override System.Func<IAppointmentManager> GetFactory()
        {
            return () => new AppointmentManager();
        }
    }
}
