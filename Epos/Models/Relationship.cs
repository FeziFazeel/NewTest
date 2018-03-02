using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Epos
{
    [Table("relationship")]
    public class Relationship {
        [Key]
        public int IdRelationship { get; set; }
        public int IdCategory { get; set; }
        public int IdProduct { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string ModifyBy { get; set; }
    }
}
