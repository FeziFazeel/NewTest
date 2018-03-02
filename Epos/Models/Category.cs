using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Epos
{
    [Table("category")]
    public  class Category {
        public virtual  int Id { get; set; }
        public virtual  string Name { get; set; }
        public virtual  bool Status { get; set; }
        public virtual  DateTime CreatedDate { get; set; }
        public virtual  DateTime? ModifyDate { get; set; }
        public virtual  string CreatedBy { get; set; }
        public virtual  string ModifyBy { get; set; }
        public virtual  int? IdParent { get; set; }
        public bool IsNew { get
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
        public virtual string Image { get; set; }
        public virtual string Banner { get; set; }
        [NotMapped]
        public virtual string UpBanner { get; set; }
        [NotMapped]
        public virtual string UpImage { get; set; }
    }
}
