using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Epos
{
    [Table("uom")]
    public class Uom {
        public virtual int Id { get; set; }
        public virtual string Name { get; set; }
        public virtual int Status { get; set; }
        public virtual DateTime CreatedDate { get; set; }
        public virtual DateTime? ModifyDate { get; set; }
        public virtual string CreatedBy { get; set; }
        public virtual string ModifyBy { get; set; }
        public bool IsNew
        {
            get
            {
                if (this.Id == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}
