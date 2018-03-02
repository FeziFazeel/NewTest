using System;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Epos
{
    [Table("product")]
    public class Product {
        public virtual int Id { get; set; }
        public virtual string Title { get; set; }
        public virtual string Image { get; set; }
        public virtual float Quantity { get; set; }
        public virtual string Unit { get; set; }
        public virtual string Description { get; set; }
        public virtual float? Price { get; set; }
        public virtual string Code { get; set; }
        public virtual int Status { get; set; }
        public virtual DateTime CreatedDate { get; set; }
        public virtual string CreatedBy { get; set; }
        public virtual DateTime? ModifyDate { get; set; }
        public virtual string ModifyBy { get; set; }
        public virtual int? IdSupplier { get; set; }
        public virtual bool IsFeature { get; set; }
        public virtual bool IsDiscount { get; set; }
        public virtual float? Discountprice { get; set; }
        public virtual int? MinimumStockLevel { get; set; }
        public virtual int? PackOf { get; set; }
        public virtual bool IsNew
        {
            get
            {
                if (this.Id == 0)
                {
                    return true;
                }
                return false;
            }
        }
        [NotMapped]
        public string GetQuantity {
        get
            {
              int Items = (int)(this.Quantity/this.PackOf);                                
              int SubItems= int.Parse((this.Quantity % this.PackOf).ToString());
                return Items+"."+SubItems;
            }

        }
        [NotMapped]
        public decimal GetPrice
        {
            get
            {
                decimal Items = (decimal)(this.Price * this.PackOf);
                return Items;
            }

        }

    }
}
