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
using DotNetNuke.Framework;
using Saatvik.Modules.AddDoctor.Models;
using System.Collections.Generic;
using System.Linq;

namespace Saatvik.Modules.AddDoctor.Components
{
    internal interface IDoctorManager
    {
        void CreateDoctor(Doctor doctor);
        void DeleteDoctor(int doctorId, int moduleId);
        void DeleteDoctor(Doctor doctor);
        IEnumerable<Doctor> GetDoctors(int moduleId);
        Doctor GetDoctor(int doctorId, int moduleId);
        void UpdateDoctor(Doctor doctor);
        int GetTotalDoctors(int moduleId);
    }

    internal class DoctorManager : ServiceLocator<IDoctorManager, DoctorManager>, IDoctorManager
    {
        public void CreateDoctor(Doctor doctor)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Doctor>();
                rep.Insert(doctor);
            }
        }

        public void DeleteDoctor(int doctorId, int moduleId)
        {
            var doctor = GetDoctor(doctorId, moduleId);
            DeleteDoctor(doctor);
        }

        public void DeleteDoctor(Doctor doctor)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Doctor>();
                rep.Delete(doctor);
            }
        }

        public IEnumerable<Doctor> GetDoctors(int moduleId)
        {
            IEnumerable<Doctor> doctors;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Doctor>();
                doctors = rep.Get(moduleId);
            }
            return doctors;
        }

        public Doctor GetDoctor(int doctorId, int moduleId)
        {
            Doctor doctor;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Doctor>();
                doctor = rep.GetById(doctorId, moduleId);
            }
            return doctor;
        }

        public void UpdateDoctor(Doctor doctor)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Doctor>();
                rep.Update(doctor);
            }
        }

        protected override System.Func<IDoctorManager> GetFactory()
        {
            return () => new DoctorManager();
        }
        public int GetTotalDoctors(int moduleId)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Doctor>();
                return rep.Get(moduleId).Count();
            }
        }
    }
}
