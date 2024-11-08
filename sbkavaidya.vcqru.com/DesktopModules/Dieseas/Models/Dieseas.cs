
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Saatvik.ModulesDieseas.Models
{
    public class Dieseas
    {
        public int DieseasId { get; set; }
        public string DieseasName { get; set; }
        public string DieseasDescription { get; set; }
        public bool isActivated { get; set; }
        public int ModuleId { get; set; }
        public int UserId { get; set; }
    }
}