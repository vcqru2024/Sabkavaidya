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

using DotNetNuke.Common.Utilities;
using DotNetNuke.ComponentModel.DataAnnotations;
using DotNetNuke.Entities.Content;
using System;
using System.Web.Caching;

namespace Saatvik.Modules.AddAppointment.Models
{
    [TableName("AddAppointment_Appointments")]
    [PrimaryKey("AppointmentId", AutoIncrement = true)]
    [Cacheable("Appointments", CacheItemPriority.Default, 20)]
    [Scope("ModuleId")]
    public class AppointmentBooking
    {
        public int AppointmentId { get; set; } = -1;
        public string PatientName { get; set; }
        public string PatientPhone { get; set; }
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public DateTime AppointmentDate { get; set; }
        public TimeSpan AppointmentTime { get; set; }
        public bool IsApproved { get; set; } // New property added

        public int ModuleId { get; set; }
        public int CreatedByUserId { get; set; } = -1;
        public int LastModifiedByUserId { get; set; } = -1;
        public DateTime CreatedOnDate { get; set; } = DateTime.UtcNow;
        public DateTime LastModifiedOnDate { get; set; } = DateTime.UtcNow;
    }
}
