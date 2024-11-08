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

namespace Saatvik.Modules.AddDoctor.Models
{
    [TableName("SaatvikDoctorModule_Doctors")]
    [PrimaryKey("DoctorId", AutoIncrement = true)]
    [Cacheable("Doctor_Model", CacheItemPriority.Default, 20)]
    [Scope("ModuleId")]
    public class Doctor
    {
        ///<summary>
        /// The ID of the doctor
        ///</summary>
        public int DoctorId { get; set; } = -1;

        ///<summary>
        /// The name of the doctor
        ///</summary>
        public string Name { get; set; }

        ///<summary>
        /// The URL or path of the doctor's image
        ///</summary>
        public string ImageUrl { get; set; }

        ///<summary>
        /// The rating of the doctor
        ///</summary>
        public decimal Rating { get; set; }

        ///<summary>
        /// The degree(s) of the doctor
        ///</summary>
        public string Degree { get; set; }

        ///<summary>
        /// The experience of the doctor in years
        ///</summary>
        public int Experience { get; set; }

        ///<summary>
        /// The location of the doctor
        ///</summary>
        public string Location { get; set; }
        ///<summary>
        /// The ModuleId of where the doctor was created and gets displayed
        ///</summary>
        public int ModuleId { get; set; }

        ///<summary>
        /// The user id of the user who created the doctor
        ///</summary>
        public int CreatedByUserId { get; set; } = -1;

        ///<summary>
        /// The user id of the user who last updated the doctor
        ///</summary>
        public int LastModifiedByUserId { get; set; } = -1;

        ///<summary>
        /// The date the doctor was created
        ///</summary>
        public DateTime CreatedOnDate { get; set; } = DateTime.UtcNow;

        ///<summary>
        /// The date the doctor was last updated
        ///</summary>
        public DateTime LastModifiedOnDate { get; set; } = DateTime.UtcNow;
    }
}
