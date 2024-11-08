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
using Saatvik.Modules.AddDisease.Models;
using System.Collections.Generic;

namespace Saatvik.Modules.AddDisease.Components
{
    internal interface IDiseaseManager
    {
        void CreateDisease(Disease disease);
        void DeleteDisease(int diseaseId, int moduleId);
        void DeleteDisease(Disease disease);
        IEnumerable<Disease> GetDiseases(int moduleId);
        Disease GetDisease(int diseaseId, int moduleId);
        void UpdateDisease(Disease disease);
    }


    internal class DiseaseManager : ServiceLocator<IDiseaseManager, DiseaseManager>, IDiseaseManager
    {
        public void CreateDisease(Disease disease)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Disease>();
                rep.Insert(disease);
            }
        }

        public void DeleteDisease(int diseaseId, int moduleId)
        {
            var disease = GetDisease(diseaseId, moduleId);
            DeleteDisease(disease);
        }

        public void DeleteDisease(Disease disease)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Disease>();
                rep.Delete(disease);
            }
        }

        public IEnumerable<Disease> GetDiseases(int moduleId)
        {
            IEnumerable<Disease> diseases;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Disease>();
                diseases = rep.Get(moduleId);
            }
            return diseases;
        }

        public Disease GetDisease(int diseaseId, int moduleId)
        {
            Disease disease;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Disease>();
                disease = rep.GetById(diseaseId, moduleId);
            }
            return disease;
        }

        public void UpdateDisease(Disease disease)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Disease>();
                rep.Update(disease);
            }
        }

        protected override System.Func<IDiseaseManager> GetFactory()
        {
            return () => new DiseaseManager();
        }
    }

}
