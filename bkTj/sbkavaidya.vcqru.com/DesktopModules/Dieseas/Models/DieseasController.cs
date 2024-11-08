using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;
using Saatvik.ModulesDieseas.Models;

namespace Saatvik.ModulesDieseas.Models
{
    public class DieseasController
    {
        public IList<Dieseas> GetDisease(int ModuleID)
        {
            return CBO.FillCollection<Dieseas>(DataProvider.Instance().ExecuteReader("Saatvik_GetDisease", ModuleID));
        }
        public void AddDieseas(Dieseas dieseas)
        {
            dieseas.DieseasId = DataProvider.Instance().ExecuteScalar<int>("Saatvik_AddDieseas",
                                                      dieseas.DieseasName,
                                                      dieseas.DieseasDescription,
                                                      dieseas.isActivated,
                                                      dieseas.ModuleId,
                                                       dieseas.UserId
                                                        );
        }
        public void UpdateDisease(Dieseas dieseas)
        {
            dieseas.DieseasId = DataProvider.Instance().ExecuteScalar<int>("Saatvik_UpdateDisease",
                                                                            dieseas.DieseasId,
                                                                            dieseas.DieseasName,
                                                                            dieseas.DieseasDescription,
                                                                            dieseas.isActivated
                                             );
        }
        public void DeleteDisease(int diseaseId)
        {
            DataProvider.Instance().ExecuteNonQuery("Saatvik_DeleteDisease", diseaseId);
        }
        public IList<Dieseas> GetActivatedDisease(int ModuleId)
        {
            return CBO.FillCollection<Dieseas>(DataProvider.Instance().ExecuteReader("Saatvik_GetActivatedDisease", ModuleId));
        }
    }
}